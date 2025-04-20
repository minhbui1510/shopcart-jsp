<%-- login.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập - Cửa Hàng Trực Tuyến</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        .card {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            margin-bottom: 30px;
        }
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid rgba(0, 0, 0, 0.125);
            font-weight: bold;
        }
        .btn-primary {
            background-color: #13599f;
            border-color: #13599f;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-5">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4><i class="fas fa-sign-in-alt mr-2"></i>Đăng Nhập</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">
                            <i class="fas fa-exclamation-circle mr-2"></i>${errorMessage}
                        </div>
                    </c:if>
                    <c:if test="${not empty message}">
                        <div class="alert alert-success" role="alert">
                            <i class="fas fa-check-circle mr-2"></i>${message}
                        </div>
                    </c:if>
                    <form action="login" method="post">
                        <input type="hidden" name="action" value="login">
                        <div class="form-group">
                            <label for="username">Tên đăng nhập</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Đăng Nhập</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4><i class="fas fa-user-plus mr-2"></i>Đăng Ký</h4>
                </div>
                <div class="card-body">
                    <form action="login" method="post">
                        <input type="hidden" name="action" value="register">
                        <div class="form-group">
                            <label for="regUsername">Tên đăng nhập</label>
                            <input type="text" class="form-control" id="regUsername" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="regPassword">Mật khẩu</label>
                            <input type="password" class="form-control" id="regPassword" name="password" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="fullName">Họ và tên</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" required>
                        </div>
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-success btn-block">Đăng Ký</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<!-- Fix for Bootstrap Dropdown error -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>