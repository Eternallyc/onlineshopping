<%@ page import="bean.Goods" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/12 0012
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <title>张家界土特产在线商城</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
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
<%
    //得到排行榜
    ArrayList<Goods> arrayList= (ArrayList<Goods>) request.getAttribute("goodsArrayList");

    String date = (String) request.getAttribute("date");//得到日期
    Long collectnum = (Long) request.getAttribute("collectnum");//收藏数
    int salenum = (int) request.getAttribute("salenum");//得到销量数
    int inventory = (int) request.getAttribute("inventory");//库存量
    Long VIPnum = (Long) request.getAttribute("VIPnum");//会员数
    int tolsalenum = (int) request.getAttribute("tolsalenum");//总销量
    int currentProfit = (int) request.getAttribute("currentProfit");//当前收益
    int tolprofit = (int) request.getAttribute("tolprofit");//总收益

%>
<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <%@ include file="adminhead.html"%>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="admin" class="active"><i class="lnr lnr-home"></i> <span>实时数据</span></a></li>
                    <li><a href="admintable" class=""><i class="lnr lnr-dice"></i> <span>商品列表</span></a></li>
                    <li><a href="goodsadd.jsp" class=""><i class="lnr lnr-linearicons"></i> <span>商品发布</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container-fluid">
                <!-- OVERVIEW -->
                <div class="panel panel-headline">
                    <div class="panel-heading">
                        <h3 class="panel-title">时报</h3>
                        <p class="panel-subtitle">产生日期：<%=date%></p>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="metric">
                                    <span class="icon"><i class="fa fa-download"></i></span>
                                    <p>
                                        <span class="number"><%=collectnum%></span>
                                        <span class="title">收藏数</span>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="metric">
                                    <span class="icon"><i class="fa fa-shopping-bag"></i></span>
                                    <p>
                                        <span class="number"><%=salenum%></span>
                                        <span class="title">销售量</span>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="metric">
                                    <span class="icon"><i class="fa fa-eye"></i></span>
                                    <p>
                                        <span class="number"><%=inventory%></span>
                                        <span class="title">库存量</span>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="metric">
                                    <span class="icon"><i class="fa fa-bar-chart"></i></span>
                                    <p>
                                        <span class="number"><%=VIPnum%></span>
                                        <span class="title">会员数</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div id="headline-chart" class="ct-chart"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="weekly-summary text-right">
                                    <span class="number"><%=tolsalenum%></span> <span class="percentage"><i class="fa fa-caret-up text-success"></i> 12%</span>
                                    <span class="info-label">总共销售量</span>
                                </div>
                                <div class="weekly-summary text-right">
                                    <span class="number">￥ <%=currentProfit%></span> <span class="percentage"><i class="fa fa-caret-up text-success"></i> 23%</span>
                                    <span class="info-label">当前收益</span>
                                </div>
                                <div class="weekly-summary text-right">
                                    <span class="number">￥ <%=tolprofit%></span> <span class="percentage"><i class="fa fa-caret-down text-danger"></i> 8%</span>
                                    <span class="info-label">总收益</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END OVERVIEW -->
                <div class="row">
                    <div class="col-md-6">
                        <!-- RECENT PURCHASES -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">销售量排行榜</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>
                            <div class="panel-body no-padding">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>商品ID</th>
                                        <th>商品名</th>
                                        <th>单价</th>
                                        <th>销售量</th>
                                        <th>库存情况</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a><%=arrayList.get(0).getGid()%></a></td>
                                        <td><%=arrayList.get(0).getGname()%></td>
                                        <td>￥ <%=arrayList.get(0).getPrice()%></td>
                                        <td><%=arrayList.get(0).getSalesvolume()%></td>
                                        <td><span class="label label-success">库存充裕</span></td>
                                    </tr>
                                    <tr>
                                        <td><a><%=arrayList.get(1).getGid()%></a></td>
                                        <td><%=arrayList.get(1).getGname()%></td>
                                        <td>￥ <%=arrayList.get(1).getPrice()%></td>
                                        <td><%=arrayList.get(1).getSalesvolume()%></td>
                                        <td><span class="label label-warning">库存不足</span></td>
                                    </tr>
                                    <tr>
                                        <td><a><%=arrayList.get(2).getGid()%></a></td>
                                        <td><%=arrayList.get(2).getGname()%></td>
                                        <td>￥ <%=arrayList.get(2).getPrice()%></td>
                                        <td><%=arrayList.get(2).getSalesvolume()%></td>
                                        <td><span class="label label-success">库存充裕</span></td>
                                    </tr>
                                    <tr>
                                        <td><a><%=arrayList.get(3).getGid()%></a></td>
                                        <td><%=arrayList.get(3).getGname()%></td>
                                        <td>￥ <%=arrayList.get(3).getPrice()%></td>
                                        <td><%=arrayList.get(3).getSalesvolume()%></td>
                                        <td><span class="label label-danger">停售</span></td>
                                    </tr>
                                    <tr>
                                        <td><a><%=arrayList.get(4).getGid()%></a></td>
                                        <td><%=arrayList.get(4).getGname()%></td>
                                        <td>￥ <%=arrayList.get(4).getPrice()%></td>
                                        <td><%=arrayList.get(4).getSalesvolume()%></td>
                                        <td><span class="label label-success">库存充裕</span></td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-6"><span class="panel-note"><i class="fa fa-clock-o"></i> 实时更新</span></div>

                                </div>
                            </div>
                        </div>
                        <!-- END RECENT PURCHASES -->
                    </div>
                    <div class="col-md-6">
                        <!-- MULTI CHARTS -->
                        <div class="panel">
                            <div class="panel-heading">
                                <h3 class="panel-title">收益曲线图</h3>
                                <div class="right">
                                    <button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
                                    <button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div id="visits-trends-chart" class="ct-chart"></div>
                            </div>
                        </div>
                        <!-- END MULTI CHARTS -->
                    </div>
                </div>

            </div>
        </div>
        <!-- END MAIN CONTENT -->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>

