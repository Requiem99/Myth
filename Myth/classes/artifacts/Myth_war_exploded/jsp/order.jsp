<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>购物车</title>
</head>
<body style="background-color:#05B8F7 ;">
<%@include file="header.jsp"%>
<div class="container" style="background-color: rgba(0,0,0,0.8);min-height: 1000px;height: auto;padding-top: 50px;">
    <h2 class="font-color">我的购物车</h2>
    <hr>
    <c:if test="${ordersList.size()==0}">
        <h3 class="font-color">&nbsp;您的购物车中没有游戏！</h3>
    </c:if>

    <c:if test="${ordersList.size()!=0}">
        <div class="row">
            <div class="container-fluid col-md-8">
                <c:forEach  items="${ordersList}" var="order">
                    <div class="row"  style="height: 175px;background-color: rgba(0,0,0,0.3);border-radius: 15px;padding: 20px;margin-left: 5px;margin-bottom: 18px">
                        <img src="${order.o_g_picture}" alt="${order.o_g_name}" class="col-md-5">
                        <a class="cart-game-name" href="${pageContext.request.contextPath}/gIntroduction?gId=${order.o_g_id}">${order.o_g_name}</a><br>
                        <p class="cart-game-price col-md-1 col-md-offset-5" >￥${order.o_g_money}</p><br>
                        <a class="cart-game col-md-3 col-md-offset-2" href="${pageContext.request.contextPath}/transferOrder?oId=${order.o_id}&gId=${order.o_g_id}"><span class="glyphicon glyphicon-plus-sign" style="color: rgb(255, 255, 250);"></span> <b>移至愿望清单</b></a>
                        <a class="cart-game col-md-1 " href="${pageContext.request.contextPath}/delOrderForCart?oId=${order.o_id}"><b>移除</b></a>
                    </div>
                </c:forEach>
            </div>
            <div class="container-fluid col-md-3" style="margin-left: 20px">
                <h3 style="color: #FFFFFF">游戏和应用概览</h3>
                <p style="color: #FFFFFF">价格：&nbsp;&nbsp;&nbsp;&nbsp;￥ ${count}</p>
                <p style="color: #FFFFFF">税费：&nbsp;&nbsp;&nbsp;&nbsp;结账时计算</p>
                <hr>
                <p style="color: #FFFFFF">总计：&nbsp;&nbsp;&nbsp;&nbsp;￥ ${count}</p>
                <a href="${pageContext.request.contextPath}/buyGameOrders?uId=${sessionScope.user.id}" class="btn btn-primary col-md-12"style="color: #FFFFFF">结账</a>
            </div>
        </div>
    </c:if>
</div>
</body>
</html>
