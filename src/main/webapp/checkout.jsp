<%-- checkout.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - Online Store</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-4">
    <div class="row mt-4">
        <div class="col-md-8">
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">Thông tin vận chuyển</h5>
                </div>
                <div class="card-body">
                    <form action="checkout" method="post" id="checkoutForm">
                        <div class="form-group">
                            <label for="fullName">Họ và tên</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                        </div>

                        <div class="form-group">
                            <label for="shippingAddress">Địa chỉ</label>
                            <textarea class="form-control" id="shippingAddress" name="shippingAddress" rows="3" required>${user.address}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="paymentMethod">Phương thức thanh toán</label>
                            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                                <option value="">Chọn phương thức</option>
                                <option value="cash">Thanh toán khi nhận hàng</option>
                                <option value="banking">Chuyển khoản</option>
                            </select>
                        </div>

                        <div id="creditCardDetails" class="d-none">
                            <div class="form-group">
                                <label for="cardNumber">Card Number</label>
                                <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="XXXX XXXX XXXX XXXX">
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="expiryDate">Expiry Date</label>
                                        <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cvv">CVV</label>
                                        <input type="text" class="form-control" id="cvv" name="cvv" placeholder="XXX">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg mt-3">Đặt hàng</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Thanh toán khi nhận hàng</h5>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <c:forEach items="${cart.items}" var="item">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 class="my-0">${item.product.name}</h6>
                                    <small class="text-muted">Số lượng: ${item.quantity}</small>
                                </div>
                                <span class="text-muted">${item.subtotal} VND</span>
                            </li>
                        </c:forEach>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Tổng (VND)</span>
                            <strong>${cart.totalPrice} VND</strong>
                        </li>
                    </ul>
                </div>
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