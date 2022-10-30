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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Homeadmin1.css" rel="stylesheet" type="text/css"/>
        <script src="js/Home.js" type="text/javascript"></script>
    </head>
    <script>
        function change1() {
        document.getElementById("f2").submit();
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
                <a href="Status"  class="active"><i class="fa fa-users"></i>Stats</a>
                <a href="Oredrdetails"><i class="fa fa-users"></i>Order</a>
                <a href="Addproduct"  ><i class="fa fa-edit"></i>Add product</a>
                <a href="Search"><i class="fa fa-wrench"></i>Search</a>

            </div>
        </aside>
        <main class="content"> 
            <div class="grid">       
                <div class="painel">          
                    <div class="painel-header">
                        <h4 class="painel-title"><a href="Status">Năm</a> >> <a href="Allstats">All Stats</a></h4> 

                    </div>

                    <form id="f2" action="Status"  >
                        <select name="key" onchange="change1()">
                            <c:forEach items="${requestScope.o}" var="c">
                                <option ${(cid==c.nam)?'selected':''} value="${c.nam}">${c.nam}</option>
                            </c:forEach>
                        </select>
                        <div class="container">
                            <canvas id="myChart"></canvas>
                        </div>

                    </form>

                </div>
                
            </div>
        </main>
        <script>
            let myChart = document.getElementById('myChart').getContext('2d');
            // Global Options
            Chart.defaults.global.defaultFontFamily = 'Lato';
            Chart.defaults.global.defaultFontSize = 18;
            Chart.defaults.global.defaultFontColor = '#777';
            let massPopChart = new Chart(myChart, {
            type: 'bar', // bar, horizontalBar, pie, line, doughnut, radar, polarArea
                    data: {
                    labels: [
            <c:forEach items="${requestScope.o2}" var="c">
                    'Month :${c.thang}',
            </c:forEach>
                    ],
                            datasets: [{
                            label: 'Total money $ ',
                                    data: [
            <c:forEach items="${requestScope.o2}" var="c">
                                    '${c.totalmoney}',
            </c:forEach>
                                    ],
                                    //backgroundColor:'green',
                                    backgroundColor: [
                                            'rgba(255, 99, 132, 0.2)',
                                            'rgba(255, 159, 64, 0.2)',
                                            'rgba(255, 205, 86, 0.2)',
                                            'rgba(75, 192, 192, 0.2)',
                                            'rgba(54, 162, 235, 0.2)',
                                            'rgba(153, 102, 255, 0.2)',
                                            'rgba(201, 203, 207, 0.2)'
                                    ],
                                    borderWidth: 1,
                                    borderColor: '#777',
                                    hoverBorderWidth: 3,
                                    hoverBorderColor: '#000'
                            }]
                    },
                    options: {
                    title: {
                    display: true,
                            text: 'Thống kê tổng số tiền theo năm',
                            fontSize: 25
                    },
                            legend: {
                            display: true,
                                    position: 'right',
                                    labels: {
                                    fontColor: '#000'
                                    }
                            },
                            layout: {
                            padding: {
                            left: 50,
                                    right: 0,
                                    bottom: 0,
                                    top: 0
                            }
                            },
                            tooltips: {
                            enabled: true
                            }
                    }
            });
        </script>
        
    </body>

</html>










