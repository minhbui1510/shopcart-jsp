<%-- orders.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đơn Hàng Của Tôi</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <style>
    .order-card {
      transition: transform 0.2s ease;
      margin-bottom: 15px;
    }
    .order-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }
    .order-status {
      font-size: 0.9rem;
      padding: 5px 10px;
    }
    .card-header {
      font-weight: bold;
    }
    .order-details {
      color: #495057;
    }
    .order-total {
      font-weight: bold;
      font-size: 1.1rem;
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
  <h1 class="mb-4">Đơn Hàng Của Tôi</h1>

  <c:if test="${not empty successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        ${successMessage}
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
  </c:if>

  <c:choose>
    <c:when test="${empty orders}">
      <div class="alert alert-info mt-3">
        <i class="fas fa-info-circle mr-2"></i> Bạn chưa có đơn hàng nào.
        <a href="${pageContext.request.contextPath}/products" class="alert-link">Tiếp tục mua sắm</a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="row">
        <c:forEach items="${orders}" var="order">
          <div class="col-md-6">
            <div class="card order-card">
              <div class="card-header d-flex justify-content-between align-items-center">
                <span>Đơn hàng #${order.id}</span>
                <span class="badge order-status
                  <c:choose>
                    <c:when test="${order.orderStatus eq 'pending'}">badge-warning</c:when>
                    <c:when test="${order.orderStatus eq 'processing'}">badge-info</c:when>
                    <c:when test="${order.orderStatus eq 'shipped'}">badge-primary</c:when>
                    <c:when test="${order.orderStatus eq 'delivered'}">badge-success</c:when>
                    <c:when test="${order.orderStatus eq 'cancelled'}">badge-danger</c:when>
                    <c:otherwise>badge-secondary</c:otherwise>
                  </c:choose>
                ">
                  <c:choose>
                    <c:when test="${order.orderStatus eq 'pending'}">Chờ xử lý</c:when>
                    <c:when test="${order.orderStatus eq 'processing'}">Đang xử lý</c:when>
                    <c:when test="${order.orderStatus eq 'shipped'}">Đang giao hàng</c:when>
                    <c:when test="${order.orderStatus eq 'delivered'}">Đã giao hàng</c:when>
                    <c:when test="${order.orderStatus eq 'cancelled'}">Đã hủy</c:when>
                    <c:otherwise>${order.orderStatus}</c:otherwise>
                  </c:choose>
                </span>
              </div>
              <div class="card-body">
                <p class="order-details">
                  <i class="far fa-calendar-alt"></i>
                  <strong>Ngày đặt:</strong> <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                </p>
                <p class="order-details">
                  <i class="fas fa-truck"></i>
                  <strong>Địa chỉ:</strong> ${order.shippingAddress}
                </p>
                <p class="order-details">
                  <i class="fas fa-money-bill-wave"></i>
                  <strong>Thanh toán:</strong>
                  <c:choose>
                    <c:when test="${order.paymentMethod eq 'cash'}">Thanh toán khi nhận hàng</c:when>
                    <c:when test="${order.paymentMethod eq 'banking'}">Chuyển khoản</c:when>
                    <c:otherwise>${order.paymentMethod}</c:otherwise>
                  </c:choose>
                </p>
                <p class="order-total text-right">
                  <strong>Tổng tiền:</strong> <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                </p>
              </div>
              <div class="card-footer text-center">
                <a href="order?action=view&id=${order.id}" class="btn btn-primary">
                  <i class="fas fa-eye"></i> Xem chi tiết
                </a>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<jsp:include page="footer.jsp" />

<!-- Fix for Bootstrap Dropdown error -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>