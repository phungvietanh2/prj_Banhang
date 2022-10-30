<%-- 
    Document   : cart
    Created on : Jul 22, 2022, 11:23:20 AM
    Author     : phung
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        

        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="css/cart1.css" rel="stylesheet" type="text/css"/>
        <script src="js/cart1.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body style="text-decoration: none">
        <jsp:include page="../use/Menu.jsp"></jsp:include>
        <c:set var="o" value="${requestScope.cart}"/>
        <c:set var="tt" value="0" />
        <div style="float: right ; position: relative ; margin-top: 10rem" class="wrapper">
            <div class="project">

                <div class="right-bar">
                    <p><span>Subtotal</span> <span>$120</span></p>
                    <hr>
                    <p><span>Tax (5%)</span> <span>$6</span></p>
                    <hr>
                    <p><span>Shipping</span> <span>$15</span></p>
                    <hr>
                    <p ><span>Total:  $</span> <span><fmt:formatNumber pattern="##.##" value="${o.totalMoney}" /></span></p>

                    <form action="Checkout" method="post">
                        <i class="fa fa-shopping-cart"></i> 
                        <input  style="    height: 3rem;
                               background-color: red;
                               width: 8rem;
                               border-radius: 10px;
                               color: white; "  
                               type="submit" value="Checkout">
                    </form>   
                </div>

            </div>
        </div>
        <div style="padding-top: 10rem"></div>
        <c:forEach items="${o.items}" var="c">
            <c:set var="tt" value="${tt+1}" />
            <div style="font-size: 2rem; transition: none" class="wrapper" >
                <div class="project">

                    <div  class="shop">
                        <div class="box">
                            <img style="width: 20rem" src="img/iphone/${c.product.img}">
                            <div class="content">
                                <h3>${c.product.name}</h3>
                                <h4> Price: $ <fmt:formatNumber pattern="##.##" value="${c.price}" /> </h4>
                                <div class="buttons_added">
                                    <button  class="minus is-form" type="button" ><a href="process?num=-1&id=${c.product.productID}">-</a></button>
                                    <input readonly style="text-align: center" value=" ${c.quantity}" >
                                    <button class="minus is-form" type="button" ><a href="process?num=1&id=${c.product.productID}">+</a></button>
                                </div>
                                <form action="process" method="post">
                                    <input type="hidden" name="id" value="${c.product.productID}">
                                    <p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> 
                                        <span class="btn2"><input style="background: none ; color: white" type="submit" value="Remove" ></span></p>


                                </form>
                            </div>
                        </div>                    
                    </div>
                </div>
            </div>

        </c:forEach>



        <style>

            .buttons_added {
                opacity:1;
                display:inline-block;
                display:-ms-inline-flexbox;
                display:inline-flex;
                white-space:nowrap;
                vertical-align:top;
            }
            .is-form {
                overflow:hidden;
                position:relative;
                background-color:#f9f9f9;
                height:2.2rem;
                width:1.9rem;
                padding:0;
                text-shadow:1px 1px 1px #fff;
                border:1px solid #ddd;
            }
            .is-form:focus,.input-text:focus {
                outline:none;
            }
            .is-form.minus {
                border-radius:4px 0 0 4px;
            }
            .is-form.plus {
                border-radius:0 4px 4px 0;
            }
            .input-qty {
                background-color:#fff;
                height:2.2rem;
                text-align:center;
                font-size:1rem;
                display:inline-block;
                vertical-align:top;
                margin:0;
                border-top:1px solid #ddd;
                border-bottom:1px solid #ddd;
                border-left:0;
                border-right:0;
                padding:0;
            }
        </style>
    </body>
</html>
