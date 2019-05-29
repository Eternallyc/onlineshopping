<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Favorite" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/5 0005
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>收藏列表</title>
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
</head>
<%
    @SuppressWarnings("unchecked")
    List<Favorite> favorites = (List<Favorite>) request.getAttribute("favoritelist");
%>
<script>
    function DrawImge(img,width,height) {
        img.width=width;
        img.height=height;
    }
    function cancel(gid1) {
        $.ajax({
            type:"POST",
            url:"favorite",
            data:{
                gid:gid1,
                flag:'delete'
            },
            async:true,
            dataType:'JSON',
            success:function() {
                var favorite = document.getElementById(gid1);
                  favorite.remove();
            },
            error:function(){
                var favorite = document.getElementById(gid1);
                favorite.remove();
            }
        });
    }
    function cart(gid1) {
        $.ajax({
            type: "POST",
            url: "cart",
            data: {
                gid: gid1,
                gnum: '1',
                flag: 'add'
            },
            async: true,
            dataType: 'JSON',
            success: function (result) {
                console.log(result);
                telvc = result;
            }
        });
    }
</script>
<body class="animsition">
<div class="wish-list" id="page">
    <%@ include file="head.jsp"%>
    <section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="picture/014.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">收 藏</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="woocommerce">
                <form class="woocommerce-cart-form">
                    <table class="woocommerce-cart-table">
                        <thead>
                        <tr>
                            <th class="product-thumbnail">商 品</th>
                            <th class="product-name"></th>
                            <th class="product-price">价 格</th>
                            <th class="product-status">库存状态</th>
                            <th class="product-add-to-cart"></th>
                            <th class="product-remove"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="goods" items="<%=favorites%>">
                            <tr id="${goods.gid}">

                                <td class="product-thumbnail">
                                    <img src="${goods.gurl}" alt="product-thumbnail" onload="javascript:DrawImge(this,100,84)">
                                </td>
                                <td class="product-name" data-title="Product">
                                    <a class="product-name" href="goodsdetail?gid=${goods.gid}">${goods.gname}</a>
                                </td>
                                <td class="product-price" data-title="Weight">¥ ${goods.price}</td>
                                <td class="product-stock-status" data-title="Stock Status">
                                    <a href="goodsdetail?gid=${goods.gid}">${goods!="0"?"在售":"缺货"}</a>
                                </td>
                                <td class="product-add-to-cart">
                                    <a class="btn btn-brand" href="javascript:void(0)" onclick="cart(${goods.gid})">加入购物车</a>
                                </td>
                                <td class="product-remove text-right">
                                    <a class="remove" aria-label="Remove this item" onclick="cancel(${goods.gid})">x</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </section>
</div>
<%@include file="foot.html"%>
</body>
</html>

