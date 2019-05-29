<%@ page import="bean.Goods" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/5 0005
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>商品列表</title>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="css/647be82565184316a7ba9bc638b40a97.css" rel="stylesheet"/>
    <link href="css/1025b57c3b8b4b63a93efd3b6bed0d58.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
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
    <script src="js/config-carousel-product-quickview.js"></script>
    <link rel="stylesheet" href="css/style.css">


    <!-- Demo Only-->

</head>
<%
    @SuppressWarnings("unchecked")
    List<Goods> goodsList = (List<Goods>) request.getAttribute("goodsList10");
    String keyword = (String) request.getAttribute("keyword");

%>

<script>


    function favorite(gid1) {
        $.ajax({
            type: "POST",
            url: "favorite",
            data: {
                gid: gid1,
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
<style>
    div.result{
       position: relative;
        left:20%;
        top:100px;
        font-size: 20px;
    }

    div.result a{
        color:black;
    }
</style>
<body class="animsition">
<div class="shop-layout-1" id="page">
    <%@ include file="head.jsp" %>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="picture/01.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">商 品 列 表</h3>
    </section>
    <div class="result"><a>关于 <font color="red"><%=keyword%></font> 的商品总共搜索到  <font color="red"><%=goodsList==null?0:goodsList.size()%></font> 个商品</a></div>
    <div class="woocommerce-top-control wrapper">
        <section class="boxed-sm">
            <div class="container">
                <div class="row">

                </div>
            </div>
        </section>
    </div>
    <section class="box-sm">
        <div class="container">
            <div class="row main">
                <div class="row product-grid-equal-height-wrapper product-equal-height-4-columns flex multi-row">
                    <c:forEach var="goods" items="<%=goodsList%>">
                        <figure class="item">
                            <div class="product product-style-1">
                                <div class="img-wrapper">
                                    <a href="goodsdetail?gid=${goods.gid}">
                                        <img class="img-responsive" src="${goods.gurl}" alt="product thumbnail"
                                             onclick="action(${goods.gid})" href=""/>
                                    </a>
                                    <div class="product-control-wrapper bottom-right">
                                        <div class="wrapper-control-item item-wish-list">
                                            <a class="js-wish-list js-notify-add-wish-list">
                                                <span class="lnr lnr-heart" onclick="favorite(${goods.gid})"></span>
                                            </a>
                                        </div>
                                        <div class="wrapper-control-item item-add-cart js-action-add-cart">
                                            <a class="animate-icon-cart" >
                                                <span class="lnr lnr-cart" onclick="cart(${goods.gid})"></span>
                                            </a>
                                            <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
                                                <path stroke-dasharray="19.79 19.79" fill="none" ,="," stroke-width="2"
                                                      stroke-linecap="square" stroke-miterlimit="10"
                                                      d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                                <figcaption class="desc text-center">
                                    <h3>
                                        <a class="product-name" href="goodsdetail?gid=${goods.gid}">${goods.gname}</a>
                                    </h3>
                                    <span class="price">¥ ${goods.price}</span>
                                </figcaption>
                            </div>
                        </figure>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
</div>

<%@include file="foot.html" %>
</html>