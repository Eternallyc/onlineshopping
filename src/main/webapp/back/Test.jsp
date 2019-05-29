
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>购物车</title>
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-2.1.1.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#checkAll").click(function() {
                var sum = 0;
                $(".gwc_tb2 input[type='checkbox']").each(function() {
                    if ($(this).prop("checked")){
                        $(this).attr("checked", false);
                        sum = 0;
                    }
                    else
                        $(this).prop("checked", true);
                    sum += parseInt($(this).val());
                    $("#zong1").text(sum);

                });
            });
        });
    </script>

</head>
<body>


<div class="gwc" style="margin: auto;">
    <table cellpadding="0" cellspacing="0" class="gwc_tb1">
        <tr>
            <td class="tb1_td8">商品</td>
            <td class="tb1_td11">价格</td>
            <td class="tb1_td10">数量</td>
            <td class="tb1_td12">操作</td>
        </tr>
    </table>

    <!---商品加减算总数---->
    <script type="text/javascript">
        $(function() {
            $(".add1").click(function() {
                var t = $(this).siblings(".text_box1");
                t.val(parseInt(t.val()) + 1);
                var h=$(this).parent(".tb1_td5").siblings(".tb1_td6").find(".tot");
                var y = $(this).parent(".tb1_td5").siblings(".tb1_td6").find(".price-hidden");
                h.text(parseInt(y.val()) * parseInt(t.val()));

            })
            $(".min1").click(function() {
                var t = $(this).siblings(".text_box1");
                if (t.val() > 0) {
                    t.val(parseInt(t.val()) - 1);
                    var h=$(this).parent(".tb1_td5").siblings(".tb1_td6").find(".tot");
                    var y = $(this).parent(".tb1_td5").siblings(".tb1_td6").find(".price-hidden");
                    h.text(parseInt(y.val()) * parseInt(t.val()));

                }
            })

        })
    </script>

    <c:forEach var="cartMap" items="${cartMap}" >
        <table cellpadding="0" cellspacing="0" class="gwc_tb2">
            <tr>
                <c:forEach var="goodsMap" items="${cartMap.value}">
                    <!--复选框  -->
                    <td class="tb2_td1">
                        <input type="checkbox" value="${goodsMap.key.getGoods_price()*cartMap.key.getCart_count()}"
                               name="newslist" id="newslist-1" />
                    </td>

                    <!-- 商品图片 -->
                    <c:forEach var="img" items="${goodsMap.value}">
                        <td class="tb2_td2"><a href="#"><img
                                style="height: 200px; width: 200px" src="${img.img_name}" /></a></td>
                    </c:forEach>
                    <!-- 商品名称 -->
                    <td class="tb2_td3">
                        <a href="#">${goodsMap.key.getGoods_name()}</a>
                    </td>
                    <!-- 商品价格 -->
                    <td class="tb1_td6">
                        <input class="price-hidden" type="hidden" value="${goodsMap.key.getGoods_price()}" />
                        <label class="tot" style="color: #ff5500; font-size: 14px; font-weight: bold;">
                                ${goodsMap.key.getGoods_price()*cartMap.key.getCart_count()}</label>
                    </td>
                </c:forEach>

                <!-- 数量 -->
                <td class="tb1_td5">
                    <input class="min1" name=""
                           style="outline: none; width: 20px; height: 20px; border-radius: 20px"
                           type="button" value="-" />
                    <input class="text_box1" name=""
                           type="text" value="${cartMap.key.getCart_count()}"
                           style="width: 40px; height: 40px; text-align: center; border: 2px solid #e5e4fd;" />
                    <input class="add1" name=""
                           style="outline: none; width: 20px; height: 20px; border-radius: 20px"
                           type="button" value="+" />
                </td>
                <!-- 删除按钮 -->
                <td class="tb1_td7">
                    <a href="deletecart.do?cart_id=${cartMap.key.getId()}">删除</a>
                </td>
            </tr>
        </table>
    </c:forEach>






    <!---总数---->



    <table cellpadding="0" cellspacing="0" class="gwc_tb3">
        <tr>
            <!-- 全选 -->
            <td class="tb1_td1"><input id="checkAll" class="allselect"
                                       type="checkbox" /></td>
            <td class="tb1_td13">全选</td>
            <!-- 选择商品数量 -->
            <td class="tb3_td2">已选商品
                <label id="shuliang"
                       style="color: #ff5500; font-size: 14px; font-weight: bold;"></label>件
            </td>
            <!-- 合计价格 -->
            <td class="tb3_td3">合计:<span>￥</span>
                <span style="color: #ff5500;">
				<label id="zong1"
                       style="color: #ff5500; font-size: 14px; font-weight: bold;"></label>
				</span>
            </td>

            <td class="tb3_td4"><span id="jz1">结算</span>
                <a href="#"
                   style="display: none;" class="jz2" id="jz2">结算</a></td>
        </tr>
    </table>

</div>

<!--可删除-->
<script src="http://www.jq22.com/js/jq.js"></script>

<!--ecd 可删除-->

</body>
</html>

