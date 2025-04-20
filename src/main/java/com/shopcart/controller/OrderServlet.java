package com.shopcart.controller;

import com.shopcart.dao.OrderDAO;
import com.shopcart.dao.ProductDAO;
import com.shopcart.model.Cart;
import com.shopcart.model.CartItem;
import com.shopcart.model.Order;
import com.shopcart.model.OrderItem;
import com.shopcart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        orderDAO = new OrderDAO();
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Redirect to login if user is not logged in
        if (user == null) {
            response.sendRedirect("login?redirect=order");
            return;
        }

        String action = request.getParameter("action");

        if (action != null && action.equals("view")) {
            // View a specific order
            int orderId = Integer.parseInt(request.getParameter("id"));
            Order order = orderDAO.getOrderById(orderId);

            // Check if order belongs to current user
            if (order != null && order.getUserId() == user.getId()) {
                request.setAttribute("order", order);
                request.getRequestDispatcher("/order-details.jsp").forward(request, response);
            } else {
                response.sendRedirect("orders");
            }
        } else {
            // View all orders for the current user
            List<Order> orders = orderDAO.getOrdersByUserId(user.getId());
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("/orders.jsp").forward(request, response);
        }
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

        // Check if all products have enough stock
        boolean allProductsInStock = true;
        StringBuilder outOfStockProducts = new StringBuilder();

        for (CartItem cartItem : cart.getItems()) {
            if (!productDAO.hasEnoughStock(cartItem.getProduct().getId(), cartItem.getQuantity())) {
                allProductsInStock = false;
                outOfStockProducts.append(cartItem.getProduct().getName()).append(", ");
            }
        }

        if (!allProductsInStock) {
            request.setAttribute("errorMessage", "Không đủ số lượng trong kho cho sản phẩm: " +
                    outOfStockProducts.substring(0, outOfStockProducts.length() - 2));
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            return;
        }

        // Get checkout information
        String shippingAddress = request.getParameter("shippingAddress");
        String paymentMethod = request.getParameter("paymentMethod");

        // Create order
        Order order = new Order();
        order.setUserId(user.getId());
        order.setTotalAmount(cart.getTotalPrice());
        order.setShippingAddress(shippingAddress);
        order.setPaymentMethod(paymentMethod);

        // Insert order and get order ID
        int orderId = orderDAO.createOrder(order);

        if (orderId > 0) {
            // Add order items
            for (CartItem cartItem : cart.getItems()) {
                OrderItem orderItem = new OrderItem(
                        orderId,
                        cartItem.getProduct().getId(),
                        cartItem.getQuantity(),
                        cartItem.getProduct().getPrice()
                );
                order.addOrderItem(orderItem);
            }

            // Insert order items
            boolean itemsAdded = orderDAO.addOrderItems(orderId, order.getOrderItems());

            if (itemsAdded) {
                // Reduce stock quantity for each product
                boolean stockReduced = true;
                for (OrderItem item : order.getOrderItems()) {
                    boolean success = productDAO.reduceStockQuantity(item.getProductId(), item.getQuantity());
                    if (!success) {
                        stockReduced = false;
                        break;
                    }
                }

                if (stockReduced) {
                    // Clear cart after successful order
                    session.removeAttribute("cart");

                    // Redirect to order confirmation page
                    request.setAttribute("orderId", orderId);
                    request.setAttribute("order", orderDAO.getOrderById(orderId));
                    request.getRequestDispatcher("/order-confirmation.jsp").forward(request, response);
                } else {
                    // If stock reduction fails, we should handle this case
                    // In a real system, you would roll back the order creation
                    request.setAttribute("errorMessage", "Có lỗi xảy ra khi cập nhật số lượng tồn kho. Vui lòng thử lại sau.");
                    request.getRequestDispatcher("/checkout.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Có lỗi xảy ra khi xử lý đơn hàng. Vui lòng thử lại sau.");
                request.getRequestDispatcher("/checkout.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi tạo đơn hàng. Vui lòng thử lại sau.");
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        }
    }
}