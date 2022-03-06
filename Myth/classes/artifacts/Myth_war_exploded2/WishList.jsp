<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body style="background-color: #05B8F7;">
 <%@include file="header.jsp"%>>
    <div style="height:1800px;width: 800px;margin: 0 auto;"><h3>愿望清单：</h3>
        <hr style="background-color: black;height: 2px;border: 0;">
        <div class="row">
            <c:forEach items="${wishGames}" var="game">
            <div class="col-sm-6 col-md-12" >
              <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.8);">
                <div class="caption" >
                  <h4 style="color: seashell;">${game.g_name}</h4>
                  <p style="position: absolute;right: 50px;top: 15px;">
                    <a href="${pageContext.request.contextPath}/gIntroduction?gId=${game.g_id}" class="btn btn-default" role="button" style="background-color: beige;border: none;"><span class="glyphicon glyphicon-plus-sign" style="color: rgb(78, 77, 132);"></span> Buy</a> &nbsp;
                    &nbsp;<a href="${pageContext.request.contextPath}/removeWishList?gId=${game.g_id}" class="btn btn-default" role="button "style="background-color:beige;border: none;"><span class="glyphicon glyphicon-minus-sign" style="color: rgb(78, 77, 132);"></span> Remove</a>
                  </p>
                </div>
              </div>
            </div>
            </c:forEach>
          </div>
    </div>
       
</body>
</html>