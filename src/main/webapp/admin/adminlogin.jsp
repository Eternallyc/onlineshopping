<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/12 0012
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
<script src="/admin/gt.js"></script>
<style>
    p.hide1{
        display: none;
        color:crimson;
    }
    .show1 {
        display: block;
    }
</style>
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.js"></script>
<%

%>
<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <p class="lead">张家界土特产在线电子商城后台管理</p>
                        </div>
                        <form class="form-auth-small" action="ajax-validate2" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="mid" placeholder="管理员账号" name="mid">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="mpassword" placeholder="密码" name="mpassword">
                            </div>

                            <div>
                                <div id="captcha2">
                                    <p id="wait2" class="show1">正在加载验证码......</p>
                                </div>
                            </div>
                            <br>
                            <p id="notice2" class="hide1">请先完成验证</p>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="submit2">登  录</button>
                        </form>
                    </div>
                </div>
                <div class="right">
                    <div class="overlay"></div>
                    <div class="content text">
                        <h1 class="heading">张家界土特产在线电子商城后台管理系统</h1>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>

<!-- END WRAPPER -->
</body>
<script>
    var handler2 = function (captchaObj) {
        $("#submit2").click(function (e) {
            var result = captchaObj.getValidate();
            if (!result) {
                $("#notice2").show();
                setTimeout(function () {
                    $("#notice2").hide();
                }, 2000);
                e.preventDefault();
            }

        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值用于表单提交
        captchaObj.appendTo("#captcha2");
        captchaObj.onReady(function () {
            $("#wait2").hide();
        });
    };


    $.ajax({
        url: "register2?t=" + (new Date()).getTime(), // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                new_captcha: data.new_captcha, // 用于宕机时表示是新验证码的宕机
                offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                product: "popup", // 产品形式，包括：float，popup
                width: "100%"
            }, handler2);
        },
        error:function () {
        }
    });

</script>
</html>
