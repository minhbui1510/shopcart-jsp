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

        // Redirect to login if user is not logged in
        if (user == null) {
            response.sendRedirect("login?redirect=checkout");
            return;
        }

        // Check if cart is empty
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        // Forward to checkout page
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Redirect to login if user is not logged in
        if (user == null) {
            response.sendRedirect("login?redirect=checkout");
            return;
        }

        // Get cart from session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        // Validate checkout form fields
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String shippingAddress = request.getParameter("shippingAddress");
        String paymentMethod = request.getParameter("paymentMethod");

        boolean isValid = true;
        if (fullName == null || fullName.trim().isEmpty()) {
            request.setAttribute("fullNameError", "Vui lòng nhập họ tên");
            isValid = false;
        }

        if (email == null || email.trim().isEmpty() || !email.contains("@")) {
            request.setAttribute("emailError", "Vui lòng nhập email hợp lệ");
            isValid = false;
        }

        if (shippingAddress == null || shippingAddress.trim().isEmpty()) {
            request.setAttribute("addressError", "Vui lòng nhập địa chỉ");
            isValid = false;
        }

        if (paymentMethod == null || paymentMethod.trim().isEmpty()) {
            request.setAttribute("paymentError", "Vui lòng chọn phương thức thanh toán");
            isValid = false;
        }

        if (!isValid) {
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }

        // Forward to OrderServlet to create the order
        request.getRequestDispatcher("/order").forward(request, response);
    }
}