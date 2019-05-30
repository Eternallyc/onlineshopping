<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="utils.PageBean" %>
<%@ page import="bean.Goods" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/12 0012
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <title>Tables</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./paging.css">
</head>
<style>
    .tables {
        position: relative;
        top: -80px;
        background: #fff;
        left: 9%;
        border-style: none;
        border: 0;
    }

    th {
        background: #ddd;
        height: 48px;
        text-align: center;
    }

    td {

        height: 48px;
    }

    button.button1 {
        background-color: #e7e7e7;
        color: black;
        border: none;
        text-align: center;
        cursor: pointer;
    }
    .daochu{
        position: absolute;
        top:59px;
        left:1410px;
    }


</style>
<script>
    //商品删除操作
    function dele(gid1) {
        $.ajax({
            type: "POST",
            url: "Operation",
            data: {
                flag: "delete",
                gid: gid1
            },
            success: function () {
                location.reload();
            },
            error: function () {
                location.reload();
            }
        });
    }

    //商品修改操作
    function update(obj) {
        var goods =$(obj).parent().parent();
        var gid1 = goods.find(".gid2").text();
        var gname1 = goods.find(".gname2").text();
        var gurl1 = goods.find(".gurl2").text();
        var price1 = goods.find(".price2").text();
        var gweight1 = goods.find(".gweight2").text();
        var salesvolume1 = goods.find(".salesvolume2").text();
        var inventory1 = goods.find(".inventory2").text();

        $.ajax({
            type:"POST",
            url:"Operation",
            data:{
                flag:"update",
                gid:gid1,
                gname:gname1,
                gurl:gurl1,
                price:price1,
                salesvolume:salesvolume1,
                inventory:inventory1,
                gweight:gweight1
            },
            success:function () {
            },
            error:function () {
            }
        });
    }

    function daochu() {
        alert("正在导出表");
        $.ajax({
            type:"POST",
            url:"export",
            success:function () {
                alert("导出成功");
            },
            error:function () {
                alert("导出成功");
            }
        });
    }
</script>
<body>
<%
    PageBean<Goods> pageBean = (PageBean<Goods>) request.getAttribute("pageBean");
%>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <%@ include file="adminhead.html" %>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="admin" class=""><i class="lnr lnr-home"></i> <span>实时数据</span></a></li>
                    <li><a href="admintable" class="active"><i class="lnr lnr-dice"></i> <span>商品列表</span></a></li>
                    <li><a href="goodsadd.jsp" class=""><i class="lnr lnr-linearicons"></i> <span>商品发布</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <br>
    <br><br><br><br><br><br><br>
    <table border="1" class="tables" width="80%" align="center">
        <tr>
            <th align="center">商品号</th>
            <th align="center">商品名称</th>
            <th align="center">图片地址</th>
            <th align="center">商品价格</th>
            <th align="center">商品重量</th>
            <th align="center">商品销售量</th>
            <th align="center">商品库存量</th>
            <th align="center">操作</th>
        </tr>
        <div class="daochu"><button class="button1" onclick="daochu()">全部导出</button></div>
        <c:choose>
            <c:when test="<%=pageBean.getList().size()!=0%>">
                <c:forEach items="<%=pageBean.getList()%>" var="goods">
                    <tr>
                        <td align="center" class="gid2">${goods.gid}</td>
                        <td contentEditable="true" align="center" class="gname2">${goods.gname}</td>
                        <td contentEditable="true" align="center" class="gurl2">${goods.gurl}</td>
                        <td contentEditable="true" align="center" class="price2">${goods.price}</td>
                        <td contentEditable="true" align="center" class="gweight2">${goods.gweight}</td>
                        <td contentEditable="true" align="center" class="salesvolume2">${goods.salesvolume}</td>
                        <td contentEditable="true" align="center" class="inventory2">${goods.inventory}</td>
                        <td align="center">
                            <button class="button1" onclick="update(this)">修改</button>
                            <button class="button1" onclick="dele(${goods.gid})">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="8">对不起，没有你要找的数据</td>
                </tr>
            </c:otherwise>
        </c:choose>
        <tr>
            <td colspan="8" align="center">
                当前页：<%=pageBean.getCurrPage()%>/<%=pageBean.getTotalPage()%>
                <a href="${pageContext.request.contextPath}/admin/admintable?currPage=1">首页</a>
                <a href="${pageContext.request.contextPath}/admin/admintable?currPage=<%=pageBean.getCurrPage()-1%>">上一页</a>
                <a href="${pageContext.request.contextPath}/admin/admintable?currPage=<%=pageBean.getCurrPage()+1%>">下一页</a>
                <a href="${pageContext.request.contextPath}/admin/admintable?currPage=<%=pageBean.getTotalPage()%>">末页</a>
            </td>
        </tr>
    </table>

</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
</body>

</html>