</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="assets/vendor/chartist/js/chartist.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
<script>
    $(function() {
        var data, options;

        // headline charts
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [120, 865, 1238, 1504, 1786, 2398, 2541],
            ]
        };

        options = {
            height: 300,
            showArea: true,
            showLine: false,
            showPoint: false,
            fullWidth: true,
            axisX: {
                showGrid: false
            },
            lineSmooth: false,
        };

        new Chartist.Line('#headline-chart', data, options);


        // visits trend charts
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [{
                name: 'series-real',
                data: [3253, 6785, 7758, 10222, 18222, 23869,278696],
            }, {
                name: 'series-projection',
                data: [3253, 6785, 7758, 10222, 18222, 23869,278696],
            }]
        };

        options = {
            fullWidth: true,
            lineSmooth: false,
            height: "270px",
            low: 0,
            high: 'auto',
            series: {
                'series-projection': {
                    showArea: true,
                    showPoint: false,
                    showLine: false
                },
            },
            axisX: {
                showGrid: false,

            },
            axisY: {
                showGrid: false,
                onlyInteger: true,
                offset: 0,
            },
            chartPadding: {
                left: 20,
                right: 20
            }
        };

        new Chartist.Line('#visits-trends-chart', data, options);


        // visits chart
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [6384, 6342, 5437, 2764, 3958, 5068, 7654]
            ]
        };

        options = {
            height: 300,
            axisX: {
                showGrid: false
            },
        };

        new Chartist.Bar('#visits-chart', data, options);


        // real-time pie chart
        var sysLoad = $('#system-load').easyPieChart({
            size: 130,
            barColor: function(percent) {
                return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
            },
            trackColor: 'rgba(245, 245, 245, 0.8)',
            scaleColor: false,
            lineWidth: 5,
            lineCap: "square",
            animate: 800
        });

        var updateInterval = 3000; // in milliseconds

        setInterval(function() {
            var randomVal;
            randomVal = getRandomInt(0, 100);

            sysLoad.data('easyPieChart').update(randomVal);
            sysLoad.find('.percent').text(randomVal);
        }, updateInterval);

        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

    });
</script>
</body>

</html>

