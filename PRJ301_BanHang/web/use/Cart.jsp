<%-- 
    Document   : cart
    Created on : Jul 22, 2022, 11:23:20 AM
    Author     : phung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../css/cart1.css" rel="stylesheet" type="text/css"/>
        <script src="../js/cart1.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="wrapper">
            <h1>Shopping Cart</h1>
            <div class="project">
                <div class="shop">
                    <div class="box">
                        <img src="1.jpg">
                        <div class="content">
                            <h3>Women Lipsticks</h3>
                            <h4>Price: $40</h4>
                            <p class="unit">Quantity: <input name="" value="2"></p>
                            <p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
                        </div>
                    </div>
                    <div class="box">
                        <img src="2.jpg">
                        <div class="content">
                            <h3>Man's Watches</h3>
                            <h4>Price: $40</h4>
                            <p class="unit">Quantity: <input name="" value="1"></p>
                            <p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
                        </div>
                    </div>
                    <div class="box">
                        <img src="3.jpg">
                        <div class="content">
                            <h3>Samsung Mobile</h3>
                            <h4>Price: $250</h4>
                            <p class="unit">Quantity: <input name="" value="0"></p>
                            <p class="btn-area"><i aria-hidden="true" class="fa fa-trash"></i> <span class="btn2">Remove</span></p>
                        </div>
                    </div>
                </div>
                <div class="right-bar">
                    <p><span>Subtotal</span> <span>$120</span></p>
                    <hr>
                    <p><span>Tax (5%)</span> <span>$6</span></p>
                    <hr>
                    <p><span>Shipping</span> <span>$15</span></p>
                    <hr>
                    <p><span>Total</span> <span>$141</span></p><a href="#"><i class="fa fa-shopping-cart"></i>Checkout</a>
                </div>
            </div>
        </div>

        
    </body>
</html>
