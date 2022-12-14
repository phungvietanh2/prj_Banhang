<%-- 
    Document   : Home
    Created on : Sep 20, 2022, 2:12:37 PM
    Author     : phung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Complete Responsive Food Website Design Tutorial</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/Home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="../use/Menu.jsp"></jsp:include>

            <section class="home" id="home">

                <div class="swiper-container home-slider">

                    <div class="swiper-wrapper wrapper">

                        <div class="swiper-slide slide">
                            <div class="content">
                                <span>our special dish</span>
                                <h3>spicy noodles</h3>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit natus dolor cumque?</p>
                                <a href="#" class="btn">order now</a>
                            </div>
                            <div class="image">
                                <img src="img/slide/1.2.jpg" alt=""/>
                            </div>
                        </div>

                        <div class="swiper-slide slide">
                            <div class="content">
                                <span>our special dish</span>
                                <h3>spicy noodles</h3>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit natus dolor cumque?</p>
                                <a href="#" class="btn">order now</a>
                            </div>
                            <div class="image">
                                <img src="img/slide/1.3.jpg" alt=""/>
                            </div>
                        </div>

                        <div class="swiper-slide slide">
                            <div class="content">
                                <span>our special dish</span>
                                <h3>spicy noodles</h3>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit natus dolor cumque?</p>
                                <a href="#" class="btn">order now</a>
                            </div>
                            <div class="image">
                                <img src="img/slide/1.4.png" alt=""/>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- home section ends -->

            <!-- dishes section starts  -->   
            <form name="f" method="post">
                <input type="hidden" type="number"  name="num" value="1" >
                <section class="dishes" id="dienthoai">
                    <h1 class="heading"> ??I???N THO???I </h1>
                    <div id="content" class="box-container">
                    <c:forEach items="${requestScope.productdt}"  var="c" >
                        <c:set var="id" value="${c.productID}" />  
                        <div class="product1 box ">
                            <div class="image">            
                                <a href="Information?productID=${c.productID} & class="fas fa-heart">
                                    <img src="img/iphone/${c.img}" alt="">
                                </a>
                            </div>
                            <div class="content">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <h3>${c.name}</h3>
                                <input type="button" class="btn" onclick="buy('${id}')" value="add to cart">
                                <span class="price">$${c.price}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
               
            </section>



            <section class="dishes" id="tablet">
                <h1 class="heading"> TABLE </h1>

                <div class="box-container">
                    <c:forEach items="${requestScope.productipad}"  var="d" >
                        <div class="box">
                            <div class="image">            
                                <a href="Information?productID=${d.productID} & class="fas fa-heart">

                                    <img src="img/iphone/${d.img}" alt="">
                                </a>
                            </div>
                            <div class="content">
                                <div class="stars">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <h3>${d.name}</h3>
                                <input type="button" class="btn" onclick="buy('${id}')" value="add to cart">
                                <span class="price">$${d.price}</span>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </section>
            <section class="review" id="laptop">
                <section class="dishes" >
                    <h1 class="heading"> LAPTOP </h1>
                    <div class="box-container">
                        <c:forEach items="${requestScope.productlaptop}"  var="c" >
                            <div class="box">
                                <div class="image">            
                                    <a href="Information?productID=${c.productID} & class="fas fa-heart">

                                        <img src="img/iphone/${c.img}" alt="">
                                    </a>
                                </div>
                                <div class="content">
                                    <div class="stars">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                    </div>
                                    <h3>${c.name}</h3>
                                    <input type="button" class="btn" onclick="buy('${id}')" value="add to cart">
                                    <span class="price">$${c.price}</span>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </section>
            </section>
        </form>
        <!-- order section ends -->

        <!-- footer section starts  -->

        <jsp:include page="../use/Footer.jsp"></jsp:include>


        <!-- footer section ends -->

        <!-- loader part  -->

        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="js/Home.js" type="text/javascript"></script>
        <script>
                                        function buy(id) {
                                            var m = document.f.num.value;
                                            document.f.action = "buy?id=" + id + "&num=" + m;
                                            document.f.submit();
                                        }

        </script>
        <style>
            #loadMore {
                width: 200px;
                color: #fff;
                display: block;
                text-align: center;
                margin: 20px auto;
                padding: 10px;
                border-radius: 10px;
                border: 1px solid transparent;
                background-color: blue;
                transition: .3s;
            }
            #loadMore:hover {
                color: blue;
                background-color: #fff;
                border: 1px solid blue;
                text-decoration: none;
            }
            .noContent {
                color: #000 !important;
                background-color: transparent !important;
                pointer-events: none;
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

       
    </body>
</html>