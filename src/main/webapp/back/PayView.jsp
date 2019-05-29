<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>付款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="bean.AlipayConfig"%>
<%@ page import="com.alipay.api.AlipayClient"%>
<%@ page import="com.alipay.api.DefaultAlipayClient"%>
<%@ page import="com.alipay.api.request.AlipayTradePagePayRequest" %>
<%@ page import="com.alipay.api.AlipayApiException" %>
<%@ page import="com.sun.org.apache.regexp.internal.RE" %>
<%
    //获得初始化的AlipayClient
    AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

    //设置请求参数
    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
    alipayRequest.setReturnUrl(AlipayConfig.return_url);
    alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

    //商户订单号，商户网站订单系统中唯一订单号，必填
    String out_trade_no = String.valueOf(request.getAttribute("orderid1"));
    //付款金额，必填
    String total_amount =String.valueOf(request.getAttribute("total"));
    //订单名称，必填
    String subject = "123456789";
    //商品描述，可空
    String body = "123456789";
    System.out.println("订单号"+out_trade_no);
    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
            + "\"total_amount\":\""+ total_amount +"\","
            + "\"subject\":\""+ subject +"\","
            + "\"body\":\""+ body +"\","
            + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

    //请求
    String result = null;
    try {
        result = alipayClient.pageExecute(alipayRequest).getBody();
    } catch (AlipayApiException e) {
        e.printStackTrace();
    }
    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    //输出
    response.setContentType("text/html;charset=" + AlipayConfig.charset);
    response.getWriter().write(result);//直接将完整的表单html输出到页面
    response.getWriter().flush();
    response.getWriter().close();
%>
<body>
</body>
</html>