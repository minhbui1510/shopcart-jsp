package com.shopcart.controller;

import com.shopcart.dao.ProductDAO;
import com.shopcart.model.Cart;
import com.shopcart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if (action.equals("add")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            Product product = productDAO.getProductById(productId);
            if (product != null) {
                cart.addItem(product, quantity);
            }

            response.sendRedirect(request.getContextPath() + "/products");
        } else if (action.equals("update")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cart.updateItemQuantity(productId, quantity);
            response.sendRedirect(request.getContextPath() + "/cart");
        } else if (action.equals("remove")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            cart.removeItem(productId);
            response.sendRedirect(request.getContextPath() + "/cart");
        } else if (action.equals("clear")) {
            cart.clear();
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }
}