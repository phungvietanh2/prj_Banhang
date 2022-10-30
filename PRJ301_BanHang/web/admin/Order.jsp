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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Homeadmin1.css" rel="stylesheet" type="text/css"/>
        <script src="js/Home.js" type="text/javascript"></script>
    </head>
    <script>
        function change() {
            document.getElementById("f1").submit();
        }

    </script>
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
                <a href="Oredrdetails"  class="active"><i class="fa fa-users"></i>Order</a>
                <a href="Addproduct" ><i class="fa fa-edit"></i>Add product</a>
                <a href="Search"><i class="fa fa-wrench"></i>Search</a>

            </div>
        </aside>
        <main class="content"> 

            <div class="grid">       
                <div class="painel">

                    <div class="painel-header">
                        <h4 class="painel-title">Order</h4>
                    </div>
                    <form id="f1" action="Oredrdetails">
                        <div style=" background: #fff ;
                             box-shadow: 0 4px 6px #00000029;
                             height: 5rem;
                             padding: 15px;
                             border-radius: 15px;
                             display: flex ;
                             ">
                            <div style="display: flex">
                                <input name="key2" placeholder="Enter buyer's name">
                            </div>
                            <div > 
                                From the total money <input type="number" name="fromprice">
                                To the total money <input type="number" name="topprice">
                            </div>
                            <div>
                                From date <input type="date" name="from">
                                To date <input type="date" name="to">
                            </div>

                            <input type="submit" value="search"> 
                        </div>

                        <table class="table">
                            <tr>
                                <th class="table__heading">user name</th>
                                <th class="table__heading">date</th>
                                <th class="table__heading">status</th>
                                <th class="table__heading">total money</th>                             
                            </tr>
                            <c:forEach items="${requestScope.searchorder}" var="c">
                                <tr>
                                    <td>${c.account.username}</td>
                                    <td>${c.date}</td>
                                    <td>${c.id}</td>
                                    <td>$ <fmt:formatNumber pattern="##.##" value="${c.totalmoney}" /></td>
                                    <td><span class="status delivered">
                                            <c:if test="${c.status == '-1'}">
                                                <h3 style="color: red">Reject</h3>
                                            </c:if>
                                            <c:if test="${c.status == '1'}">
                                                <h3 style="color: springgreen">Approved </h3>
                                            </c:if>
                                            <c:if test="${c.status == '0'}">
                                                <button onclick="a(this,${c.id}, 1)" type="button" class="btn btn-info btn-circle btn-lg"><i class="glyphicon glyphicon-ok"></i><p hidden>Approved</p></button>
                                                <button onclick="a(this,${c.id}, -1)" type="button" class="btn btn-warning btn-circle btn-lg"><i class="glyphicon glyphicon-remove"></i><p hidden>Reject</p></button>
                                                </c:if>
                                        </span></td>
                                </tr>
                            </c:forEach>
                        </table>

                    </form>
                </div>
            </div>
        </main>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script>
                                                    function a(s, eid, st) {
                                                        var txt = s.textContent;// gia tri nhap 
                                                        s.parentElement.innerHTML = txt;

                                                        $.ajax({

                                                            url: "/PRJ301_BanHang/Load",
                                                            type: "get", //send it through get method
                                                            data: {
                                                                id: eid,
                                                                status: st
                                                            },

                                                            success: function (response) {

                                                            },
                                                            error: function (xhr) {
                                                                //Do Something to handle error
                                                            }
                                                        });

                                                    }
        </script>
        <script>
            const menu = document.getElementById('menu');
            const nav = document.getElementById('nav');
            menu.addEventListener('click', function () {
                nav.classList.toggle('visible');
            });
        </script>
        <style>
            .btn-circle.btn-lg {
                width: 50px;
                height: 50px;
                padding: 10px 16px;
                font-size: 18px;
                line-height: 1.33;
                border-radius: 25px;
            }

        </style>
    </body>

</html>










