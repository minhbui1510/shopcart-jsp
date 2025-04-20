<%-- index.jsp - Product Listing Page --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Store - Products</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .product-card {
            margin-bottom: 20px;
            transition: transform 0.3s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .admin-controls {
            margin-top: 10px;
            border-top: 1px solid #eee;
            padding-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h1>Our Products</h1>
        <c:if test="${isAdmin == true}">
            <a href="products?action=add" class="btn btn-success">
                <i class="fas fa-plus"></i> Add New Product
            </a>
        </c:if>
    </div>

    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-4">
                <div class="card product-card">
                    <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.price} USD</p>
                        <div class="d-flex justify-content-between">
                            <a href="products?action=details&id=${product.id}" class="btn btn-primary">View Details</a>
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="productId" value="${product.id}">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-success">Add to Cart</button>
                            </form>
                        </div>

                        <c:if test="${isAdmin == true}">
                            <div class="admin-controls mt-2">
                                <div class="d-flex justify-content-between">
                                    <a href="products?action=edit&id=${product.id}" class="btn btn-warning btn-sm">Edit</a>
                                    <a href="#" onclick="confirmDelete(${product.id})" class="btn btn-danger btn-sm">Delete</a>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
    function confirmDelete(productId) {
        if (confirm("Are you sure you want to delete this product?")) {
            window.location.href = "products?action=delete&id=" + productId;
        }
    }
</script>
</body>
</html>