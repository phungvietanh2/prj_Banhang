<%-- 
    Document   : thongtinsanpham
    Created on : Jul 22, 2022, 10:49:30 AM
    Author     : phung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">

        <link href="css/thongtinsanpham.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body >
        <jsp:include  page="../use/Menu.jsp"></jsp:include>
            <main role="main">
            <c:forEach items="${requestScope.Productinformation}" var="c"></c:forEach>
                <!-- Block content - Đục lỗ trên giao diện bố cục chung, đặt tên là `content` -->
                <div class="container mt-4">
                    <div id="thongbao" class="alert alert-danger d-none face" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>

                    <div class="card">
                        <div class="container-fliud">
                            <form name="frmsanphamchitiet" id="frmsanphamchitiet" method="post"
                                  action="/php/twig/frontend/giohang/themvaogiohang">
                                <input type="hidden" name="sp_ma" id="sp_ma" value="5">
                                <input type="hidden" name="sp_ten" id="sp_ten" value="Samsung Galaxy Tab 10.1 3G 16G">
                                <input type="hidden" name="sp_gia" id="sp_gia" value="10990000.00">
                                <input type="hidden" name="hinhdaidien" id="hinhdaidien" value="samsung-galaxy-tab-10.jpg">

                                <div class="wrapper row">
                                    <div class="preview col-md-6">
                                        <div class="preview-pic tab-content">


                                            <img  src="img/iphone/13pro.png">    

                                        </div>

                                    </div>
                                    <div class="details col-md-6">
                                        <h3 class="product-title">Samsung Galaxy Tab 10.1 3G 16G</h3>
                                        <div class="rating">
                                            <div class="stars">
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div>
                                            <span class="review-no">999 reviews</span>
                                        </div>
                                        <p class="product-description">Màn hình 10.1 inch cảm ứng đa điểm</p>
                                        <h4 class="price">Giá hiện tại: <span>10,990,000.00 vnđ</span></h4>
                                        <div class="form-group">
                                            <label for="soluong">Số lượng đặt mua:</label>
                                            <input type="number" class="form-control" id="soluong" name="soluong">
                                        </div>
                                        <div class="action">
                                            <a class="add-to-cart btn btn-default" id="btnThemVaoGioHang">Thêm vào giỏ hàng</a>
                                            <a class="like btn btn-default" href="#"><span class="fa fa-heart"></span></a>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="card">
                        <div class="container-fluid">
                            <h3>Thông tin chi tiết về Sản phẩm</h3>
                            <div class="row">
                                <div class="col">
                                    Vi xử lý Dual-core 1 Cortex-A9 tốc độ 1GHz
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End block content -->
            </main>
        <jsp:include page="../use/Footer.jsp"></jsp:include>
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/popperjs/popper.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
