<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body style="background-color: #05B8F7;padding-top: 40px">
 <%@include file="header.jsp"%>>
    <div class="container" style="min-height:1000px;height:auto;margin: 0 auto; background-color: rgba(0,0,0,0.8)"><h3 class="font-color">愿望清单：</h3>
        <hr>
        <div class="row col-md-8 col-md-offset-2">
            <c:forEach items="${wishGames}" var="game">
                <div class="row"  style="height: 175px;background-color: rgba(0,0,0,0.3);border-radius: 15px;padding: 20px;margin-left: 5px;margin-bottom: 18px">
                    <input type="hidden" class="game-id" value="${game.g_id}">
                    <img src="${game.g_picture}" alt="${game.g_name}" class="col-md-5">
                    <a class="cart-game-name" href="${pageContext.request.contextPath}/gIntroduction?gId=${game.g_id}">${game.g_name}</a><br>
                    <p class="cart-game-price col-md-1 col-md-offset-5" >￥${game.price}</p><br>
                    <%--<a class="cart-game col-md-3 col-md-offset-2 toCart" href="${pageContext.request.contextPath}/addGamewishListToCart?o_u_id=${sessionScope.user.id}&o_g_id=${game.g_id}&o_g_name=${game.g_name}&o_g_picture=${game.g_picture}&o_g_money=${game.price}"><span class="glyphicon glyphicon-plus-sign" style="color: rgb(255, 255, 250);"></span> <b>移至购物车</b></a>--%>
                    <a class="cart-game col-md-2 "  href="${pageContext.request.contextPath}/removeWishList?gId=${game.g_id}"><b>移除</b></a>
                </div>
            </c:forEach>
          </div>
    </div>
       
</body>
<script>
   /*var gIdList= $(".game-id").val()
   var toCart= $(".toCart")
   for (var i=0;i<gIdList.length;i++){
       $.get("/checkGameOnCart/"+gIdList[i],
        function (flag) {
            toCart[i].innerHTML = "<b>在购物车中查看</b>"
            toCart[i].href="${pageContext.request.contextPath}/showOrder"
        }
       )

   $(".toCart").click(function () {
       location.reload();
   })
   }*/
</script>
</html>