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
            <div class="painel-header">
                <h4 class="painel-title"><a href="Status">Năm</a> >> <a href="Allstats">All Stats</a></h4> 
            </div>
            <form id="f1" action="Allstats">
                <div class="grid">       
                    <div class="painel">          
                        <div class="painel-header">
                            <h4 class="painel-title">Top 5</h4> 
                        </div>
                        <table class="zebra">
                            <tr>
                                <th>Name</th>
                                <th>Quantity</th>
                            </tr>
                            <c:forEach items="${requestScope.topsanpham}" var="c"> 
                                <tr>
                                    <td>${c.name}</td>
                                    <td>${c.orderDetail.quantity}</td>                           
                                </tr>
                            </c:forEach>
                        </table>

                    </div>
                    <div class="painel">          
                        <div class="painel-header">
                            <h4 class="painel-title">Tổng Số Tiền Order</h4> 

                        </div>

                        <div class="row">
                            <div class="col-sm-5"> 
                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                    <label class="control-label" for="datepicker-start">Start Date</label>
                                    <input name="from" type="date" class="form-control" id="datepicker-start">
                                </div>
                            </div>
                            <div class="col-sm-5"> 
                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                    <label class="control-label" for="datepicker-end">End Date</label>
                                    <input name="to" type="date" class="form-control" id="datepicker-end">
                                </div>
                            </div>  
                            <div class="col-sm-2">
                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                    <input style="margin-top: 20px" type="submit" value="search"> 
                                </div>
                            </div>

                        </div>
                        <div>
                            <c:forEach items="${requestScope.sumorder}" var="a"> 
                                <h2  style="color: red"> SUM = $${a.totalmoney}</h2>
                                <c:set var="sumorder1" value="${a.totalmoney}"></c:set>
                            </c:forEach>
                        </div>

                    </div>
                    <div class="painel">          
                        <div class="painel-header">
                            <h4 class="painel-title">Tổng Số Tiền Sản Phẩm</h4> 

                        </div>
                        <div class="row">
                            <div class="col-sm-5"> 
                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                    <label class="control-label" for="datepicker-start">Start Date</label>
                                    <input name="from1" type="date" class="form-control" id="datepicker-start">
                                </div>
                            </div>
                            <div class="col-sm-5"> 
                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                    <label class="control-label" for="datepicker-end">End Date</label>
                                    <input name="to1" type="date" class="form-control" id="datepicker-end">
                                </div>
                            </div>  
                            <div class="col-sm-2">
                                <div class="form-group pmd-textfield pmd-textfield-floating-label">
                                    <input style="margin-top: 20px" type="submit" value="search"> 
                                </div>
                            </div>

                        </div>
                        <div>
                            <c:forEach items="${requestScope.sumprice}" var="b"> 
                                <h2 style="color: red"> SUM = $${b.price}</h2>
                                <c:set var="sumproduct1" value="${b.price}"></c:set>
                            </c:forEach>
                        </div>

                    </div>

                    <div class="painel">          
                        <div class="painel-header">
                            <h4 class="painel-title">SUM</h4> 

                        </div>

                        <div>
                            <c:if test="${(sumorder1 - sumproduct1) < 0}">
                                <h2>Loss Amount</h2>
                                <h3 style="color: #d9534f"> SUM = $<fmt:formatNumber pattern="##.##" value="${sumorder1 - sumproduct1}" /></h3>
                            </c:if>    
                            <c:if test="${(sumorder1 - sumproduct1) > 0}">
                                <h2>Amount Of Profit</h2>
                                <h3 style="color: #5cb85c"> SUM = $<fmt:formatNumber pattern="##.##" value="${sumorder1 - sumproduct1}" /></h3>
                            </c:if> 
                        </div>


                    </div>
                </div>
            </form>
        </main>

    </body>
    <style>
        /* Bootstrap css */
        @import "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css";

        /* Google Material icons */
        @import "http://fonts.googleapis.com/icon?family=Material+Icons";

        /* Propeller css */
        @import "dist/css/propeller.min.css";

        /* Bootstrap datetimepicker */
        @import "datetimepicker/css/bootstrap-datetimepicker.css";

        /* Propeller datetimepicker */
        @import "datetimepicker/css/pmd-datetimepicker.css";
    </style>
</html>










