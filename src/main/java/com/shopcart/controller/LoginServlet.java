package com.shopcart.controller;

import com.shopcart.dao.UserDAO;
import com.shopcart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            // User is already logged in
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("login".equals(action)) {
            // Process login
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (userDAO.validateUser(username, password)) {
                User user = userDAO.getUserByUsername(username);
                HttpSession session = request.getSession();
                session.setAttribute("user", user);

                // Redirect to original intended URL if available
                String redirectURL = (String) session.getAttribute("redirectAfterLogin");
                if (redirectURL != null) {
                    session.removeAttribute("redirectAfterLogin");
                    response.sendRedirect(request.getContextPath() + redirectURL);
                } else {
                    response.sendRedirect(request.getContextPath() + "/products");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else if ("register".equals(action)) {
            // Process registration
            User newUser = new User();
            newUser.setUsername(request.getParameter("username"));
            newUser.setPassword(request.getParameter("password"));
            newUser.setEmail(request.getParameter("email"));
            newUser.setFullName(request.getParameter("fullName"));
            newUser.setAddress(request.getParameter("address"));

            userDAO.registerUser(newUser);

            request.setAttribute("message", "Registration successful! Please login.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
