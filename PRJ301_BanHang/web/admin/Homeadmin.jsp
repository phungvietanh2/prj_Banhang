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
        <script src="js/adminhome.js" type="text/javascript"></script>
    </head>
    <body>
        <!--          <%
            Date dNow = new Date( );
           SimpleDateFormat ft = new SimpleDateFormat ("yyyy");
           SimpleDateFormat ft1 = new SimpleDateFormat ("MM");
        %>
     
        <c:set  var="nam1" value="<%=ft.format(dNow)%>"></c:set>
        <c:set var="thang1" value="<%=ft1.format(dNow)%>"></c:set>
            -->
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
                <a href="Admin"  class="active"><i class="fa fa-home"></i>Home</a>
                <a href="Status"><i class="fa fa-users"></i>Stats</a>
                <a href="Oredrdetails"><i class="fa fa-users"></i>Order</a>
                <a href="Addproduct" ><i class="fa fa-edit"></i>Add product</a>
                <a href="Search"><i class="fa fa-wrench"></i>Search</a>

            </div>
        </aside>

        <main class="content">
            <div class="grid">
                <c:forEach items="${requestScope.o1}" var="a"> 
                    <div class="mini-reports bg-blue">
                        <div class="l">
                            <span> $<fmt:formatNumber pattern="##.##" value="${a.totalmoney}" /></span>
                            <span>Earning</span>
                        </div>
                        <div class="r">
                            <i class="fa fa-dollar c-blue"></i>

                        </div>
                    </div>
                </c:forEach>
                <div class="mini-reports bg-green">
                    <div class="l">
                        <span>${sessionScope.c}</span>  
                        <span>Home</span>
                    </div>
                    <div class="r">
                        <i class="fa fa-home c-green"></i>
                    </div>
                </div>
                <div class="mini-reports bg-orange">
                    <div class="l">
                        <span>100</span>
                        <span>usuário</span>
                    </div>
                    <div class="r">
                        <i class="fa fa-users c-orange"></i>
                    </div>
                </div>
                <div class="mini-reports bg-red">
                    <div class="l">
                        <span>50</span>
                        <span>Online</span>
                    </div>
                    <div class="r">
                        <i class="fa fa-user c-red"></i>
                    </div>
                </div>
            </div>

            <div class="grid">
                <div class="painel">
                    <div class="painel-header">
                        <h4 class="painel-title">Account</h4>

                    </div>
                    <div class="painel-body">
                        <div class="alert alert-success">User Information</div>
                        <table class="zebra">
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Join</th>
                                <th>Actions</th>
                            </tr>
                            <c:forEach items="${requestScope.acc}" var="c"> 
                                <tr>
                                    <td>${c.fullname}</td>
                                    <td>${c.email}</td>
                                    <td>${c.information.dob}</td>
                                    <td>
                                        <a  onclick="removeEmp(${c.accID})" class="btn btn-red"><i class="fa fa-trash"></i></a>
                                        <a href="updateaccount?id=${c.accID}" class="btn btn-orange"><i class="fa fa-edit"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>

                <div class="painel">
                    <div class="painel-header">
                        <h4 class="painel-title">Order Details List</h4>
                    </div>
                    <div class="painel-body">

                        <table class="table">
                            <tr>
                                <th class="table__heading">user name</th>
                                <th class="table__heading">date</th>
                                <th class="table__heading">status</th>
                                <th class="table__heading">total money</th>                             
                            </tr>
                            <c:forEach items="${requestScope.o2}" var="c">
                                <tr>
                                    <td>${c.account.username}</td>
                                    <td>${c.date}</td>
                                    <td>$ <fmt:formatNumber pattern="##.##" value="${c.totalmoney}" /></td>
                                    <td>
                                        <c:if test="${c.status == '-1'}">
                                            <h3 style="color: red">Reject</h3>
                                        </c:if>
                                        <c:if test="${c.status == '1'}">
                                            <h3 style="color: springgreen">Approved </h3>
                                        </c:if>
                                        <c:if test="${c.status == '0'}">
                                            <h3 style="color: red">Uprocessed</h3>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                        <div  id="bot_pagger" class="pagger">

                        </div>

                    </div>

                </div>
            </div>


        </main>
        <script>
            render("bot_pagger",${requestScope.pageindex},${requestScope.totalpage}, 2);
        </script>
        <script>
            const menu = document.getElementById('menu');
            const nav = document.getElementById('nav');

            menu.addEventListener('click', function () {
                nav.classList.toggle('visible');
            });
            //phan trang

        </script>
        <script>
            function removeEmp(id)
            {
                var result = confirm("are you sure?");
                if (result)
                {
                    window.location.href = "DeleteAccount?id=" + id;
                }
            }
        </script>
    </body>
    <style>
        .pagger {
            display: inline-block;
            margin-top: 10px;

        }

        .pagger a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
        }

        .pagger a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }

        .pagger a:hover:not(.active) {
            background-color: #ddd;
        }

        .pagger a:first-child {
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
        }

        .pagger a:last-child {
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }
    </style>
</html>










