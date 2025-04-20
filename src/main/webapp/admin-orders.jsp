<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Đơn Hàng - Cửa Hàng Trực Tuyến</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        .status-badge {
            min-width: 100px;
            text-align: center;
        }
        .order-row:hover {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
    <h1>Quản Lý Đơn Hàng</h1>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${errorMessage}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${empty orders}">
            <div class="alert alert-info mt-3">
                Không có đơn hàng nào.
            </div>
        </c:when>
        <c:otherwise>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Ngày đặt</th>
                        <th>Trạng thái</th>
                        <th>Phương thức thanh toán</th>
                        <th>Tổng tiền</th>
                        <th>Thao tác</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr class="order-row">
                            <td>#${order.id}</td>
                            <td>${order.username}</td>
                            <td><fmt:formatDate value="${order.createdAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                            <td>
                  <span class="badge status-badge
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
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${order.paymentMethod eq 'cash'}">Thanh toán khi nhận hàng</c:when>
                                    <c:when test="${order.paymentMethod eq 'banking'}">Chuyển khoản</c:when>
                                    <c:otherwise>${order.paymentMethod}</c:otherwise>
                                </c:choose>
                            </td>
                            <td><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                            <td>
                                <div class="btn-group">
                                    <a href="order?action=view&id=${order.id}" class="btn btn-sm btn-primary">
                                        <i class="fas fa-eye"></i> Chi tiết
                                    </a>
                                    <button type="button" class="btn btn-sm btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-edit"></i> Cập nhật
                                    </button>
                                    <div class="dropdown-menu">
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
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>