<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath%>">
    <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="static/js/jquery-1.11.3.js"></script>
    <script src="static/js/bootstrap.min.js" ></script>
    <title>MYTH-仓库管理</title>
</head>
<body>
<div class="row" style="width:98%;margin-left: 1%;">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                仓库
            </div>
            <div class="panel-body">
                <div class="row">
                    <form class="form-inline" action="${pageContext.request.contextPath}/lookWareHouse" method="post">&nbsp;&nbsp;
                        <div class="form-group">
                            <label for="exampleInputName12">用户id:</label>
                            <input type="text" class="form-control" id="exampleInputName12" name="uId" placeholder="请输入用户id" required />
                        </div>&nbsp;&nbsp;
                        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                    </form>
                </div>
                <br>
                <div style="height: 400px;overflow: scroll;">
                    <table id="tb_list" class="table table-striped table-hover table-bordered">
                        <tr>用户名：${username}</tr>
                        <hr>
                        <tr>
                            <td>游戏名称</td>
                            <td>简介</td>
                            <td>图片</td>
                        </tr>
                        <c:if test="${gamesList.size()!=0}">
                            <c:forEach items="${gamesList}" var="game">
                                <tr>
                                    <td>${game.g_name}</td>
                                    <td>${game.g_detail}</td>
                                    <td><img src="${game.g_picture}" alt="" width="70px" height="35px"></td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
