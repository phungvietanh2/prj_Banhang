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

            <form action="" id="search-form">
                <input type="search" placeholder="search here..." name="" id="search-box">
                <label for="search-box" class="fas fa-search"></label>
                <i class="fas fa-times" id="close"></i>
            </form>

            <!-- home section starts  -->

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
            <a href="Cart" class="fas fa-shopping-cart">${requestScope.size}</a>      
        <form name="f" method="post">
            <input type="hidden" type="number"  name="num" value="1" >
            <section class="dishes" id="dienthoai">
                <h1 class="heading"> ĐIỆN THOẠI </h1>
                <div class="box-container">
                    <c:forEach items="${requestScope.productdt}"  var="c" >

                        <c:set var="id" value="${c.productID}" />  
                        <div class="box">
                            <div class="image">            
                                <a href="Information?productID${c.productID} class="fas fa-heart">

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
        </form>


        <!-- dishes section ends -->

        <!-- about section starts  -->

        <section class="about" id="tablet">

            <section class="dishes" >



                <h1 class="heading"> Iphone </h1>

                <div class="box-container">
                    <c:forEach items="${requestScope.product}"  var="c" >
                        <div class="box">
                            <div class="image">            
                                <a href="Information?productID${c.productID} class="fas fa-heart">

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
                                <a href="#" class="btn">add to cart</a>
                                <span class="price">$${c.price}</span>
                            </div>
                        </div>
                    </c:forEach>

                </div>

                </div>

            </section>

        </section>

        <!-- about section ends -->

        <!-- menu section starts  -->



        <section class="dishes" id="laptop">



            <h1 class="heading"> Iphone </h1>

            <div class="box-container">
                <c:forEach items="${requestScope.product}"  var="c" >
                    <div class="box">
                        <div class="image">            
                            <a href="Information?productID${c.productID} class="fas fa-heart">

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
                            <a href="#" class="btn">add to cart</a>
                            <span class="price">$${c.price}</span>
                        </div>
                    </div>
                </c:forEach>

            </div>

        </div>



    </section>

    <!-- menu section ends -->

    <!-- review section starts  -->

    <section class="review" id="dongho">

        <section class="dishes" >



            <h1 class="heading"> Iphone </h1>

            <div class="box-container">
                <c:forEach items="${requestScope.product}"  var="c" >
                    <div class="box">
                        <div class="image">            
                            <a href="Information?productID${c.productID} class="fas fa-heart">

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
                            <a href="#" class="btn">add to cart</a>
                            <span class="price">$${c.price}</span>
                        </div>
                    </div>
                </c:forEach>

            </div>

            </div>



        </section>

    </section>

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
</body>
</html>