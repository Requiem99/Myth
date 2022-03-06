<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>MYTH-用户列表</title>
	<base href="<%=basePath%>">
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
	<script src="static/js/jquery-1.11.3.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		loadUser();
	})
	//连接servlet 获取 数据
	function loadUser(){
		$.ajax({
			url:"${pageContext.request.contextPath}/listUser",
			method:"get",
			success:function(data){
				showMsg(data);
			},
			error:function(XMLHttpRequest,textStatus,errorThrown){
				alert("失败"+XMLHttpRequest.status+":"+textStatus+":"+errorThrown);
			}
		});
	}
	//显示用户信息
	function showMsg(list){
		$("#tb_list").html("<tr class='tr_head'><td>编号</td><td>邮箱</td><td>姓名</td><td>用户名</td><td>地址</td><td>类别</td><td>操作</td></tr>");
		var i = 1;
		for(var u in list){
			//声明 tr  td  对象
			var tr = $("<tr></tr>");
			var td1 = $("<td>"+(i++)+"</td>");
			var td2 = $("<td>"+list[u].email+"</td>");
			var td3 = $("<td>"+list[u].name+"</td>");
			var td4 = $("<td>"+list[u].username+"</td>");
			var td5 = $("<td>"+list[u].address+"</td>");
			var td6 = $("<td>"+(list[u].grade==0?"管理员":"用户")+"</td>");
			var td7 = $("<td><a href='javascript:delUser("+list[u].id+")' class='btn btn-primary btn-xs'>删除</a></td>");
			//将td 添加到tr中
			tr.append(td1);
			tr.append(td2);
			tr.append(td3);
			tr.append(td4);
			tr.append(td5);
			tr.append(td6);
			tr.append(td7);
			$("#tb_list").append(tr);
		}
	}
	//删除用户
	function delUser(id){
		if(confirm("确认要删除吗?")){ //confirm()方法用于显示一个带有指定消息和确认及取消按钮的对话框。如果访问者点击"确定"，此方法返回true，否则返回false。
			$.ajax({
				url:"${pageContext.request.contextPath}/userDel?uId="+id,
				method:"get",
				success:function(data){
					if(data>0){
						loadUser();
					}
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					alert("失败"+XMLHttpRequest.status+":"+textStatus+":"+errorThrown);
				}
			})
		}
	}
	//条件查询
	$(function(){
		//给查询按钮 添加 点击事件
		$("#search").click(function(){
			var userName = $("input[name='userName']").val();
			var genders = $("input[name='gender']");
			var gender = "";
			for(var i=0;i<genders.length;i++){
				if(genders[i].checked){
					gender += genders[i].value;
				}
			}
			//使用ajax 进行异步交互
			$.ajax({
				url:"${pageContext.request.contextPath}/userSearch?userName="+userName,
				method:"post",
				success:function(data){
					if(data===null){
						alert("未找到指定内容");
						$("input[name='username']").val("");
					}else{
						showMsg(data);
					}
				},
				error:function(XMLHttpRequest,textStatus,errorThrown){
					alert("失败"+XMLHttpRequest.status+":"+textStatus+":"+errorThrown);
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="row" style="width: 100%;">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">用户列表</div>
					<div class="panel-body">
						<!-- 条件查询 -->
						<div class="row">
							<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
								<div class="form-group form-inline">
									<span>用户名</span>
									<input type="text" name="userName" class="form-control">
								</div>
							</div>
							<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
								<button type="button" class="btn btn-primary" id="search"><span class="glyphicon glyphicon-search"></span></button>
							</div>
						</div>
						<!-- 列表显示 -->
						<table id="tb_list" class="table table-striped table-hover table-bordered">	
						</table>					
					</div>
				</div>
			</div>
		</div>
</body>
</html>