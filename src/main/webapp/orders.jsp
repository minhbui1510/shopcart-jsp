<%-- orders.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đơn Hàng Của Tôi - Cửa Hàng Trực Tuyến</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
  <h1>Đơn Hàng Của Tôi</h1>

  <c:choose>
    <c:when test="${empty orders}">
      <div class="alert alert-info mt-3">
        Bạn chưa có đơn hàng nào. <a href="products">Tiếp tục mua sắm</a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="list-group mt-3">
        <c:forEach items="${orders}" var="order">
          <a href="order?action=view&id=${order.id}" class="list-group-item list-group-item-action">
            <div class="d-flex w-100 justify-content-between">
              <h5 class="mb-1">Đơn hàng #${order.id}</h5>
              <small><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/></small>
            </div>
            <p class="mb-1">
                            <span class="badge
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
            </p>
            <div class="d-flex w-100 justify-content-between">
                            <span>Phương thức thanh toán:
                                <c:choose>
                                  <c:when test="${order.paymentMethod eq 'cash'}">Thanh toán khi nhận hàng</c:when>
                                  <c:when test="${order.paymentMethod eq 'banking'}">Chuyển khoản</c:when>
                                  <c:otherwise>${order.paymentMethod}</c:otherwise>
                                </c:choose>
                            </span>
              <strong>Tổng tiền: ${order.totalAmount} VND</strong>
            </div>
          </a>
        </c:forEach>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>