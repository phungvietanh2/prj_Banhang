<%-- 
    Document   : Menu
    Created on : Sep 20, 2022, 2:20:35 PM
    Author     : phung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- home section starts  -->
    </body>
</html>
