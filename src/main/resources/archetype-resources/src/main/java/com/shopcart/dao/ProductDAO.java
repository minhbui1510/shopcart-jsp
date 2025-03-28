package com.shopcart.dao;

import com.shopcart.model.Product;
import com.shopcart.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    // CREATE
    public void addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO products (name, price, description, image, stock) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, product.getDescription());
            stmt.setString(4, product.getImage());
            stmt.setInt(5, product.getStock());
            stmt.executeUpdate();
        }
    }

    // READ ALL
    public List<Product> getAllProducts() throws SQLException {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image"),
                        rs.getInt("stock")
                );
                products.add(product);
            }
        }
        return products;
    }

    // READ BY ID
    public Product getProductById(int id) throws SQLException {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getString("image"),
                            rs.getInt("stock")
                    );
                }
            }
        }
        return null;
    }

    // UPDATE
    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE products SET name=?, price=?, description=?, image=?, stock=? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setString(3, product.getDescription());
            stmt.setString(4, product.getImage());
            stmt.setInt(5, product.getStock());
            stmt.setInt(6, product.getId());
            stmt.executeUpdate();
        }
    }

    // DELETE
    public void deleteProduct(int id) throws SQLException {
        String sql = "DELETE FROM products WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}