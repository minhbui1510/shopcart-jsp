package com.shopcart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ContactServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simply forward to the contact.jsp page
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Here you would typically process the form data
        // For example, sending an email or saving to database

        // For now, just add a success message and redirect back to contact page
        request.setAttribute("successMessage", "Cảm ơn " + name + "! Chúng tôi đã nhận được tin nhắn của bạn và sẽ phản hồi sớm.");

        // Forward back to the contact page
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }
}