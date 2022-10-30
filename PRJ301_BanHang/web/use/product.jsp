<%-- 
    Document   : Product
    Created on : 04-10-2022, 14:24:01
    Author     : phung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <link href="css/Home.css" rel="stylesheet" type="text/css"/>
        <link href="css/product1.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <header style="text-decoration: none">

            <a href="#" class="logo"><i class="fas fa-utensils"></i>food</a>



            <nav  class="navbar">
                <a href="Home">HOME</a>
                <a href="#dienthoai">ĐIỆN THOẠI</a>
                <a href="#tablet">TABLET</a>
                <a href="#laptop">LAPTOP</a>
                <a href="Product">Other</a>
                <a href="search">Search</a>
            </nav>
            <form action="search"> 
                <div class="icons">
                    <i class="fas fa-bars" id="menu-bars"></i>
                    <i class="fas fa-search"  id ="search-icon"></i>
                    <a href="Status?id=${sessionScope.account.accID}" class="fas fa-heart"></a>
                    <a href="Cart" class="fas fa-shopping-cart">${requestScope.size}</a>        
                    <c:if test="${sessionScope.account == null}">
                        <a href="Login" class='fas fa-user-alt' ></a>
                    </c:if>
                    <c:if test="${sessionScope.account != null }">
                        <a href="Logout" style=" font-size: 15px;
                           padding: 10px;">${sessionScope.account.username}</a>

                    </c:if>
                </div>
            </form>
        </header>
        <form action="search" id="search-form">
            <input type="search" placeholder="search here..." name="key" id="search-box">
            <label for="search-box" class="fas fa-search"></label>
            <i class="fas fa-times" id="close"></i>
        </form>
        <!-- content -->
        <div class="container">
            <div style="margin-top: 9rem; width: 100%">
                <div style=" background: #fff ;
                     box-shadow: 0 4px 6px #00000029;
                     height: 10rem;
                     padding: 15px;
                     width: 50%;
                     border-radius: 15px; width: 100%
                     "class="btn-group">
                    <div class="btn-group">
                        <a href="Product?cid=0&bid=0" class="btn btn-primary">ALL</a>

                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            ĐIÊN THOẠI
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="Product?cid=1&bid=1">APPLE</a>
                            <a class="dropdown-item" href="Product?cid=1&bid=2">SAMSUNG</a>
                            <a class="dropdown-item" href="Product?cid=1&bid=3">XIAOMI</a>
                        </div>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            TABLET
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="Product?cid=2&bid=1">APPLE</a>
                            <a class="dropdown-item" href="Product?cid=2&bid=2">SAMSUNG</a>
                            <a class="dropdown-item" href="Product?cid=2&bid=3">XIAOMI</a>

                        </div>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            LAPTOP
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="Product?cid=3&bid=1">APPLE$</a>
                            <a class="dropdown-item" href="Product?cid=3&bid=4">ASUS</a>
                            <a class="dropdown-item" href="Product?cid=3&bid=5">MSI</a>

                        </div>
                    </div>
                    <!-- lay thong tin o sv -->
                    <c:set var="price" value="${sessionScope.price}"/>
                    <c:set var="cid" value="${sessionScope.cid}"/>
                    <c:set var="bid" value="${sessionScope.bid}"/>
                    <div  class="btn-group">


                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            GIÁ
                        </button>
                        <c:if test="${requestScope.checksearch == 0}">
                            <form  id="f1" data-cid=${cid} data-bid=${bid} >

                                <div  class="dropdown-menu">
                                    <div>
                                        <input type="radio" name="price" value="0" class="custom-control-input pricee" ${sessionScope.price == "0" ? "checked" : ""} id="price-all">
                                        <label  for="price-all" >All Price</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="1" class="custom-control-input pricee" ${sessionScope.price == "1" ? "checked" : ""} id="price-1">
                                        <label  for="price-1" >$0 - $20</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="2" class="custom-control-input pricee" ${sessionScope.price == "2" ? "checked" : ""} id="price-2">
                                        <label  for="price-2" >$21 - $30</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="3" class="custom-control-input pricee" ${sessionScope.price == "3" ? "checked" : ""} id="price-3">
                                        <label  for="price-3" >$31 - $50</label>
                                    </div>
                                    <div>
                                        <input type="radio" name="price" value="4" class="custom-control-input pricee" ${sessionScope.price == "4" ? "checked" : ""} id="price-4">
                                        <label  for="price-4" > >> $50</label>
                                    </div>
                                </div>

                            </form>
                        </c:if>
                    </div>
                </div>
            </div>


            <div  style="margin-top: 55px">
                <h4><a style="color: black ;text-decoration: none" href="Home">Home</a> >  <a style="text-decoration: none" href="DienThoai">Điện Thoại</a></h4> <br>
            </div>
            <form name="f" method="post">
                <!--                <input type="hidden" type="number"  name="num" value="1" >-->
                <div id="content" class="row">
                    <c:forEach items="${sessionScope.product}" var="c" >
                        <c:set var="id"  value="${c.productID}" ></c:set> 
                            <div id="content" class="col-md-3 col-sm-6 product1">
                                <div style="    background: #fff;
                                     box-shadow: 0 4px 6px #00000029;
                                     margin: 0 10px 10px 0;
                                     border-radius: 10px " class="product-grid2">
                                    <div class="product-image2">
                                        <a href="#">
                                            <img class="pic-1" src="img/iphone/${c.img}">
                                        <img class="pic-2" src="img/iphone/${c.img}">    
                                    </a>
                                    <ul class="social">
                                        <li><a href="#" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                                        <li><a href="#" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                                        <li><a href="#" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                    <input type="button" class="btn" class="add-to-cart"  onclick="a(${id}, 1)" value="add to cart">

                                </div>
                                <div class="product-content">
                                    <h3 class="title"><a href="#">${c.name}</a></h3>
                                    <span class="price">$${c.price}</span>
                                </div>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </form>

        </div>
        <jsp:include page="../use/Footer.jsp"></jsp:include>
        <script src="js/product.js" type="text/javascript"></script>
    </body>
    <script>


    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
                                        function a(id, num) {
                                            $.ajax({

                                                url: "/PRJ301_BanHang/product",
                                                type: "get", //send it through get method
                                                data: {
                                                    id: id,
                                                    num: num
                                                },

                                                success: function (data) {

                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });

                                        }
    </script>
</html>
