<%-- 
    Document   : Menu
    Created on : Sep 20, 2022, 2:20:35 PM
    Author     : phung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <link href="css/Home.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>

        <header>

            <a href="#" class="logo"><i class="fas fa-utensils"></i>resto.</a>

            <nav class="navbar">
                <a href="Home">HOME</a>
                <a href="DienThoai">ĐIỆN THOẠI</a>
                <a href="#tablet">TABLET</a>
                <a href="#laptop">LAPTOP</a>
                <a href="#dongho">ĐỒNG HỒ</a>
                <a href="#order">Other</a>
            </nav>
               
            <div class="icons">
                <i class="fas fa-bars" id="menu-bars"></i>
                <i class="fas fa-search" id="search-icon"></i>
                <a href="Status?id=${sessionScope.account.accID}" class="fas fa-heart"></a>
                <a href="Cart" class="fas fa-shopping-cart">${requestScope.size}</a>        
                <a href="Login" class='fas fa-user-alt' ></a>
            </div>

        </header>

    </body>
</html>
