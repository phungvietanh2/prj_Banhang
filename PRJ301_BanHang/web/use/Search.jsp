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
        <link href="css/Home.css" rel="stylesheet" type="text/css"/>
        <link href="css/product1.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="../use/Menu.jsp"></jsp:include>
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
                        <form action="search">
                            <div class="container1">

                                <div class="form">
                                    <input oninput="searchname(this)" name ="key" type="text">
                                    <span class="fas ico"></span>
                                </div>
                            </div>

                        </form>

                    </div>

                </div>


                <div  style="margin-top: 55px">
                </div>
                <div id="content" class="row">
                <c:forEach items="${requestScope.search}" var="c" >
                    <div  class="col-md-3 col-sm-6">
                        <div style="    background: #fff;
                             box-shadow: 0 4px 6px #00000029;
                             margin: 0 10px 10px 0;
                             border-radius: 10px " class="product-grid2">
                            <div class="product-image2">
                                <a  href="#">
                                    <img  class="pic-1" src="img/iphone/${c.img}">
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
    <style>
        .container1 {
            display: flex;
            flex-direction:column;
            justify-content: center;
            align-items: center;
        }
        h3{
            font-family:"Dosis",sans-serif;
            font-size: 28px;
            color : #5f27cd;
        }


        .form {
            position: relative;
        }

        input {
            width: 350px;
            height: 60px;
            padding: 10x;
            padding-left: 60px;
            border-radius: 10px;
            background-color: #5f27cd;
            border: none;
            color: white;
            font-size: 24px;
            font-family: "Dosis", sans-serif;
            outline:none
        }

        .ico {
            position: absolute;
            top: 15px;
            left: 15px;
            color: white;
            font-size: 28px;
        }

        .blink {
            transform: rotate(90deg);
            animation: outFocus 1s infinite ease-in-out;
        }

        .search {
            transition: 1s;
            animation: onFocus 1s 1 ease-in-out;
        }

        @keyframes outFocus {
            to {
                opacity: 0;
            }
            from {
                opacity: 1;
            }
        }

        @keyframes onFocus {
            to {
                transform: rotateY(0deg);
            }
            from {
                transform: rotateY(90deg);
            }
        }

    </style>
    <script>
        $(document).ready(function () {
        $(".ico").addClass("fa-minus blink rotate");
        $("input").focus(function () {
        $(".ico").addClass("fa-search search");
        $(".ico").removeClass("fa-minus blink");
        });
        $("input").focusout(function () {
        $(".ico").addClass("fa-minus blink");
        $(".ico").removeClass("search");
        });
        });
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
       
    <script>
         function searchname(p){
             
                            var txt_search = p.value;// gia tri nhap 
                            
                            $.ajax({
                                
                                url: "/PRJ301_BanHang/SearchUse",
                                type: "get", //send it through get method
                                data: {
                                    key: txt_search
                                },
                               
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                              
                        }
    </script>
</html>
