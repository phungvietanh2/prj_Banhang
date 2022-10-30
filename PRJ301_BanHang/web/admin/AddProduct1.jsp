<%-- 
    Document   : AddProduct1
    Created on : Oct 24, 2022, 1:02:28 PM
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
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link href="css/Homeadmin1.css" rel="stylesheet" type="text/css"/>
        <script src="js/Home.js" type="text/javascript"></script>
        <title>JSP Page</title>
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
                        <h4 class="painel-title"><a href="Addproduct">Back</a> >> Add Product</h4>
                    </div>

                    <div class="painel-body">
                        <form  action="Addproduct1" method="post">
                            <div>
                                <input style="margin-top: 20px;border-radius:  10px ;width: 100%; height: 5rem; font-size: 2rem " type="button" value="Add Product" onclick="addstudent()" />
                                  </div>
                            <table class="table table-bordered">
                                <thead>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Img</th>
                                <th>Category</th>
                                <th>Brand</th>
                                <th>quantity</th>
                                <th>price</th>
                                <th>date</th>
                                <th></th>
                                </thead>
                                <tbody id="container">
                               
                                </tbody>
                               
                            </table>
                             <input style="margin-top: 20px;border-radius:  10px ;width: 10rem; height: 5rem;" type="submit" value="Save" />
                          
                        </form>
                    </div>
                </div>
            </div>



        </main>

        <script>
            var count = 0;
            function addstudent()
            {
                count++;
                var
                        content = "<tr id=\"emp_container" + count + "\" class=\"emp_container\">";
                content += "<td><input type=\"text\" name=\"name" + count + "\"/> </td>";
                content += "<td><input type=\"text\" name=\"Description" + count + "\"/> </td>";
                content += "<td><input type=\"file\" name=\"Img" + count + "\"/> </td>";
                content += "<td><input type=\"text\" name=\"Category" + count + "\"/> </td>";
                        content += "<td><input type=\"text\" name=\"Brand" + count + "\"/> </td>";
                content += "<td><input type=\"text\" name=\"quantity" + count + "\"/> </td>";
                content += "<td><input type=\"text\" name=\"price" + count + "\"/> </td>";
                content += "<td><input type=\"date\" name=\"date" + count + "\"/> </td>";
                content += "<td><input  style=\"border-radius:10px ;width: 8rem; height: 3rem;\" type=\"button\" onclick=\"removeEmp(" + count + ")\" value=\"Remove\"/></td>";
                content += "<td><input type=\"hidden\" name=\"index\" value=\"" + count + "\"/> <br/>";
                content += "</tr>";
                var container = document.getElementById("container");
                container.innerHTML += content;
            }

            function removeEmp(index)
            {
                var container = document.getElementById("container");
                var emp_container = document.getElementById("emp_container" + index);
                container.removeChild(emp_container);
            }

        </script>
        <style>
            .table {
                font-family: Arial, Helvetica, sans-serif;
            }

            .table thead {
                position: sticky;
                top: 0;
            }

            .table thead th {
                border: 1px solid #e4eff8;
                background: white;
                cursor: pointer;
            }

            .table thead th.header-label {
                cursor: pointer;
                background: linear-gradient(0deg, #e4eff8, #4578a2 5%, #e4eff8 150%);
                color: white;
                border: 1px solid white;
            }

            .table th,
            .table td {
                padding: 0.2rem 0.5rem;
                text-align: center;
            }

            .table td {
                border: 1px solid #e4eff8;
            }

            .table input {
                width: 100%;
            }
        </style>
    </body>
</html>
