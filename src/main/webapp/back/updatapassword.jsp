<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/1 0001
  Time: 1:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.lang.String"%>
<!DOCTYPE html>
<html>
<head>
    <title>更改密码</title>
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
    <%
        String cname = "";
        String cpassword = "";
        Cookie[] cookie = request.getCookies();
        for(Cookie e:cookie){
            if(e.getName().equals("cname")){
                cname=e.getValue();
            }
            else if(e.getName().equals("cpassword")){
                cpassword=e.getValue();
            }
        }
    %>
</head>
<script>
    function chargepassword(obj){
        var password = document.updata.cpassword.value;
        var confirm = document.updata.confirm.value;
        if(password!==confirm){
            alert("两次密码不一致");
        }else if(password.length<6||password.length>16){
            text = "密码长度为6-16";
            alert(text);
            return false;//阻止表单提交
        }
        return true;
    }
</script>
<body class="animsition">
<div class="login" id="page">
    <%@ include file="head.jsp"%>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="http://m.tuniucdn.com/fb2/t1/G5/M00/BA/A9/Cii-slrQRXaIUyXYAANgMSlBDW8AAFjNwNjHJsAA2BJ735_w320_h180_c1_t0.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">我的账户</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="login-wrapper">
                <div class="row">
                    <h3>修改密码</h3>
                    <form action="updatapassword" name="updata" onsubmit="return chargepassword(this);" method="post">
                        <div class="form-group organic-form-2">
                            <label>新密码</label>
                            <input class="form-control" type="Password" name="cpassword">
                        </div>
                        <div class="form-group organic-form-2">
                            <label>确认密码</label>
                            <input class="form-control" type="Password" name="confirm" >
                        </div>
                        <div class="form-group footer-form">
                            <button class="btn btn-brand pill" type="submit">修 改</button>
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
