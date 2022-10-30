<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Homeadmin1.css" rel="stylesheet" type="text/css"/>
        <script src="js/Home.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="topnav">
            <div class="logo">
                <a href="#" class="display-sm display-md" id="menu"><i class="fa fa-list-ul"></i></a>
                <a href="Admin" class="hidden-sm"><h1>APPLE</h1></a>
            </div>
            <div class="user-menu">
                <form action="#" method="post" class="hidden-sm">
                    <input type="text" name="search" id="search" placeholder="Procurar...">
                    <i class="fa fa-search"></i>
                </form>
                <div>
                    <c:if test="${sessionScope.account == null}">
                        <a href="Login"><i class="fa fa-power-off"></i></a>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                        <a href="#"><i class="fa fa-user"></i> Hello ${sessionScope.account.username}</a>
                        <a href="Logout"><i class="fa fa-power-off"></i></a>
                        </c:if>

                </div>
            </div>
        </nav>

        <aside class="sidenav hidden-sm hidden-md" id="nav">
            <div class="list">
                <a href="Admin"><i class="fa fa-home"></i>Home</a>
                <a href="Status"><i class="fa fa-users"></i>Stats</a>
                <a href="Oredrdetails"><i class="fa fa-users"></i>Order</a>
                <a href="Addproduct"  class="active"<i class="fa fa-edit"></i>Add product</a>
                <a href="Search"><i class="fa fa-wrench"></i>Search</a>

            </div>
        </aside>

        <main class="content">         
            <div class="grid">
                <div class="painel">
                    <div class="painel-header">
                        <h4 class="painel-title">Product >> <a href="Addproduct1">Add Product</a></h4>
                    </div>
                    <div class="painel-body">
                        <form action="Addproduct"  id="custom-search-form" class="form-search form-horizontal pull-right">
                            <div class="input-append span12">
                                <input name="key"  type="text" class="search-query mac-style" placeholder="Search">
                                <button  type="submit" class="btn"><i class="icon-search"></i></button>
                            </div>
                        </form>
                        <table style="margin-top: 3rem" class="table">
                            <tr>
                                <th class="table__heading">Name</th> 
                                <th class="table__heading">Description</th>  
                                <th class="table__heading">Img</th>
                                <th class="table__heading">Price</th>
                                <th class="table__heading">Delete</th>
                                <th class="table__heading">Update</th> 
                            </tr>
                            <c:forEach items="${requestScope.product}" var="c">
                                <tr>
                                    <td>${c.name}</td>
                                    <td>${c.description}</td>
                                    <td><img style="width: 20% ;" src="img/iphone/${c.img}" alt="alt"/></td>
                                    <td>$ <fmt:formatNumber pattern="##.##" value="${c.price}" /></td>
                                    <td><a onclick="removeEmp(${c.productID})" class="btn btn-red"><i class="fa fa-trash"></i></a></td>
                                    <td><a href="#" class="btn btn-orange"><i class="fa fa-edit"></i></a></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>


        </main>

    </body>
    <script>
        function removeEmp(id)
        {
            var result = confirm("are you sure?");
            if (result)
            {
                window.location.href = "Deleteproduct?id=" + id;
            }
        }
    </script>
    <style>
        #custom-search-form {
            margin:0;
            margin-top: 5px;
            padding: 0;
        }

        #custom-search-form .search-query {
            padding-right: 3px;
            padding-right: 4px \9;
            padding-left: 3px;
            padding-left: 4px \9;
            /* IE7-8 doesn't have border-radius, so don't indent the padding */

            margin-bottom: 0;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            -webkit-transition: width  0.2s ease-in-out;
            -moz-transition:width  0.2s ease-in-out;
            -o-transition: width  0.2s ease-in-out;
            transition: width  0.2s ease-in-out;
        }

        #custom-search-form button {
            border: 0;
            background: none;
            /** belows styles are working good */
            padding: 2px 5px;
            margin-top: 2px;
            position: relative;
            left: -28px;
            /* IE7-8 doesn't have border-radius, so don't indent the padding */
            margin-bottom: 0;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
        }

        .search-query:focus + button {
            z-index: 3;
        }
        .search-query:focus{
            width: 260px;
        }

    </style>
</html>










