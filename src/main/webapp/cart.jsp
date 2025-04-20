<%-- cart.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart - Online Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
    <h1>Your Shopping Cart</h1>

    <c:choose>
        <c:when test="${empty cart.items}">
            <div class="alert alert-info mt-3">
                Your cart is empty. <a href="products">Continue shopping</a>
            </div>
        </c:when>
        <c:otherwise>
            <table class="table table-striped mt-3">
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart.items}" var="item">
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="${item.product.imageUrl}" alt="${item.product.name}" class="img-thumbnail mr-2" style="width: 50px; height: 50px; object-fit: cover;">
                                <span>${item.product.name}</span>
                            </div>
                        </td>
                        <td>${item.product.price} USD</td>
                        <td>
                            <form action="cart" method="post" class="form-inline">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="productId" value="${item.product.id}">
                                <input type="number" name="quantity" value="${item.quantity}" min="1" class="form-control mr-2" style="width: 60px;">
                                <button type="submit" class="btn btn-sm btn-secondary">Update</button>
                            </form>
                        </td>
                        <td>${item.subtotal} USD</td>
                        <td>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="${item.product.id}">
                                <button type="submit" class="btn btn-sm btn-danger">
                                    <i class="fas fa-trash"></i> Remove
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="3" class="text-right"><strong>Total:</strong></td>
                    <td><strong>${cart.totalPrice} USD</strong></td>
                    <td></td>
                </tr>
                </tfoot>
            </table>

            <div class="d-flex justify-content-between mt-3">
                <a href="products" class="btn btn-secondary">Continue Shopping</a>
                <div>
                    <form action="cart" method="post" class="d-inline mr-2">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" class="btn btn-warning">Clear Cart</button>
                    </form>
                    <a href="checkout" class="btn btn-success">Proceed to Checkout</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min