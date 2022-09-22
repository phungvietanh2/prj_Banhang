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
        <link href="../css/login.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>

    <body >
        <jsp:include page="../use/Menu.jsp"></jsp:include>
            <div class="login-page">
                <div class="form">              
                    <form class="login-form">
                        <input type="text" placeholder="username"/>
                        <input type="password" placeholder="password"/>
                        <button>login</button>

                    </form>
                </div>
            </div>
        <jsp:include page="../use/Footer.jsp"></jsp:include>
    </body>
</html>
