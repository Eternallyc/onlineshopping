<%@ page import="SMS.Sms" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2 0002
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户注册</title>
    <meta charset="utf-8"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="css/647be82565184316a7ba9bc638b40a97.css" rel="stylesheet"/>
    <link href="css/1025b57c3b8b4b63a93efd3b6bed0d58.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script src="js/jquery.min.js"></script>
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
<style>
    .checkCode {
        position:relative;
        left:354px;
        top:-49px;
        background:#f2f2f2;
        cursor: pointer;
        border: 0px solid black;
        text-align: center;
        line-height: 26px;
        width: 115px;
        height: 49px;
    }
    .yanzhenma{
        position:relative;
        top:-50px;
    }
</style>
<script>
    var telvc = "";
    function chargeid() {
        var x, y, z, l, text;
        x = document.register.cname.value;//帐号
        y = document.register.cpassword.value;//密码
        z = document.register.confirm.value;//确认密码
        l = document.register.ctel.value;//手机号码
        vc = document.register.vc.value;//验证码
        var isMobile = /^1[3578]\d{9}$|^147\d{8}$/;
        var checek = document.getElementById("agreement");
        if (x.length < 6 || x.length > 12 || !(/^[0-9a-zA-Z]+$/.test(x))) {
            text = "请输入6-12个由字母和数字组成的用户名";
            alert(text);
            return false;//阻止表单提交
        } else if (y.length < 6 || y.length > 16) {
            text = "密码长度为6-16";
            alert(text);
            return false;//阻止表单提交
        }
        else if (z !== y) {
            text = "密码与上次密码不一致";
            alert(text);
            return false;//阻止表单提交
        }
        else if (l.length !== 11 || !isMobile.test(l)) {
            text = "请输入有效的手机号码";
            alert(text);
            return false;//阻止表单提交
        } else if (checek.checked === false) {
            alert("请您阅读协议后再注册!")
            return false;
        }else if(vc.length!==6){
            alert("请输入6位的验证码");
            return false;
        }
        else if(vc != telvc || telvc == ''){
            alert("验证码不正确");
            return false;
        }
        else {
            return true;
        }

    }
    var sleep = 30, interval = null;
    window.onload = function () {
        var btn = document.getElementById('btn');
        btn.onclick = function () {
            var l = document.register.ctel.value;//手机号码
            var isMobile = /^1[3578]\d{9}$|^147\d{8}$/;
            if (l.length !== 11 || !isMobile.test(l)) {
                text = "请输入有效的手机号码";
                alert(text);
                return ;//阻止表单提交
            }else{
                $.ajax({
                    url:"user",
                    type:"POST",
                    data:{
                        ctel:l,
                        flag:'vc'
                    },
                    async:true,
                    dataType:'JSON',
                    success:function(result) {
                        console.log(result);
                        telvc = result;
                    }
                });
            }
            if (!interval) {
                this.style.backgroundColor = 'rgb(243, 182, 182)';
                this.disabled = "disabled";
                this.style.cursor = "wait";
                this.value = "重新发送 (" + sleep-- + ")";
                interval = setInterval(function () {
                    if (sleep === 0) {
                        if (!!interval) {
                            clearInterval(interval);
                            interval = null;
                            sleep = 30;
                            btn.style.cursor = "pointer";
                            btn.removeAttribute('disabled');
                            btn.value = "获取验证码";
                            btn.style.backgroundColor = '';
                        }
                        return false;
                    }
                    btn.value = "重新发送 (" + sleep-- + ")";
                }, 1000);
            }
        }
    }
    function yanzhenma(){

    }
</script>
<body class="animsition">
<div class="login" id="page">
    <%@ include file="head.jsp"%>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="picture/011.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">我的账户</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="login-wrapper">
                <div class="row">
                    <h3>注 册</h3>
                    <form name="register" action="user" method="post" onSubmit="return chargeid();">

                        <div class="form-group organic-form-2">
                            <label>用户名</label>
                            <input type="hidden" name="flag" value="reg">
                            <input name="cname" class="form-control" type="text">

                        </div>
                        <div class="form-group organic-form-2">
                            <label>密码</label>
                            <input name="cpassword" class="form-control" type="Password">
                        </div>
                        <div class="form-group organic-form-2">
                            <label>确认密码</label>
                            <input name="confirm" class="form-control" type="Password">
                        </div>
                        <div class="form-group organic-form-2">
                            <label>手机号</label>
                            <input name="ctel" class="form-control" type="text">
                            <input class="checkCode" type="button" id="btn" value="获取验证码"/>
                        </div>
                        <div class="form-group organic-form-2 yanzhenma">
                            <label>验证码</label>
                            <input name="vc" class="form-control" type="text">
                        </div>
                        <div class="form-group remember-me">
                            <div class="checkbox pull-left">
                                <label>
                                    <input type="checkbox" id="agreement"> 我已经阅读协议
                                </label>
                            </div>
                        </div>
                        <div class="form-group footer-form">
                            <button class="btn btn-brand pill" type="submit">注 册</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="foot.html"%>
</body>
</html>




