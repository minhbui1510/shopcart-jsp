<%-- product-details.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${product.name} - Online Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
    <div class="row">
        <div class="col-md-6">
            <img src="${product.imageUrl}" alt="${product.name}" class="img-fluid">
        </div>
        <div class="col-md-6">
            <h1>${product.name}</h1>
            <p class="lead">${product.price} USD</p>
            <p>${product.description}</p>

            <form action="cart" method="post" class="mb-3">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="productId" value="${product.id}">

                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="${product.stockQuantity}" class="form-control w-25">
                </div>

                <button type="submit" class="btn btn-primary btn-lg">Thêm vào giỏ hàng</button>
            </form>

            <div class="mt-3">
                <p>Available Stock: ${product.stockQuantity}</p>
            </div>

            <a href="products" class="btn btn-secondary mt-3">Quay lại</a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>