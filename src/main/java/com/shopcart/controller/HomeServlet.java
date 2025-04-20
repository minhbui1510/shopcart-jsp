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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDAO productDAO;

    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get the latest products for the homepage
            List<Product> latestProducts = productDAO.getAllProducts();

            // Limit to only showing the 4 most recent products on home page
            if (latestProducts.size() > 4) {
                latestProducts = latestProducts.subList(0, 4);
            }

            // Set products as a request attribute
            request.setAttribute("latestProducts", latestProducts);

            // Forward to the home page
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Forward to error page or handle exception
            response.getWriter().println("Error loading products: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}