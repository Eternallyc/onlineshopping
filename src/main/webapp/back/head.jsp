<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page pageEncoding="UTF-8" %>
<script>
<%
 String login = (String) request.getSession().getAttribute("state");
%>
</script>
<header class="header-style-1 static">

    <div class="container">
        <div class="row">

            <div class="header-1-inner">

                <nav class="first">
                    <ul class="menu hidden-xs">
                        <li>
                            <a href="index.jsp">首页</a>
                        </li>
                        <li>
                            <a class="active" href="goods">商店</a>
                            <ul>
                                <li>
                                    <a href="goods">商品列表</a>
                                </li>
                                <li>
                                    <a href="favorite?flag=view">商品收藏</a>
                                </li>
                                <li>
                                    <a href="cart?flag=view">购物车</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="faq.jsp">问题</a>
                        </li>
                        <li>
                            <a href="blog.jsp">博客</a>
                        </li>
                        <li>
                            <c:choose>
                                <c:when test="${sessionScope.state == 'logined'}">

                                    <a><p id="user2">
                                        用户
                                    </p></a>
                                    <ul>
                                        <li>
                                            <a href="updatapassword.jsp">修改密码</a>
                                        </li>
                                        <li>
                                            <a href="myorder">我的订单</a>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
                                    <a href="faq.jsp"><p id="user1">
                                        登录
                                    </p></a>
                                    <ul>
                                        <li>
                                            <a href="login.jsp">登录</a>
                                        </li>
                                        <li>
                                            <a href="register.jsp">注册</a>
                                        </li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>

                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>