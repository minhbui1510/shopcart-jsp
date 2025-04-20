<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên Hệ - VIVOTEK</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        .contact-form {
            background-color: #f8f9fa;
            border-radius: 5px;
            padding: 20px;
        }
        .contact-info {
            margin-top: 30px;
        }
        .section-title {
            position: relative;
            margin-bottom: 30px;
            color: #007bff;
        }
        .section-title:after {
            content: '';
            display: block;
            width: 50px;
            height: 3px;
            background: #007bff;
            margin-top: 10px;
        }
        .contact-details li {
            margin-bottom: 15px;
        }
        .map-container {
            height: 400px;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-4 mb-5">
    <h1 class="section-title">LIÊN HỆ</h1>

    <div class="row">
        <div class="col-md-6">
            <div class="contact-form">
                <h4 class="mb-4">Gửi tin nhắn cho chúng tôi</h4>
                <form action="contact" method="post">
                    <div class="form-group">
                        <label for="name">HỌ & TÊN (*)</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">SỐ ĐIỆN THOẠI (*)</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                    </div>

                    <div class="form-group">
                        <label for="email">ĐỊA CHỈ EMAIL (*)</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="subject">CHỦ ĐỀ</label>
                        <select class="form-control" id="subject" name="subject">
                            <option selected>—Vui lòng chọn—</option>
                            <option>Hỗ trợ kỹ thuật</option>
                            <option>Tư vấn sản phẩm</option>
                            <option>Bảo hành</option>
                            <option>Hợp tác kinh doanh</option>
                            <option>Khác</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="message">NỘI DUNG (*)</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>

                    <p class="text-muted small">Chú ý: Những trường đánh (*) là bắt buộc nhập</p>

                    <button type="submit" class="btn btn-primary btn-block">GỬI EMAIL</button>
                </form>
            </div>
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMessage}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </c:if>
        </div>

        <div class="col-md-6">
            <div class="contact-info">
                <h4 class="mb-4">CÔNG TY TNHH THƯƠNG MẠI - DỊCH VỤ - TIN HỌC VÀ VIỄN THÔNG TRƯỜNG TIỀN</h4>

                <h5 class="mt-4">TRỤ SỞ CHÍNH:</h5>
                <ul class="list-unstyled contact-details">
                    <li>
                        <i class="fas fa-map-marker-alt mr-2 text-primary"></i>
                        <strong>Địa chỉ:</strong> 82 Trần Văn Kiểu, Phường 10, Quận 6, TP.Hồ Chí Minh
                    </li>
                    <li>
                        <i class="fas fa-phone-alt mr-2 text-primary"></i>
                        <strong>Tel:</strong> 028 38 337 328 | <strong>Hotline:</strong> 090915 1617 | 090909 7928
                    </li>
                </ul>

                <h5 class="mt-4">VĂN PHÒNG HÀ NỘI:</h5>
                <ul class="list-unstyled contact-details">
                    <li>
                        <i class="fas fa-map-marker-alt mr-2 text-primary"></i>
                        <strong>Địa chỉ:</strong> Phòng 668, Tầng 6 Toà nhà MD COMPLEX, 68 Nguyễn Cơ Thạch, Phường Cầu Diễn, Quận Nam Từ Liêm, TP.Hà Nội
                    </li>
                    <li>
                        <i class="fas fa-phone-alt mr-2 text-primary"></i>
                        <strong>Hotline:</strong> 0918 796 888 - 082764 2288
                    </li>
                </ul>

                <h5 class="mt-4">THÔNG TIN LIÊN HỆ KHÁC:</h5>
                <ul class="list-unstyled contact-details">
                    <li>
                        <i class="fas fa-envelope mr-2 text-primary"></i>
                        <strong>Kinh doanh | Dự án 1:</strong> welcome@vivotek.vn - 090915 1617
                    </li>
                    <li>
                        <i class="fas fa-envelope mr-2 text-primary"></i>
                        <strong>Kinh doanh | Dự án 2:</strong> welcome@ion.vn - 090909 7928
                    </li>
                    <li>
                        <i class="fas fa-envelope mr-2 text-primary"></i>
                        <strong>Kinh doanh:</strong> 090909 1248 - 090909 2158 - 082764 2288
                    </li>
                    <li>
                        <i class="fas fa-headset mr-2 text-primary"></i>
                        <strong>Kỹ thuật:</strong> support@vivotek.vn | Hot line (24/7): 090909 1247, 090909 1245
                    </li>
                    <li>
                        <i class="fas fa-tools mr-2 text-primary"></i>
                        <strong>Bảo hành & CSKH:</strong> cskh@vivotek.vn | Hot line (24/7): 094613 7788
                    </li>
                    <li>
                        <i class="fas fa-clock mr-2 text-primary"></i>
                        <strong>Thời gian làm việc:</strong> Từ thứ 2 đến thứ 6<br>
                        <span class="ml-4">Sáng: 8h00 đến 12h00 - Chiều: 13h00 đến 17h00</span>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>