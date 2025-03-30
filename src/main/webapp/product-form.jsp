<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Store - ${empty product.id ? 'Add New' : 'Edit'} Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header">
                    <h4>${empty product.id ? 'Add New' : 'Edit'} Product</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger" role="alert">
                                ${error}
                        </div>
                    </c:if>

                    <form action="products" method="post">
                        <input type="hidden" name="action" value="save">
                        <input type="hidden" name="id" value="${product.id}">

                        <div class="form-group">
                            <label for="name">Product Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required>${product.description}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="price">Price (USD)</label>
                            <input type="number" step="0.01" min="0" class="form-control" id="price" name="price" value="${product.price}" required>
                        </div>

                        <div class="form-group">
                            <label for="imageUrl">Image URL</label>
                            <input type="text" class="form-control" id="imageUrl" name="imageUrl" value="${product.imageUrl}" required>
                        </div>

                        <div class="form-group">
                            <label for="stockQuantity">Stock Quantity</label>
                            <input type="number" min="0" class="form-control" id="stockQuantity" name="stockQuantity" value="${product.stockQuantity}" required>
                        </div>

                        <div class="form-group text-right">
                            <a href="products" class="btn btn-secondary">Cancel</a>
                            <button type="submit" class="btn btn-primary">Save Product</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>