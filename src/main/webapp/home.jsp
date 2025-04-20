<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VIVOTEK - Camera & Giải pháp An ninh</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        .hero-section {
            position: relative;
            height: 500px;
            background-image: url('${pageContext.request.contextPath}/assets/images/hero-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
        }

        .feature-box {
            border-radius: 5px;
            overflow: hidden;
            transition: transform 0.3s;
            margin-bottom: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .feature-box:hover {
            transform: translateY(-5px);
        }

        .product-card {
            border: none;
            transition: transform 0.3s;
            margin-bottom: 20px;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-img {
            height: 200px;
            object-fit: contain;
            padding: 15px;
        }

        .project-item {
            position: relative;
            overflow: hidden;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .project-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 15px;
        }

        .news-card {
            border: none;
            transition: transform 0.3s;
            margin-bottom: 20px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .news-card:hover {
            transform: translateY(-5px);
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
        .carousel-item {
            height: 500px;
        }

        .carousel-item img {
            object-fit: cover;
            height: 100%;
            width: 100%;
        }

        .carousel-caption {
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 5px;
            max-width: 600px;
            margin: 0 auto;
            bottom: 50%;
            transform: translateY(50%);
        }
    </style>
</head>
<body>

<!-- Include Header -->
<jsp:include page="header.jsp" />

<!-- Image Slider -->
<div id="heroCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#heroCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#heroCarousel" data-slide-to="1"></li>
        <li data-target="#heroCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="https://www.vivotek.vn/wp-content/uploads/2025/04/ma-banner_result.webp" class="d-block w-100" alt="Slider Image 1">
            <div class="carousel-caption d-none d-md-block">
                <h1>Upgrade your NVR Experience</h1>
                <p class="lead">Unlock your surveillance potential with VORTEX</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://www.vivotek.vn/wp-content/uploads/2024/11/Home_realsight_banner_result.webp" class="d-block w-100" alt="Slider Image 2">
            <div class="carousel-caption d-none d-md-block">
                <h1>Giải pháp an ninh toàn diện</h1>
                <p class="lead">Hệ thống camera IP chất lượng cao, giám sát thông minh</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="https://www.vivotek.vn/wp-content/uploads/2025/01/Home-banner-vortex-connect.webp" class="d-block w-100" alt="Slider Image 3">
            <div class="carousel-caption d-none d-md-block">
                <h1>Công nghệ AI hiện đại</h1>
                <p class="lead">Tính năng nhận diện và phân tích thông minh</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="feature-box bg-white">
                    <img src="https://www.vivotek.vn/wp-content/uploads/2025/01/NDAA_result.webp" class="img-fluid" alt="NDAA">
                    <div class="p-4">
                        <h5>NDAA</h5>
                        <p>VIVOTEK cung cấp các sản phẩm giám sát mạng tuân thủ NDAA.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box bg-white">
                    <img src="https://www.vivotek.vn/wp-content/uploads/2025/04/vivotek_premium_partner_portal_feature_result.webp" class="img-fluid" alt="Partner Portal">
                    <div class="p-4">
                        <h5>CỔNG THÔNG TIN ĐỐI TÁC CẤP CAO</h5>
                        <p>Chuyển đổi quản lý hệ thống an ninh của bạn với khả năng giám sát và kiểm soát toàn diện.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box bg-white">
                    <img src="https://www.vivotek.vn/wp-content/uploads/2025/01/5-years-warranty_result.webp" class="img-fluid" alt="5 Year Warranty">
                    <div class="p-4">
                        <h5>BẢO HÀNH 5 NĂM</h5>
                        <p>Đồ tin cậy được đảm bảo, gia hạn năm năm năm.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Products Section -->
<section class="py-5">
    <div class="container">
        <h2 class="section-title">SẢN PHẨM MỚI</h2>
        <div class="row">
            <c:forEach items="${latestProducts}" var="product">
                <div class="col-md-3">
                    <div class="card product-card">
                        <span class="badge badge-info position-absolute m-2">Mới</span>
                        <img src="${product.imageUrl}" class="card-img-top product-img" alt="${product.name}">
                        <div class="card-body">
                            <h6 class="card-title">${product.name}</h6>
                            <p class="card-text">${product.description}</p>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <span class="font-weight-bold text-primary">${product.price} VNĐ</span>
                                <a href="${pageContext.request.contextPath}/product?id=${product.id}" class="btn btn-sm btn-outline-primary">Chi tiết</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="text-center mt-4">
            <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-primary">Xem tất cả sản phẩm</a>
        </div>
    </div>
</section>

<!-- Projects Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title">DỰ ÁN</h2>
        <p class="mb-4">Các công trình điển hình đã thực hiện</p>

        <div class="row">
            <div class="col-md-4">
                <div class="project-item">
                    <img src="https://vcdn1-kinhdoanh.vnecdn.net/2020/11/05/image001-4724-1604563462.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=zKux_wrq2tvjUfK72mzXZw" class="img-fluid" alt="Project 1">
                    <div class="project-overlay">
                        <h5>DALAT HASFARM</h5>
                        <small>CỬA HÀNG</small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="project-item">
                    <img src="https://www.qtsc.com.vn/uploads/files/2019/04/24/sps-dat-2-giai-sao-khue_01.jpg" class="img-fluid" alt="Project 2">
                    <div class="project-overlay">
                        <h5>SPS VIỆT NAM</h5>
                        <small>CÔNG TY</small>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="project-item">
                    <img src="https://www.xenguyenvinh.com/Portals/28264/Hoan/tan-son-nhat-2.jpg" class="img-fluid" alt="Project 3">
                    <div class="project-overlay">
                        <h5>SÂN BAY QUỐC TẾ TÂN SƠN NHẤT</h5>
                        <small>SÂN BAY</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Include Footer -->
<jsp:include page="footer.jsp" />

<!-- jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>