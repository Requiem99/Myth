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
<title>MYTH-评论管理</title>
	<script>
		function deleteComments(cId) {
			location.href = "${pageContext.request.contextPath}/deleteGameds?gId="+cId
		}
	</script>
</head>
<body>
<div class="row" style="width:98%;margin-left: 1%;">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				评论
			</div>
			<div class="panel-body">
				<div class="row">
					<form class="form-inline admin-comment" action="${pageContext.request.contextPath}/getCommentLsit" method="post">&nbsp;&nbsp;
						<div class="form-group">
							<label for="exampleInputName2">用户名:</label>
							<input type="text" class="form-control" id="exampleInputName2" name="c_author_username" placeholder="请输入用户名">
						</div>&nbsp;&nbsp;
						<div class="form-group">
							<label for="exampleInputEmail2">游戏名:</label>
							<input type="text" class="form-control" id="exampleInputEmail2" name="c_g_name" placeholder="请输入游戏名">
						</div>&nbsp;&nbsp;
						<div class="form-group">
							<label for="exampleInputEmail23">上级用户名:</label>
							<input type="text" class="form-control" id="exampleInputEmail23" name="c_u_username" placeholder="请输入上级用户名">
						</div>&nbsp;&nbsp;
						<button type="submit" class="btn btn-primary " id="seekComments"><span class="glyphicon glyphicon-search"></span></button>
					</form>
				</div>
				<br>
				<div style="height: 400px;overflow: scroll;">
					<table class="table table-striped table-hover table-bordered">
						<tr>
							<td>用户名</td>
							<td>评论内容</td>
							<td>时间</td>
							<td>上级评论人id</td>
							<td>上级评论人用户名</td>
							<td>操作</td>
						</tr>
						<c:if test="${commentLsit.size()!=0}">
							<c:forEach items="${commentLsit}" var="comment">
								<tr>
									<td>${comment.c_author_username}</td>
									<td>${comment.c_content}</td>
									<td>${comment.c_datetime}</td>
									<td>${comment.c_u_id}</td>
									<td>${comment.c_u_username}</td>
									<td><button onclick="deleteComments('${comment.c_id}')">删除</button></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>

				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

//条件查询
$(function(){
	/*$(".admin-comment").submit(function () {
		var html = ''
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/getCommentLsit",
			data: $(".admin-comment").serialize(),
			success:function (data) {
				if (data.length!=0) {
					for (var i = 0; i < data.length; i++) {
						html += '<tr>' +
								'<td>' + data[i].c_author_username +'</td>' +
								'<td>' + data[i].c_content + '</td>' +
								'<td>' + data[i].c_datetime + '</td>' +
								'<td>' + data[i].c_u_id + '</td>' +
								'<td>' + data[i].c_u_username + '</td>' +
								'<td><button onclick="deleteComments(' + data[i].c_id + ')">删除</button>' +
								'</td></tr>'
					}
					$(".table").append(html)
					console.log(html)
				}
			}
		})
		return false
	})*/


})

</script>
</body>
</html>