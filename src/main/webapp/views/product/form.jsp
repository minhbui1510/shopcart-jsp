<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product != null ? 'Edit Product' : 'Add New Product'}</title>
</head>
<body>
<h1>${product != null ? 'Edit Product' : 'Add New Product'}</h1>

<form action="products" method="post">
    <input type="hidden" name="action" value="${product != null ? 'update' : 'create'}">

    <c:if test="${product != null}">
        <input type="hidden" name="id" value="${product.id}">
    </c:if>

    <label>Name:</label>
    <input type="text" name="name" value="${product.name}" required><br>

    <label>Price:</label>
    <input type="number" name="price" value="${product.price}" step="0.01" required><br>

    <label>Description:</label>
    <textarea name="description">${product.description}</textarea><br>

    <label>Image URL:</label>
    <input type="text" name="image" value="${product.image}"><br>

    <label>Stock:</label>
    <input type="number" name="stock" value="${product.stock}" required><br>

    <input type="submit" value="${product != null ? 'Update' : 'Create'}">
</form>

<a href="products">Back to List</a>
</body>
</html>