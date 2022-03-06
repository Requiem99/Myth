<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>下订单</title>
    <base href="<%=basePath%>">
    <script src="static/js/jquery-1.11.3.js"></script>
    <script src="static/js/bootstrap.min.js" ></script>
    <%--<script src="js/gameshow.js"></script>--%>
    <link href="static/css/myth-header.css" type="text/css" rel="stylesheet">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="static/css/myth-game.css" type="text/css" rel="stylesheet">
    <link href="static/css/myth-user.css" type="text/css" rel="stylesheet">
</head>
<body>
<script>
    $(function(){
        var only = $(".assHold");
        var radios = $(".radios");
        var app = ""
        for (var i = 0; i < only.length; i++) {
            radios[i].checked=false;
            only[i].onclick=function(){
                var index=i;
                for (let j = 0; j < radios.length; j++) {
                    if(only[j]==this){
                        app=only[j].firstElementChild.value
                        radios[j].checked=true;
                        $(".pay").removeClass("disabled")
                    }else{
                        radios[j].checked=false;
                        //$(".pay").removeClass("disabled")
                    }

                }
            }
        }


    })


</script>
<div class="container " style="width: 1000px">
    <h3>结账</h3>
    <div class=" container">
        <div class="panel-group col-md-7" id="accordion">
            <div class="panel panel-default row">
                <div class="panel-heading" >
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" >
                        <div class="input-group assHold" >
                            <input type="hidden" value="wx">
                            <span class="input-group-addon">
                                <input type="radio" aria-label="..." class="radios ">
                            </span>
                            <p  class="form-control "><span class="glyphicon glyphicon-qrcode zf" style="color: rgb(0, 255, 1);"> 微信支付</span></p>
                        </div><!-- /input-group -->
                    </a>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        <img src="static/image/static/weixin.png" alt="..." class="img-rounded" style="height: 45px;width: 112px">
                    </div>
                </div>
            </div>
            <div class="panel panel-default row">
                <div class="panel-heading" >
                    <a data-toggle="collapse" data-parent="#accordion"  href="#collapseThree" >
                        <div class="input-group assHold">
                            <input type="hidden" value="zfb">
                            <span class="input-group-addon">
                                <input type="radio" aria-label="..."  class="radios ">
                            </span>
                            <p class="form-control "><span class="glyphicon glyphicon-qrcode zf" style="color: rgb(0, 127, 255);"> 支付宝支付</span></p>
                        </div><!-- /input-group -->
                    </a>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                    <div class="panel-body">
                        <img src="static/image/static/zhifubao.png" alt="..." class="img-rounded" style="height: 53px;width: 85px">
                    </div>
                </div>
            </div>
        </div>
        <!-- 订单汇总 -->
        <div class="col-md-3" style="height: 500px; background-color: rgba(0, 100,255, 0.2);overflow:scroll;margin-left: 15px">
            <c:forEach items="${sessionScope.orderList}" var="order">
                <hr>
                <img src="${order.o_g_picture}" alt="..." class="img-thumbnail">
                <h4>${order.o_g_name}</h4>
                <p>列出价格:￥${order.o_g_money}</p>
                <p>价格:￥${order.o_g_money}</p>
            </c:forEach>
            <hr>
            <p>总共:￥${count}</p>
            <p>您支付:￥${count}</p>
            <hr>
            <div class="checkbox">
                <label>
                    <input type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                </label>
                <span class="warning">请点击处确认已仔细阅读<strong>免责声明</strong>!</span>
            </div>
        </div>
    </div>
    <div class="modal-footer">
        <a class="btn btn-primary pay disabled" href="javaScript:void(0)">
            <span class="glyphicon glyphicon-ok" style="color: rgb(255, 101, 125);"></span>  确认支付
        </a>
    </div>
    <%@include file="paymentresult.jsp"%>
</div>
</body>
</html>
