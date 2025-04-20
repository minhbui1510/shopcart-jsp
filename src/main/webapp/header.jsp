<%-- header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #13599f">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img src="https://www.vivotek.vn/wp-content/uploads/2021/06/vivotek-logo-n-w.webp" height="40" alt="VIVOTEK">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" style="color: white" href="${pageContext.request.contextPath}/products">SẢN PHẨM</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: white" href="${pageContext.request.contextPath}/about">GIỚI THIỆU</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: white" href="${pageContext.request.contextPath}/contact">LIÊN HỆ</a>
                </li>
            </ul>
<%--            <div class="ml-auto">--%>
<%--                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary ml-2">ĐĂNG NHẬP</a>--%>
<%--            </div>--%>
            <ul class="navbar-nav ml-auto">
                <c:choose>
                    <c:when test="${empty user}">
                        <li class="nav-item">
                            <a class="nav-link btn btn-outline-primary ml-2 text-white" href="${pageContext.request.contextPath}/login">ĐĂNG NHẬP</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="${pageContext.request.contextPath}/cart">
                                <i class="fas fa-shopping-cart"></i>
                                <c:if test="${not empty cart and cart.totalItems > 0}">
                                    <span class="badge badge-pill badge-light">${cart.totalItems}</span>
                                </c:if>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${user.fullName}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/order">My Orders</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>