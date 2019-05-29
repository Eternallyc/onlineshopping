<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/4 0004
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>常见问题</title>
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
    <script src="js/config-accrodion.js"></script>
</head>
<body class="animsition">
<div class="faq" id="page">
    <%@ include file="head.jsp"%>
    <section class="sub-header shop-layout-1">
        <img class="rellax bg-overlay" src="picture/010.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">常 见 问 题</h3>
    </section>
    <section class="boxed-sm">
        <div class="container">
            <div class="faq-wrapper">
                <div class="row">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingOne" role="tab">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <i class="more-less fa fa-angle-down"></i>支付后查询不到物流订单怎么办？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">亲爱的买家，若您在已买到宝贝中无法查看集运订单，
                                    请您前往个人中心-已购买页面中查看哦。 </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingTwo" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <i class="more-less fa fa-angle-down"></i>如何修改收货地址？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    交易在下单的时候一旦填写地址选择了官方物流，提交订单之后是无法修改地址的。如果您不小心提交了订单，请您查看一下下面三种处理方案哦：
                                    处理方案分三种：
                                    1）如果您只是下单，还没有付款，这时候，您就不要付款，直接去重新下单购买一次，购买的时候，填写正确的地址。
                                    2）如果您已经下单并付款，那就很抱歉的告诉您，需要申请退款之后重新下单购买。同样的，记得要填写正确的地址。检查清楚再去付款哟。
                                    3）如果货物已被卖家发出、转运商已签收入库，那么需要您直接联系转运商，协商修改地址的事宜哦，具体办法和结果以转运商为准。
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingThree" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <i class="more-less fa fa-angle-down"></i>如何联系卖家？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseThree" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">您可以通过手机、QQ、微信等方式与卖家取得联系</div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingFour" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                        <i class="more-less fa fa-angle-down"></i>如何修改订单的商品信息（如数量）</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseFour" role="tabpanel" aria-labelledby="headingFour">
                                <div class="panel-body">亲，若您的订单为 等待买家付款 状态，您是可以取消订单，建议您重新下单付款;若您的订单是已付款，显示 买家已付款 或 卖家已发货 状态：页面无法修改订单信息，建议您联系卖家说明您想要更改的信息。</div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingFive" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                        <i class="more-less fa fa-angle-down"></i>什么情况下可以评价？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseFive" role="tabpanel" aria-labelledby="headingFive">
                                <div class="panel-body">交易订单的订单状态显示“交易完成”后既可以评价。</div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingSix" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                        <i class="more-less fa fa-angle-down"></i>张家界土特产电子商城中有多少种商品？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseSix" role="tabpanel" aria-labelledby="headingSix">
                                <div class="panel-body">93种。 </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingSeven" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                        <i class="more-less fa fa-angle-down"></i>买的商品找不到了,怎么办？</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseSeven" role="tabpanel" aria-labelledby="headingSeven">
                                <div class="panel-body">您可以进入 【个人中心】 — 【已购买页面】 页面找到交易记录； </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="headingEight" role="tab">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                        <i class="more-less fa fa-angle-down"></i>如何修改个人资料（如收货地址等）</a>
                                </h4>
                            </div>
                            <div class="panel-collapse collapse" id="collapseEight" role="tabpanel" aria-labelledby="headingEight">
                                <div class="panel-body">请在主页面进入个人中心，进入后点击修改个人信息既可以修改。 </div>
                            </div>
                        </div>
                    </div>
                    <!-- panel-group-->
                </div>
            </div>
        </div>
    </section>
</div>
<%@include file="foot.html"%>
</body>
</html>
