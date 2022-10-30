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

        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.css"
            rel="stylesheet"
            />

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Homeadmin1.css" rel="stylesheet" type="text/css"/>
        <script src="js/Home.js" type="text/javascript"></script>
    </head>
    <script>
        function change() {
            document.getElementById("f1").submit();
        }
        function change1() {
            document.getElementById("f2").submit();
        }
    </script>
    <body>  <%
    Date dNow = new Date( );
   SimpleDateFormat ft = new SimpleDateFormat ("yyyy");
   SimpleDateFormat ft1 = new SimpleDateFormat ("MM");
        %>
        <c:set  var="nam1" value="<%=ft.format(dNow)%>"></c:set>
        <c:set var="thang1" value="<%=ft1.format(dNow)%>"></c:set>
        <c:set var="cid" value="${requestScope.cid}"></c:set>
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
                <a href="Addproduct"  ><i class="fa fa-edit"></i>Add product</a>
                <a href="Search"  class="active"><i class="fa fa-wrench"></i>Search</a>

            </div>
        </aside>
        <main class="content"> 

            <div class="grid">       
                <div class="painel">

                    <div class="painel-header">
                        <h4 class="painel-title">Search</h4>
                    </div>
                    

                </div>
            </div>
        </main>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/5.0.0/mdb.min.js"
        ></script>
        <script>
        const menu = document.getElementById('menu');
        const nav = document.getElementById('nav');
        menu.addEventListener('click', function () {
            nav.classList.toggle('visible');
        });
        </script>

    </body>

</html>










