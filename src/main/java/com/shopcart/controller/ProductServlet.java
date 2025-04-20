package com.shopcart.controller;

import com.shopcart.dao.ProductDAO;
import com.shopcart.model.Product;
import com.shopcart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Check if user is logged in and get user role
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;
        boolean isAdmin = (currentUser != null && currentUser.isAdmin());
        System.out.println("user: " + currentUser);
        System.out.println("isAdmin: " + isAdmin);
        // Add isAdmin attribute to the request (for use in JSPs)
        request.setAttribute("isAdmin", isAdmin);

        // Get filter parameters (if any)
        String nameFilter = request.getParameter("name");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");

        Double minPrice = minPriceStr != null && !minPriceStr.isEmpty() ? Double.parseDouble(minPriceStr) : null;
        Double maxPrice = maxPriceStr != null && !maxPriceStr.isEmpty() ? Double.parseDouble(maxPriceStr) : null;

        if (action == null) {
            // Display all products (with optional filtering)
            List<Product> productList;
            if (nameFilter != null || minPrice != null || maxPrice != null) {
                productList = productDAO.getFilteredProducts(nameFilter, minPrice, maxPrice);
            } else {
                productList = productDAO.getAllProducts();
            }
            request.setAttribute("products", productList);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else if (action.equals("details")) {
            // Display product details
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);

            request.setAttribute("product", product);
            request.getRequestDispatcher("/product-details.jsp").forward(request, response);
        } else if (action.equals("add") && isAdmin) {
            // Show add product form (admin only)
            request.getRequestDispatcher("/product-form.jsp").forward(request, response);
        } else if (action.equals("edit") && isAdmin) {
            // Show edit product form (admin only)
            int productId = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductById(productId);

            request.setAttribute("product", product);
            request.getRequestDispatcher("/product-form.jsp").forward(request, response);
        } else if (action.equals("delete") && isAdmin) {
            // Delete product (admin only)
            int productId = Integer.parseInt(request.getParameter("id"));
            productDAO.deleteProduct(productId);

            response.sendRedirect("products");
        } else {
            // Unauthorized or unknown action, redirect to product listing
            response.sendRedirect("products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Check if user is logged in and has admin role
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("user") : null;
        boolean isAdmin = (currentUser != null && currentUser.isAdmin());

        if (!isAdmin) {
            response.sendRedirect("products");
            return;
        }

        // Process admin actions
        if ("save".equals(action)) {
            // Get form parameters
            String productIdStr = request.getParameter("id");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            String imageUrl = request.getParameter("imageUrl");
            int stockQuantity = Integer.parseInt(request.getParameter("stockQuantity"));

            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setImageUrl(imageUrl);
            product.setStockQuantity(stockQuantity);

            boolean success;
            if (productIdStr != null && !productIdStr.isEmpty()) {
                // Update existing product
                int productId = Integer.parseInt(productIdStr);
                product.setId(productId);
                success = productDAO.updateProduct(product);
            } else {
                // Add new product
                success = productDAO.addProduct(product);
            }

            if (success) {
                response.sendRedirect("products");
            } else {
                request.setAttribute("error", "Failed to save the product");
                request.setAttribute("product", product);
                request.getRequestDispatcher("/product-form.jsp").forward(request, response);
            }
        } else if ("filter".equals(action)) {
            // Handle filtering (redirecting to GET with parameters)
            String nameFilter = request.getParameter("name");
            String minPrice = request.getParameter("minPrice");
            String maxPrice = request.getParameter("maxPrice");

            StringBuilder redirectUrl = new StringBuilder("products?");
            if (nameFilter != null && !nameFilter.isEmpty()) {
                redirectUrl.append("name=").append(nameFilter).append("&");
            }
            if (minPrice != null && !minPrice.isEmpty()) {
                redirectUrl.append("minPrice=").append(minPrice).append("&");
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                redirectUrl.append("maxPrice=").append(maxPrice).append("&");
            }

            response.sendRedirect(redirectUrl.toString());
        } else {
            response.sendRedirect("products");
        }
    }
}