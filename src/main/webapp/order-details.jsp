<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Đơn Hàng #${order.id} - Cửa Hàng Trực Tuyến</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/order">Đơn hàng</a></li>
            <li class="breadcrumb-item active" aria-current="page">Chi tiết đơn hàng #${order.id}</li>
        </ol>
    </nav>

    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h3>Chi tiết đơn hàng #${order.id}</h3>
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

            <c:if test="${user.role eq 'admin'}">
                <div class="dropdown">
                    <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Cập nhật trạng thái
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <form action="order" method="post">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="id" value="${order.id}">
                            <button type="submit" name="status" value="pending" class="dropdown-item">Chờ xử lý</button>
                            <button type="submit" name="status" value="processing" class="dropdown-item">Đang xử lý</button>
                            <button type="submit" name="status" value="shipped" class="dropdown-item">Đang giao hàng</button>
                            <button type="submit" name="status" value="delivered" class="dropdown-item">Đã giao hàng</button>
                            <div class="dropdown-divider"></div>
                            <button type="submit" name="status" value="cancelled" class="dropdown-item text-danger">Hủy đơn hàng</button>
                        </form>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="card-body">
            <div class="row mb-4">
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
                    <c:if test="${order.updatedAt != null}">
                        <p><strong>Cập nhật lần cuối:</strong> <fmt:formatDate value="${order.updatedAt}" pattern="dd/MM/yyyy HH:mm"/></p>
                    </c:if>
                </div>
                <div class="col-md-6">
                    <h5>Thông tin giao hàng</h5>
                    <p><strong>Địa chỉ:</strong> ${order.shippingAddress}</p>
                    <c:if test="${user.role eq 'admin'}">
                        <p><strong>Khách hàng:</strong> ${order.username}</p>
                    </c:if>
                </div>
            </div>

            <h5>Sản phẩm đã đặt</h5>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-light">
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${order.orderItems}" var="item">
                        <tr>
                            <td>${item.productName}</td>
                            <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                            <td>${item.quantity}</td>
                            <td><fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="3" class="text-right">Tổng tiền:</th>
                        <th><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
        <div class="card-footer">
            <a href="${pageContext.request.contextPath}/order" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Quay lại danh sách đơn hàng
            </a>
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