<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人空间</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <script src="js/jquery-1.11.3.js" type="text/javascripts" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascripts" charset="utf-8"></script>

</head>
<body style="background-color: rgb(95, 105, 160);">

    
        <!-- 仓库面板 -->
    <div class="panel panel-default" style="background-color: #05B8F7;">
        <div class="panel-heading">
            <div class="h3 col-md-offset-5">您拥有的所有游戏 </div>
        </div>
    <div class="panel-body">
            
    <div style="background-color: rgb(255, 0, 128);">
      <ul class="nav nav-tabs">
        <li ><a href="${pageContext.request.contextPath}/homepage}">返回商店</a></li>
        <li><a href="#">查看个人信息</a></li>
          <li><a href="index.jsp">退出登录</a></li>
      </ul>
    </div>
      <br>
      <br>
        <div class="row" >
            <c:forEach items="${gamedetail}" var="game">
             <div class=" col-md-3 col-lg-3">
                <div class="thumbnail" style="background-color: aqua;">
                    <img src="${game.gd_image}" style="height: 250px; width: 400px;">
                    <button class="btn btn-default col-lg-offset-9">
                    <span class="glyphicon"></span>启动
                    </button>
                </div>
             </div>
            </c:forEach>
       </div>

    </div>

    </div>
   
</body>
</html>