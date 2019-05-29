<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="bean.Cart" %>
<%@ page import="java.util.List" %><%--
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
    <title>购物车</title>
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
</head>
<%
    List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
    int sum = 0;
    for (Cart cart : cartList) {
        sum = sum + Integer.valueOf(cart.getGnum()) * Integer.valueOf(cart.getPrice());
    }
    Cookie cookie = new Cookie("TotalPrice", String.valueOf(sum));//将总价传入cookie
    response.addCookie(cookie);
%>
<script>
    function DrawImge(img, width, height) {
        img.width = width;
        img.height = height;

    }

    function deteleall() {
        $.ajax({
            type: "POST",
            url: "cart",
            data: {
                flag: 'deleteall'
            },
            async: true,
            dataType: 'JSON',
            success: function () {
                location.reload();
            },
            error: function () {
                location.reload();
            }
        });
    }

    //删除单个
    function detele(gid1) {
        $.ajax({
            type: "POST",
            url: "cart",
            data: {
                gid: gid1,
                flag: 'delete'
            },
            async: true,
            dataType: 'JSON',
            success: function () {
                var x = document.getElementById(gid1);
                x.remove();
            },
            error: function () {
                var x = document.getElementById(gid1);
                x.remove();
            }
        });
    }

    function heji(obj, gid1) {
        var pp = $(obj).parent().parent();
        var price = pp.find(".gprice").text();
        pp.find(".tprice").text(parseFloat(obj.value) * parseFloat(price))
        //向后台发送修改数据的请求
        $.ajax({
            type: "POST",
            url: "cart",
            data: {
                gid: gid1,
                gnum: obj.value,
                flag: "updata"
            },
            success: function (result) {
                var y =result.substring(1,result.length-1);//得到总价的值
                var z = "￥ "+y;
                document.getElementById("Total1").innerText=z;
                document.getElementById("TotalPrice").innerText=z;
            },
            error: function (result) {
                var y =result.substring(1,result.length-1);//得到总价的值
                var z = "￥ "+y;
                document.getElementById("Total1").innerText=z;
                document.getElementById("TotalPrice").innerText=z;
            }
        });
    }

</script>
<body class="animsition">
<div class="shop-cart" id="page">
    <%@ include file="head.jsp" %>
    <section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="picture/013.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">购 物 车</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="woocommerce">
                <form class="woocommerce-cart-form">
                    <table class="woocommerce-cart-table">
                        <thead>
                        <tr>
                            <th class="product-thumbnail">商品</th>
                            <th class="product-name"></th>
                            <th class="product-weight">重量</th>
                            <th class="product-quantity">数量</th>
                            <th class="product-price">单价</th>
                            <th class="product-subtotal">合计</th>
                            <th class="product-remove"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="sum1" value="0"></c:set>
                        <c:forEach var="goods" items="<%=cartList%>">
                            <tr id="${goods.gid}">
                                <td class="product-thumbnail">
                                    <img src="${goods.gurl}" alt="product-thumbnail" onload="DrawImge(this,100,84)">
                                </td>
                                <td class="product-name" data-title="Product">
                                    <a class="product-name" href="goodsdetail?gid=${goods.gid}">${goods.gname}</a>
                                </td>
                                <td class="product-weight" data-title="Weight">${goods.gweight}</td>
                                <td class="product-quantity" data-title="Quantity">
                                    <input class="qty" step="1" min="0" max="" name="product-name" value="${goods.gnum}"
                                           size="4" pattern="[1-9]*" inputmode="numeric" type="number" id="goodsnum"
                                           onchange="heji(this,${goods.gid})">
                                </td>
                                <td class="product-price" data-title="Price" id="price1">¥ <span
                                        class="gprice">${goods.price}</span></td>
                                <td class="product-subtotal" data-title="Total" id="total"><span
                                        class="tprice">${goods.price*goods.gnum}</span></td>
                                <td class="product-remove">
                                    <a class="remove" aria-label="Remove this item"
                                       onclick="detele(${goods.gid})">×</a>
                                </td>
                            </tr>
                            <c:set var="sum1" value="${sum1+goods.gnum*goods.price}"></c:set>
                        </c:forEach>
                        <%
                            System.out.println();
                        %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="7">
                                <div class="form-coupon organic-form">
                                    <div class="form-group update-cart">
                                        <a class="btn btn-brand-ghost pill" onclick="deteleall()")>清空购物车</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </form>
                <div class="cart_totals">
                    <h3 class="title">购物车合计</h3>
                    <form method="post" action="settlement">
                    <div class="row">
                        <div class="col-md-8">
                            <table class="woocommerce-cart-subtotal">
                                <tbody>
                                <tr>
                                    <th>合 计</th>
                                    <td data-title="Total" id = "Total1">￥ ${sum1}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="proceed-to-checkout">
                                <button class="btn btn-brand pill" type="submit">提交订单</button>
                            </div>
                        </div>
                        <input value="${sum1}" name="Total" hidden="hidden" id="TotalPrice">
                        <input value="<%=cartList%>" name="cartList" hidden="hidden">
                    </div> </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="foot.html" %>
</body>
</html>
