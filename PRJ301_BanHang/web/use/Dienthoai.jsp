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
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="css/Home.css" rel="stylesheet" type="text/css"/>
        <link href="css/product1.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <script>
        function change() {
            document.getElementById("f1").submit();
        }
    </script>
    <body>
        <jsp:include page="../use/Menu.jsp"></jsp:include>
            <!-- content -->
        <c:set var="cid" value="${requestScope.cid}"></c:set>
            <div class="container">
                <form id="f1" action="DienThoai">
                    <div style="margin-top: 10rem; background: #fff ;
                         box-shadow: 0 4px 6px #00000029;
                         height: 5rem;
                         padding: 15px;
                         border-radius: 15px;
                         display: flex">
                        <div  style="display: flex">
                            <h3>  cac loai </h3>
                            <select name="key" onchange="change()">
                                <option value="0">
                                    ALL
                                </option>
                            <c:forEach items="${requestScope.brand}" var="c">
                                <option ${(cid==c.brandID)?'selected':''} value="${c.brandID}">
                                    ${c.title}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div > 
                        <input name="key2" placeholder="nhap mien ta">
                    </div>
                    <div>
                        tu gia <input type="number" name="fromprice">
                        den gia <input type="number" name="topprice">
                    </div>

                    <input type="submit" value="search"> 
                </div>
            </form>
            <div style="margin-top: 20px">
                <h4><a style="color: black ;text-decoration: none" href="Home">Home</a> >  <a style="text-decoration: none" href="DienThoai">Điện Thoại</a></h4> <br>
            </div>
            <div class="row">
                <c:forEach items="${requestScope.product}" var="c" >
                    <div  class="col-md-3 col-sm-6">
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
                                <a class="add-to-cart" href="">Add to cart</a>
                            </div>
                            <div class="product-content">
                                <h3 class="title"><a href="#">${c.name}</a></h3>
                                <span class="price">$${c.price}</span>
                            </div>
                        </div>

                    </div>
                </c:forEach>
            </div>

        </div>
        <jsp:include page="../use/Footer.jsp"></jsp:include>
    </body>
</html>
