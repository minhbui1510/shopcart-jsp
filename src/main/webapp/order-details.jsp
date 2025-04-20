<%-- order-details.jsp --%>
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
            <li class="breadcrumb-item"><a href="order">Đơn hàng của tôi</a></li>
            <li class="breadcrumb-item active" aria-current="page">Đơn hàng #${order.id}</li>
        </ol>
    </nav>

    <div class="card">
        <div class="card-header bg-primary text-white">
            <div class="d-flex justify-content-between align-items-center">
                <h4 class="mb-0">Chi Tiết Đơn Hàng #${order.id}</h4>
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
            </div>
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
                <table class="table table-striped">
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

            <c:if test="${order.orderStatus eq 'pending'}">
                <div class="mt-3">
                    <form action="order" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn hủy đơn hàng này không?');">
                        <input type="hidden" name="action" value="cancel">
                        <input type="hidden" name="orderId" value="${order.id}">
                        <button type="submit" class="btn btn-danger">Hủy đơn hàng</button>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>