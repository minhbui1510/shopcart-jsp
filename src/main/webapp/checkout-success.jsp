<%-- checkout-success.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation - Online Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
    <div class="jumbotron text-center">
        <h1 class="display-4">Thank You!</h1>
        <p class="lead">Your order has been placed successfully.</p>
        <hr class="my-4">
        <p>An email confirmation has been sent to your email address.</p>
        <a class="btn btn-primary btn-lg" href="products" role="button">Continue Shopping</a>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
