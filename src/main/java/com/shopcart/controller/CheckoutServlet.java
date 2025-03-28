package com.shopcart.controller;

import com.shopcart.model.Cart;
import com.shopcart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check if user is logged in
        if (user == null) {
            // Store the intended URL to redirect back after login
            session.setAttribute("redirectAfterLogin", "/checkout");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Check if cart has items
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Process payment (simplified for demonstration)
        String paymentMethod = request.getParameter("paymentMethod");
        String shippingAddress = request.getParameter("shippingAddress");

        // Generate order and save to database (not implemented in this demo)

        // Clear the cart
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.clear();
        }

        // Show order confirmation
        request.setAttribute("orderComplete", true);
        request.getRequestDispatcher("/checkout-success.jsp").forward(request, response);
    }
}