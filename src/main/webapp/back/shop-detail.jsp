<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.GoodsDetail" %>
<%@ page import="bean.Goods" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/5 0005
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品详情</title>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="css/647be82565184316a7ba9bc638b40a97.css" rel="stylesheet"/>
    <link href="css/1025b57c3b8b4b63a93efd3b6bed0d58.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>

<%
    GoodsDetail goodsDetail = (GoodsDetail) request.getAttribute("goodsDetail");
    //相关商品
    GoodsDetail one1 = (GoodsDetail) request.getAttribute("one1");
    GoodsDetail one2 = (GoodsDetail) request.getAttribute("one2");
    GoodsDetail one3 = (GoodsDetail) request.getAttribute("one3");
    GoodsDetail one4 = (GoodsDetail) request.getAttribute("one4");
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
<div class="shop-detail-3 woocommerce" id="page">
    <%@ include file="head.jsp" %>
    <section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="picture/017.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">商品详情</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="row product-detail">
                <div class="row product-detail-wrapper">
                    <div class="col-md-6">
                        <div class="woocommerce-product-gallery vertical">
                            <div class="main-carousel">
                                <div class="item">
                                    <img class="img-responsive" src="<%=goodsDetail.getGurl()%>"
                                         alt="product thumbnail">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="summary">
                            <div class="desc">
                                <div class="header-desc">
                                    <h2 class="product-title"><%=goodsDetail.getGname()%>
                                    </h2>
                                    <p class="price">¥ <%=goodsDetail.getPrice()%>
                                    </p>
                                </div>
                                <div class="body-desc">
                                    <div class="woocommerce-product-details-short-description">
                                        <p><%=goodsDetail.getDescript1()%>
                                        </p>
                                    </div>
                                </div>
                                <div class="footer-desc">
                                    <form class="cart">
                                        <div class="quantity buttons-added">
                                            <input class="minus" value="-" type="button">
                                            <input class="input-text qty text" step="1" min="1" max="" name="quantity"
                                                   value="1" title="Qty" size="4" pattern="[0-9]*" inputmode="numeric"
                                                   type="number">
                                            <input class="plus" value="+" type="button">
                                        </div>
                                    </form>
                                    <br>
                                    <br><br>
                                    <div class="group-btn-control-wrapper">
                                        <button class="btn btn-brand no-radius" onclick="cart(<%=goodsDetail.getGid()%>)">加入购物车</button>
                                        <button class="btn btn-wishlist btn-brand-ghost no-radius"
                                                onclick="favorite(<%=goodsDetail.getGid()%>)">
                                            <i class="fa fa-heart"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="product-meta">
                                <p class="id">ID:
                                    <a><%=goodsDetail.getGid()%>
                                    </a>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="woocommerce-tabs">
                <div class="row">
                    <div class="col-md-12 woocommerce-tabs-inner">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <ul class="tabs tab-style-2" role="tablist">
                                    <li class="active" role="presentation">
                                        <a href="#Description" aria-controls="Description" role="tab" data-toggle="tab">商
                                            品 详 情</a>
                                    </li>
                                    <li role="presentation">
                                        <a href="#Additional-Information" aria-controls="Additional-Information"
                                           role="tab" data-toggle="tab">商 品 参 数</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8 col-md-offset-2">
                        <div class="tab-content tab-content-style-2">
                            <div class="tab-pane fade in active" id="Description" role="tabpanel">
                                <p><%=goodsDetail.getDescript2()%>
                                </p>
                            </div>
                            <div class="tab-pane fade" id="Additional-Information" role="tabpanel">
                                <table class="shop_attributes table table-striped table-bordered">
                                    <tbody>
                                    <tr>
                                        <th>商品名</th>
                                        <td>
                                            <p><%=goodsDetail.getGname()%>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>价格</th>
                                        <td>
                                            <p><%=goodsDetail.getPrice()%>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>重量</th>
                                        <td>
                                            <p><%=goodsDetail.getGweight()%>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>销售量</th>
                                        <td>
                                            <p><%=goodsDetail.getSalesvolum()%>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>库存量</th>
                                        <td>
                                            <p><%=goodsDetail.getInventory() %>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>所属地区</th>
                                        <td>
                                            <p>张家界</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>次日能否发货</th>
                                        <td>
                                            <p>能</p>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="relate-product">
                <div class="heading-wrapper text-center">
                    <h3 class="heading">相关商品</h3>
                </div>
                <div class="row">
                    <div class="carousel-product">
                        <div class="item">
                            <figure class="item">
                                <div class="product product-style-1">
                                    <div class="img-wrapper">
                                        <a href="goodsdetail?gid=${one1.gid}">
                                            <img class="img-responsive" src="${one1.gurl}" alt="product thumbnail">
                                        </a>
                                        <div class="product-control-wrapper bottom-right">
                                            <div class="wrapper-control-item item-wish-list">
                                                <a class="js-wish-list js-notify-add-wish-list" href="#">
                                                    <span class="lnr lnr-heart"></span>
                                                </a>
                                            </div>
                                            <div class="wrapper-control-item item-add-cart js-action-add-cart">
                                                <a class="animate-icon-cart" href="#">
                                                    <span class="lnr lnr-cart" onclick="cart(<%=one1.getGid()%>)"></span>
                                                </a>
                                                <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
                                                    <path stroke-dasharray="19.79 19.79" fill="none" ,=","
                                                          stroke-width="2" stroke-linecap="square"
                                                          stroke-miterlimit="10"
                                                          d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <figcaption class="desc text-center">
                                        <h3>
                                            <a class="product-name" href="goodsdetail?gid=${one1.gid}">${one1.gname}</a>
                                        </h3>
                                        <span class="price">￥ ${one1.price}</span>
                                    </figcaption>
                                </div>
                            </figure>
                        </div>
                        <div class="item">
                            <figure class="item">
                                <div class="product product-style-1">
                                    <div class="img-wrapper">
                                        <a href="goodsdetail?gid=${one2.gid}">
                                            <img class="img-responsive" src="${one2.gurl}" alt="product thumbnail">
                                        </a>
                                        <div class="product-control-wrapper bottom-right">
                                            <div class="wrapper-control-item item-wish-list">
                                                <a class="js-wish-list js-notify-add-wish-list" href="#">
                                                    <span class="lnr lnr-heart"></span>
                                                </a>
                                            </div>
                                            <div class="wrapper-control-item item-add-cart js-action-add-cart">
                                                <a class="animate-icon-cart" href="#">
                                                    <span class="lnr lnr-cart" onclick="cart(<%=one2.getGid()%>)"></span>
                                                </a>
                                                <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
                                                    <path stroke-dasharray="19.79 19.79" fill="none" ,=","
                                                          stroke-width="2" stroke-linecap="square"
                                                          stroke-miterlimit="10"
                                                          d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <figcaption class="desc text-center">
                                        <h3>
                                            <a class="product-name" href="goodsdetail?gid=${one2.gid}">${one2.gname}</a>
                                        </h3>
                                        <span class="price">￥ ${one2.price}</span>
                                    </figcaption>
                                </div>
                            </figure>
                        </div>
                        <div class="item">
                            <figure class="item">
                                <div class="product product-style-1">
                                    <div class="img-wrapper">
                                        <a href="goodsdetail?gid=${one3.gid}">
                                            <img class="img-responsive" src="${one3.gurl}" alt="product thumbnail">
                                        </a>
                                        <div class="product-control-wrapper bottom-right">
                                            <div class="wrapper-control-item item-wish-list">
                                                <a class="js-wish-list js-notify-add-wish-list" href="#">
                                                    <span class="lnr lnr-heart"></span>
                                                </a>
                                            </div>
                                            <div class="wrapper-control-item item-add-cart js-action-add-cart">
                                                <a class="animate-icon-cart" href="#">
                                                    <span class="lnr lnr-cart" onclick="cart(<%=one3.getGid()%>)"></span>
                                                </a>
                                                <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
                                                    <path stroke-dasharray="19.79 19.79" fill="none" ,=","
                                                          stroke-width="2" stroke-linecap="square"
                                                          stroke-miterlimit="10"
                                                          d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <figcaption class="desc text-center">
                                        <h3>
                                            <a class="product-name" href="goodsdetail?gid=${one3.gid}">${one3.gname}</a>
                                        </h3>
                                        <span class="price">￥ ${one3.price}</span>
                                    </figcaption>
                                </div>
                            </figure>
                        </div>
                        <div class="item">
                            <figure class="item">
                                <div class="product product-style-1">
                                    <div class="img-wrapper">
                                        <a href="goodsdetail?gid=${one4.gid}">
                                            <img class="img-responsive" src="${one4.gurl}" alt="product thumbnail">
                                        </a>
                                        <div class="product-control-wrapper bottom-right">
                                            <div class="wrapper-control-item item-wish-list">
                                                <a class="js-wish-list js-notify-add-wish-list" href="#">
                                                    <span class="lnr lnr-heart"></span>
                                                </a>
                                            </div>
                                            <div class="wrapper-control-item item-add-cart js-action-add-cart">
                                                <a class="animate-icon-cart" href="#">
                                                    <span class="lnr lnr-cart" onclick="cart(<%=one4.getGid()%>)"></span>
                                                </a>
                                                <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
                                                    <path stroke-dasharray="19.79 19.79" fill="none" ,=","
                                                          stroke-width="2" stroke-linecap="square"
                                                          stroke-miterlimit="10"
                                                          d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <figcaption class="desc text-center">
                                        <h3>
                                            <a class="product-name" href="goodsdetail?gid=${one4.gid}">${one4.gname}</a>
                                        </h3>
                                        <span class="price">￥ ${one4.price}</span>
                                    </figcaption>
                                </div>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="foot.html" %>
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
<script src="js/config-carousel.js">


</script>
<script src="js/config-carousel-thumbnail.js">


</script>
<script src="js/config-carousel-product-quickview.js"></script>
<!-- Demo Only-->
<script src="js/demo-add-to-cart.js">


</script>
</body>
</html>
