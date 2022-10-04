<%-- 
    Document   : mycart
    Created on : Sep 27, 2022, 8:11:03 PM
    Author     : phung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <th>no</th>
                <th>name</th>
                <th>tity</th>
                <th>pi</th>
                <th>sum</th>
                <th>acc</th>
            </tr>
            <c:set var="o" value="${requestScope.cart}" />
            <c:set var="tt" value="0" />
            <c:forEach items="${o.items}" var="i">
                <c:set var="tt" value="${tt+1}"/>
                <tr>
                    <td>${tt}</td>
                    <td>${i.product.name}</td>
                    <td>
                        <button><a href="process?num=-1&id=${i.product.productID}">-</a></button>
                        ${i.quantity}
                        <button><a href="process?num=1&id=${i.product.productID}">+</a></button>
                    </td>
                    <td>
                        <fmt:formatNumber pattern="##.#" value="${i.price}" /> 
                    </td>
                    <td>
                        <fmt:formatNumber pattern="##.#" value="${(i.price)*(i.quantity)}" /> 
                    </td>
                    <td>
                        <form action="process" method="post">
                            <input type="hidden" name="id" value="${i.product.productID}">
                            <input type="submit"  value="return">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <h3>
            talote : ${o.totalMoney}
        </h3>
        <hr/>
        <form action="checkout" method="post">
            <input type="submit" value="check out">
        </form>
        <a href="Product">as</a>
    </body>
</html>
