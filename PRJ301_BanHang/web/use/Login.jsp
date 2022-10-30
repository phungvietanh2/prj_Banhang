<%-- 
    Document   : Login
    Created on : Sep 20, 2022, 3:24:54 PM
    Author     : phung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/Login.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://css.gg/eye.css' rel='stylesheet'>
        <title>JSP Page</title>
    </head>

    <body >
        <jsp:include page="../use/Menu.jsp"></jsp:include>
            <!--             dang ky-->
            <h2 style="margin-top: 10rem;"></h2>
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                    <form action="SignUp" method="post">
                        <h1>Create Account</h1>
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                        <span>or use your email for registration</span>
                        <input name="phone" type="number" placeholder="Phone" value="${sessionScope.phone}" required/>
                    <input name="name" type="text" placeholder="Name" value="${sessionScope.name}"  required />
                    <input name="email" type="email" placeholder="Email" value="${sessionScope.email}"  required />
                    <input name="pass" type="password" placeholder="Password"   required/>
                    <p>${requestScope.mess1}</p>
                    <button>Sign Up</button>
                </form>
            </div>
            <!--dang nhap -->
            <div class="form-container sign-in-container">
                <form action="Login" method="POST">
                    <h1>Sign in</h1>

                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <h2 style="color: red">${requestScope.error}</h2>
                    <input type="text" name="user" placeholder="name" value="${sessionScope.name}"/>
                    <input type="password" name="pass" placeholder="Password" value="${sessionScope.pass}" />
                    <div id="eye" style="margin-top: -4rem ;margin-left: 25rem">
                        <i class="fa fa-eye" style="font-size:23px"></i>
                       
                    </div>
                    <a href="#">Forgot your password?</a>
                    <button>Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div> 

    </body>
    <script src="js/login.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#eye").click(function (){
                $(this).toggleClass('open');
                $(this).children('i').toggleClass("fa-eye-slash");
                if($(this).hasClass('open')){
                    $(this).prev().attr('type','text');
                }
                else {
                    $(this).prev().attr('type','password');
                }
            });
        });
    </script>
</html>
