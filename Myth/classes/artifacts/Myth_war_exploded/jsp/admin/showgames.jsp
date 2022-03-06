<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<script src="static/js/jquery-1.11.3.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/DatePicker.js"></script>
<script type="text/javascript">
function deleteGameds(gId){
	location.href = "${pageContext.request.contextPath}/gamesDeleteById?gId="+gId;
}
</script> 
<title>MYTH-游戏列表</title>
</head>
<body>
<div class="row" style="width:98%;margin-left: 1%;">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				游戏列表
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
						<div class="form-group form-inline">
							<span>游戏名称</span>
							<input type="text" name="gName" class="form-control">
						</div>
					</div>
					<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
						<div class="form-group form-inline">
							<span>游戏id</span>
							<input type="text"  name="gId" class="form-control" >
						</div>
					</div>
					<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
						<button type="button" class="btn btn-primary" id="search"><span class="glyphicon glyphicon-search"></span></button>
					</div>
				</div>
				<div style="height: 400px;overflow: scroll;">
					<table id="tb_list" class="table table-striped table-hover table-bordered">
						<tr>
							<td>游戏id</td>
							<td>商品名称</td>
							<td>价格</td>
							<td>图片</td>
							<td>上架时间</td>
							<td>类型</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${gamesList}" var="games" varStatus="i">
							<tr>
								<td>${games.g_id} &nbsp;&nbsp;</td>
								<td>${games.g_name}</td>
								<td>${games.price}</td>
								<td><img src="${games.g_picture}" width="60px" height="35px"/></td>
								<td>${games.update}</td>
								<td>${games.g_type}</td>
								<td><button onclick="deleteGameds('${games.g_id}')">删除</button>
									<a tabindex="0" id="example${games.g_id}" class="btn btn-primary btn-xs"
									role="button" data-toggle="popover"
									data-trigger="focus"
									data-placement="left"
									data-content="${games.g_detail}">描述</a>
									<script type="text/javascript">
										$(function(){
											$("#example${games.g_id}").popover();
										})
									</script>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//条件查询
$(function(){
	//给查询按钮 添加 点击事件
	$("#search").click(function(){
		var gName = $("input[name='gName']").val();
		var gId = $("input[name='gId']").val();
		location.href = "${pageContext.request.contextPath}/selectByNameAndId?gName="+gName+"&gId="+gId;
	    /*location.href 在当前页面打开URL页面*/
	})
})
</script> 
</body>
</html>