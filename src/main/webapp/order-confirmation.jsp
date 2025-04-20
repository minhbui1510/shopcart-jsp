<%-- order-confirmation.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Xác Nhận Đơn Hàng - Cửa Hàng Trực Tuyến</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
  <div class="jumbotron text-center">
    <h1 class="display-4">Cảm ơn bạn!</h1>
    <p class="lead">Đơn hàng của bạn đã được đặt thành công.</p>
    <hr class="my-4">
    <p>Mã đơn hàng của bạn là: <strong>#${orderId}</strong></p>
    <p>Chúng tôi đã gửi email xác nhận đến địa chỉ email của bạn.</p>
    <div class="mt-4">
      <a class="btn btn-primary btn-lg mr-2" href="products" role="button">Tiếp tục mua sắm</a>
      <a class="btn btn-info btn-lg" href="order?action=view&id=${orderId}" role="button">Xem chi tiết đơn hàng</a>
    </div>
  </div>

  <div class="card mt-4">
    <div class="card-header bg-success text-white">
      <h4 class="mb-0">Chi Tiết Đơn Hàng #${order.id}</h4>
    </div>
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <h5>Thông tin đơn hàng</h5>
          <p><strong>Ngày đặt hàng:</strong> <fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/></p>
          <p><strong>Phương thức thanh toán:</strong>
            <c:choose>
              <c:when test="${order.paymentMethod eq 'cash'}">Thanh toán khi nhận hàng</c:when>
              <c:when test="${order.paymentMethod eq 'banking'}">Chuyển khoản</c:when>
              <c:otherwise>${order.paymentMethod}</c:otherwise>
            </c:choose>
          </p>
        </div>
        <div class="col-md-6">
          <h5>Địa chỉ giao hàng</h5>
          <p>${order.shippingAddress}</p>
        </div>
      </div>

      <h5 class="mt-4">Sản phẩm</h5>
      <div class="table-responsive">
        <table class="table">
          <thead>
          <tr>
            <th>Sản phẩm</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th class="text-right">Thành tiền</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${order.orderItems}" var="item">
            <tr>
              <td>${item.productName}</td>
              <td>${item.price} VND</td>
              <td>${item.quantity}</td>
              <td class="text-right">${item.subtotal} VND</td>
            </tr>
          </c:forEach>
          </tbody>
          <tfoot>
          <tr>
            <td colspan="3" class="text-right"><strong>Tổng cộng:</strong></td>
            <td class="text-right"><strong>${order.totalAmount} VND</strong></td>
          </tr>
          </tfoot>
        </table>
      </div>

      <div class="alert alert-info mt-3">
        <i class="fas fa-info-circle"></i> Trạng thái đơn hàng của bạn hiện tại là <strong>Chờ xử lý</strong>. Chúng tôi sẽ sớm xử lý đơn hàng và thông báo cho bạn khi có cập nhật mới.
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