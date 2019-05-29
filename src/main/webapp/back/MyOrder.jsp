<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/1 0001
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.String"%>
<%@ page import="bean.OrderInfo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的订单</title>
    <meta charset="utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/647be82565184316a7ba9bc638b40a97.css" rel="stylesheet" />
    <link href="css/1025b57c3b8b4b63a93efd3b6bed0d58.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/function-check-viewport.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/select2.full.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/jquery.mmenu.all.min.js"></script>
    <script src="js/rellax.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/bootstrap-notify.min.js"></script>
    <script src="js/bootstrap-slider.js"></script>
    <script src="js/in-view.min.js"></script>
    <script src="js/countup.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/global.js"></script>
    <script src="js/config-mm-menu.js"></script>
    <script src="js/config-set-bg-blog-thumb.js"></script>
    <script src="js/config-accrodion.js">
    </script>

</head>
<%
   List<OrderInfo>orderInfoList = (List<OrderInfo>) request.getAttribute("tol");//得到总表
%>
<style>
    td{
        font-size: 20px;
        font-weight:bold;
        text-align:center;
    }
</style>
<body class="animsition">
<div class="login" id="page">
    <%@ include file="head.jsp"%>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="picture/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">订 单 列 表</h3>
    </section>
    <br>
    <table class="table">
        <thead>
        <tr>
            <td align="center">订单号</td>
            <td align="center">商品名</td>
            <td align="center">商品价格</td>
            <td align="center">商品数量</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="goods" items="<%=orderInfoList%>">
        <tr>
            <td align="center">${goods.orderid}</td>
            <td align="center">${goods.gname}</td>
            <td align="center">${goods.price}</td>
            <td align="center">${goods.num}</td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<%@include file="foot.html"%>
</body>
</html>
