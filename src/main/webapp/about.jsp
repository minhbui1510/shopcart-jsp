<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới Thiệu - VIVOTEK</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <style>
        .about-section {
            padding: 50px 0;
        }
        .section-title {
            position: relative;
            margin-bottom: 30px;
            color: #007bff;
            text-align: center;
            font-weight: bold;
            padding-bottom: 15px;
        }
        .section-title:after {
            content: '';
            display: block;
            width: 80px;
            height: 3px;
            background: #007bff;
            margin: 15px auto 0;
        }
        .about-content {
            line-height: 1.8;
            color: #333;
            text-align: justify;
        }
        .about-image {
            border-radius: 5px;
            overflow: hidden;
            margin-bottom: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .company-values {
            background-color: #f8f9fa;
            padding: 40px 0;
            margin-top: 40px;
        }
        .value-item {
            text-align: center;
            margin-bottom: 30px;
        }
        .value-icon {
            font-size: 40px;
            color: #007bff;
            margin-bottom: 15px;
        }
        .team-section {
            padding: 50px 0;
        }
        .team-member {
            text-align: center;
            margin-bottom: 30px;
        }
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 5px solid #f8f9fa;
        }
        .divider {
            border-bottom: 1px solid #dee2e6;
            margin: 30px 0;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container about-section">
    <h1 class="section-title">GIỚI THIỆU TỔNG QUAN</h1>

    <div class="row">
        <div class="col-lg-12">
            <div class="about-content">
                <p>
                    Công ty TNHH Thương mại – Dịch vụ – Tin học và Viễn thông Trường Tiến là một trong những công ty cung cấp thiết bị và giải pháp
                    hàng đầu cho các công ty, xí nghiệp, viễn thông, thiết kế mạng thông tin và đặc biệt là hệ thống camera giám sát. Công ty hoạt động
                    chính trong lĩnh vực: Thiết bị giám sát, thẻ mở cửa và hệ thống khoá tự động, nhà thông minh, camera truyền hình ảnh qua mạng
                    lan hoặc internet.
                </p>

                <p>
                    Chúng tôi đã tư vấn, thiết kế hệ thống bảo vệ an toàn, kiểm soát cửa thông minh, các giải pháp camera quan sát như: camera giám
                    sát ngân hàng, camera giám sát giao thông, camera giám sát văn phòng, camera giám sát khu công nghiệp và nhà xưởng, camera
                    giám sát bãi giữ xe... và các giải pháp dùng trong tự động hoá đáp ứng được nhu cầu đa dạng và được sự tin tưởng, tín nhiệm của
                    nhiều quý khách hàng trong cả nước.
                </p>

                <p>
                    Được thành lập vào năm 2006, Công ty TNHH Thương mại - Dịch vụ - Tin học và Viễn thông Trường Tiến luôn đi đầu trong các lĩnh
                    vực bảo an và tự động hoá. Với phương châm phục vụ "Vì Lợi ích Của Khách Hàng Là Trên Hết" cùng đội ngũ kỹ sư lành nghề, kỹ
                    thuật nhiều kinh nghiệm được đào tạo trong & ngoài nước, chúng tôi luôn mong muốn mang đến cho Quý khách hàng những sản
                    phẩm chất lượng cao, những giải pháp ứng dụng tối ưu và hiện đại nhất với chi phí hợp lý, thái độ phục vụ tận tâm, chuyên nghiệp.
                </p>

                <p>
                    Bên cạnh đó, với sự hậu thuẫn và hỗ trợ của các tập đoàn, các hãng sản xuất lớn, có uy tín khắp nơi trên thế giới như MOXA,
                    SAHO, DENTEC, NEON, VGUARD, MOBOTIX, VIVOTEK, REXTON... đã góp phần không nhỏ trong sự thành công của chúng
                    tôi.
                </p>
            </div>
        </div>
    </div>
</div>

<div class="company-values">
    <div class="container">
        <h2 class="section-title">GIÁ TRỊ CỐT LÕI</h2>

        <div class="row">
            <div class="col-md-4">
                <div class="value-item">
                    <div class="value-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <h4>Chất Lượng</h4>
                    <p>Cam kết mang đến những sản phẩm và dịch vụ chất lượng cao nhất cho khách hàng.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="value-item">
                    <div class="value-icon">
                        <i class="fas fa-handshake"></i>
                    </div>
                    <h4>Uy Tín</h4>
                    <p>Xây dựng niềm tin với khách hàng thông qua sự minh bạch và cam kết với những gì chúng tôi hứa hẹn.</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="value-item">
                    <div class="value-icon">
                        <i class="fas fa-lightbulb"></i>
                    </div>
                    <h4>Sáng Tạo</h4>
                    <p>Không ngừng đổi mới và cập nhật công nghệ hiện đại để mang đến những giải pháp tối ưu nhất.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container about-section">
    <h2 class="section-title">TẦM NHÌN & SỨ MỆNH</h2>

    <div class="row">
        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title text-center mb-4"><i class="fas fa-eye mr-2 text-primary"></i> Tầm Nhìn</h4>
                    <p class="card-text">
                        Trở thành một trong những công ty hàng đầu trong lĩnh vực cung cấp thiết bị và giải pháp an ninh,
                        tự động hoá tại Việt Nam. Mang đến những sản phẩm, dịch vụ chất lượng cao với chi phí hợp lý nhất.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card mb-4">
                <div class="card-body">
                    <h4 class="card-title text-center mb-4"><i class="fas fa-bullseye mr-2 text-primary"></i> Sứ Mệnh</h4>
                    <p class="card-text">
                        Cung cấp các sản phẩm, dịch vụ và giải pháp tối ưu trong lĩnh vực an ninh và tự động hoá,
                        giúp khách hàng nâng cao hiệu quả hoạt động kinh doanh và bảo vệ tài sản của họ một cách an toàn.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="divider"></div>

<jsp:include page="footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>