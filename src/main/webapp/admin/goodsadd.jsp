<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/12 0012
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>
<style>
    .goods-add {
        position: absolute;
        top: 10%;
        left: 19%;
        background: #fff;
        width: 1200px;
        height: 600px;
    }

    button.button1 {
        font-size: 26px;
        background-color: #e7e7e7;
        color: black;
        border: none;
        text-align: center;
        cursor: pointer;
    }
</style>
<script>
    function post1() {
        var gid1 = document.getElementById("id2").value;
        var gname1 = document.getElementById("gname2").value;
        var gurl1 = document.getElementById("gurl2").value;
        var price1 = document.getElementById("price2").value;
        var gweight1 = document.getElementById("gweight2").value;
        var inventory1 = document.getElementById("inventory2").value;
        var reg = new RegExp("^(?!00)(?:[0-9]{1,4}|10000)$");
        if (gid1.length < 1 || gid1.length > 5 || !reg.test(gid1)) {
            alert("请输入正确的商品id");
            return;
        } else if (gname1.length < 1) {
            alert("请输入商品名称");
            return;
        }
        else if (gurl1.length < 1) {
            alert("请输入商品图片URL");
            return;
        }
        else if (price1.length < 1) {
            alert("请输入商品价格");
            return;
        }
        else if (gweight1.length < 1) {
            alert("请输入商品重量");
            return;
        }
        else if (inventory1.length < 1) {
            alert("请输入商品库存量");
            return;
        }
        $.ajax({
            type: "POST",
            url: "goodsadd",
            data: {
                gid: gid1,
                flag: "check"
            },
            success: function (result) {
                var y = result.substring(1, result.length - 1);//得到返回值
                if (y==="1") {
                    alert("有相同的商品id");
                    flag2=true;
                }
            },
            error: function (result) {
                var y = result.substring(1, result.length - 1);//得到返回值
                if (y==="1") {
                    alert("有相同的商品id");
                    flag2=true;
                }
            }

        });

        var r = confirm("请确认信息正确");
        if (r ===true) {
            $.ajax({
                type: "POST",
                url: "goodsadd",
                data: {
                    gid: gid1,
                    gname:gname1,
                    gurl:gurl1,
                    price:price1,
                    gweight:gweight1,
                    inventory:inventory1,
                    flag: "add"
                }, success: function (result) {

                },
                error: function (result) {

                }
            });
        }
    }
</script>
<body>
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
                    <li><a href="admintable" class=""><i class="lnr lnr-dice"></i> <span>商品列表</span></a></li>
                    <li><a href="goodsadd.jsp" class="active"><i class="lnr lnr-linearicons"></i> <span>商品发布</span></a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

</div>

<div class="panel goods-add">
    <div class="panel-heading">
        <h3 class="panel-title" align="center"><font size="6">请输入增加的商品信息</font></h3>
    </div>
    <div class="panel-body">
        <input class="form-control input-lg" placeholder="商品id(全为数字)" type="text" id="id2">
        <br>
        <input class="form-control input-lg" placeholder="商品名称" type="text" id="gname2">
        <br>
        <input class="form-control input-lg" placeholder="商品图片url" type="text" id="gurl2">
        <br>
        <input class="form-control input-lg" placeholder="商品价格" type="text" id="price2">
        <br>
        <input class="form-control input-lg" placeholder="商品库存量" type="text" id="inventory2">
        <br>
        <input class="form-control input-lg" placeholder="商品重量" type="text" id="gweight2">
        <br>
        <br>
        <h3 class="panel-title" align="center">
            <button class="button1" onclick="post1()">增加商品</button>
        </h3>
        <br>
    </div>
</div>

<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
</body>
</html>
