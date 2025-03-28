package com.shopcart.controller;

import com.shopcart.dao.ProductDAO;
import com.shopcart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            // Display all products
            List<Product> productList = productDAO.getAllProducts();
            request.setAttribute("products", productList);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (action.equals("details")) {
            // Display product details
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);

            request.setAttribute("product", product);
            request.getRequestDispatcher("/product-details.jsp").forward(request, response);
        }
    }
}