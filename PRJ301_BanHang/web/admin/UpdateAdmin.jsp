<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
                <a href="Admin" ><i class="fa fa-home"></i>Home</a>
                <a href="Status"><i class="fa fa-users"></i>Stats</a>
                <a href="Oredrdetails"><i class="fa fa-users"></i>Order</a>
                <a href="Addproduct" ><i class="fa fa-edit"></i>Add product</a>
                <a href="Search"><i class="fa fa-wrench"></i>Search</a>

            </div>
        </aside>

        <main class="content">

            <div class="grid">
                <div class="painel">                  
                    <form action="updateaccount" method="post">
                        <div class="painel-body">
                            <div class="alert alert-success">update account</div>
                            <table class="zebra">
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Fullname</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Role</th>
                                </tr>

                                <tr>
                                    <td>
                                        ${requestScope.acc.accID}
                                        <input type="hidden"  name="id" value="${requestScope.acc.accID}"/>
                                    </td> 
                                    <td>
                                        <input name="phone" value="${requestScope.acc.phone}"/>
                                    </td>
                                    <td>
                                        <input name="gmail" value="${requestScope.acc.email}"/>
                                    </td>
                                    <td>
                                        <input name="fullname" value="${requestScope.acc.fullname}"/>
                                    </td>
                                    <td>
                                        <input name="username" value="${requestScope.acc.email}"/>
                                    </td>
                                    <td>
                                        <input name="password" value="${requestScope.acc.password}"/>
                                    </td>
                                    <td>
                                        <c:if test="${requestScope.acc.isAdmin == true }">
                                            <input name="role"  type="radio" checked="checked" value="True" disabled/>Admin
                                            <input name="role" type="radio"   value="False"/>Customer

                                        </c:if>
                                        <c:if test="${requestScope.acc.isCustomer == true }">
                                            <input name="role"  type="radio"  value="True"/>Admin
                                            <input name="role" type="radio" checked="checked"  value="False" disabled/>Customer
                                        </c:if>
                                    </td>
                                    <td> <input type="submit" value="Save" /></td>
                                </tr>

                            </table>
                        </div>
                    </form>

                </div>


            </div>


        </main>

    </body>

</html>










