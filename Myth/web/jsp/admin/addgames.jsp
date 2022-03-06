<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
	<script src="static/js/jquery-1.11.3.js"></script>
	<script src="static/js/bootstrap.min.js" ></script>
<script src="static/js/DatePicker.js"></script>
<title>MYTH-添加游戏</title>
</head>
<body>
<script>
	if (${upLoadMsg!=null}){
		alert(${upLoadMsg})
	}
</script>
	<div class="row" style="margin-left: 20px;">
		<form action="${pageContext.request.contextPath }/addGames" method="post" enctype="multipart/form-data">
			<div>
				<h3>新增游戏</h3>
			</div>
			<hr />
			<div class="row">
				<div class="col-sm-6">
				<p style="color:red">${msg}</p>
					<div class="form-group form-inline">
						<label>名称:</label>
						<input type="text" name="g_name" class="form-control" />
					</div>
					<div class="form-group form-inline">
						<label>游戏类型:</label>
						<input type="text" name="g_type" class="form-control" />
					</div>
					<div class="form-group form-inline">
						<label>上架时间:</label>
						<input type="text" name="uptime" readonly="readonly" class="form-control" onclick="setday(this)" />
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group form-inline">
						<label>价格:</label>
						<input type="text" name="price" class="form-control" /> 元
					</div>
					<div class="form-group form-inline">
						<label>热度:</label>
						<input type="text" name="g_star" class="form-control" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-10">
					<div class="form-group form-inline">
						<label>游戏图片</label>
						<input type="file" name="file" accept="image/jpg, image/png"/>
					</div>
					<div class="form-group ">
						<label>游戏简介</label>
						<textarea  name="g_detail" class="form-control" rows="5" style="height: 100px"></textarea>
					</div>
					<div class="form-group form-inline">
						<input type="submit" value="添加" class="btn btn-primary" />
						<input type="reset" value="重置" class="btn btn-default" />
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>