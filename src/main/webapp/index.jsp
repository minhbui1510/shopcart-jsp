<%-- index.jsp - Product Listing Page --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cửa Hàng Trực Tuyến - Sản Phẩm</title>
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
        .filter-box {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .filter-title {
            font-weight: bold;
            border-bottom: 1px solid #e9ecef;
            padding-bottom: 10px;
            margin-bottom: 15px;
        }
        .price-inputs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .price-inputs input {
            width: 45%;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <c:if test="${isAdmin == true}">
            <a href="products?action=add" class="btn btn-success">
                <i class="fas fa-plus"></i> Thêm sản phẩm
            </a>
        </c:if>
    </div>

    <div class="row">
        <!-- Products List Column -->
        <div class="col-md-9">
            <div class="row" id="productList">
                <c:forEach items="${products}" var="product">
                    <div class="col-md-4 product-item" data-price="${product.price}" data-name="${product.name}">
                        <div class="card product-card">
                            <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title">${product.name}</h5>
                                <p class="card-text">${product.price} VND</p>
                                <div class="d-flex justify-content-between">
                                    <a href="products?action=details&id=${product.id}" class="btn btn-primary">Xem Chi Tiết</a>
                                    <form action="cart" method="post">
                                        <input type="hidden" name="action" value="add">
                                        <input type="hidden" name="productId" value="${product.id}">
                                        <input type="hidden" name="quantity" value="1">
                                        <button type="submit" class="btn btn-success">Thêm Vào Giỏ</button>
                                    </form>
                                </div>

                                <c:if test="${isAdmin == true}">
                                    <div class="admin-controls mt-2">
                                        <div class="d-flex justify-content-between">
                                            <a href="products?action=edit&id=${product.id}" class="btn btn-warning btn-sm">Sửa</a>
                                            <a href="#" onclick="confirmDelete(${product.id})" class="btn btn-danger btn-sm">Xoá</a>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Filter Column -->
        <div class="col-md-3">
            <div class="filter-box">
                <h5 class="filter-title">Lọc Sản Phẩm</h5>

                <!-- Search by Name -->
                <div class="form-group">
                    <label for="searchName">Tìm Kiếm Theo Tên:</label>
                    <input type="text" class="form-control" id="searchName" placeholder="Nhập tên sản phẩm...">
                </div>

                <!-- Filter by Price -->
                <div class="form-group">
                    <label>Lọc Theo Giá:</label>
                    <div class="price-inputs">
                        <input type="number" class="form-control" id="minPrice" placeholder="Tối thiểu">
                        <input type="number" class="form-control" id="maxPrice" placeholder="Tối đa">
                    </div>
                </div>

                <!-- Filter Button -->
                <button id="applyFilters" class="btn btn-primary btn-block">Áp Dụng Bộ Lọc</button>
                <button id="resetFilters" class="btn btn-outline-secondary btn-block mt-2">Đặt Lại</button>
            </div>

            <!-- Additional filters could go here -->
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
    function confirmDelete(productId) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
            window.location.href = "products?action=delete&id=" + productId;
        }
    }

    // Filter functionality
    document.addEventListener('DOMContentLoaded', function() {
        const applyFiltersBtn = document.getElementById('applyFilters');
        const resetFiltersBtn = document.getElementById('resetFilters');
        const searchName = document.getElementById('searchName');
        const minPrice = document.getElementById('minPrice');
        const maxPrice = document.getElementById('maxPrice');
        const productItems = document.querySelectorAll('.product-item');

        applyFiltersBtn.addEventListener('click', function() {
            const nameFilter = searchName.value.toLowerCase();
            const minPriceValue = minPrice.value ? parseFloat(minPrice.value) : 0;
            const maxPriceValue = maxPrice.value ? parseFloat(maxPrice.value) : Infinity;

            productItems.forEach(item => {
                const price = parseFloat(item.getAttribute('data-price'));
                const name = item.getAttribute('data-name').toLowerCase();

                const matchesName = name.includes(nameFilter);
                const matchesPrice = price >= minPriceValue && price <= maxPriceValue;

                if (matchesName && matchesPrice) {
                    item.style.display = '';
                } else {
                    item.style.display = 'none';
                }
            });
        });

        resetFiltersBtn.addEventListener('click', function() {
            searchName.value = '';
            minPrice.value = '';
            maxPrice.value = '';

            productItems.forEach(item => {
                item.style.display = '';
            });
        });
    });
</script>
</body>
</html>