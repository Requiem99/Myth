<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>MYTH登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
	  <script src="js/jquery-1.11.3.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
	  <style>
		  *{
			  margin: 0;
			  padding: 0;
		  }

		  #nav01{
			  width: 100%;
			  height: 70px;
			  background-color:rgba(0, 0, 0, 0.8);
			  position:relative ;
		  }

		  #logo{
			  width: 70px;
			  height: 70px;
			  background-image: url("image/static/logo1.png");
			  position: absolute;
			  left: 160px;
		  }
		  #nav02{
			  height: 60px;
			  width: 300px;
			  list-style-type: none;
			  position: absolute;
			  left: 260px;

		  }
		  #nav02>li>a{
			  float: left;
			  font-size: 25px;
			  font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
			  margin-top: 15px;
			  right: 10px;
			  margin-right: 20px;
			  color: #fff;
			  text-decoration: none;

		  }
		  #nav02>li>a:hover{
			  color: #8357fa;
		  }
	  </style>
  </head>
  <body>
  <div style="width: 100%;height: 100%;background-color: #05B8F7">
  <div id="nav01">
	  <div id="logo"></div>
	  <ul id="nav02" >
		  <li><a href="${pageContext.request.contextPath}/homepage?id=0" >商城</a> </li>
		  <li><a href="About.jsp" >关于</a> </li>
		  <li><a href="Communication.jsp" >社区</a></li>
	  </ul>
  </div>
	  <div id="language_image" ></div>

  	<div class="container" style="width: 400px;background-color: rgba(0,0, 0, 0.3);padding-bottom: 50px;margin-top: 20px;border-radius: 8px">
  		<h2 style="text-align: center;">登录</h2>
        <form action="${pageContext.request.contextPath}/loginUser" method="post">
	      <div class="form-group">
	        <label for="user">用户名：</label>
	        <input type="text" name="userName" class="form-control" id="user" placeholder="请输入用户名" required/>
	      </div>
	      
	      <div class="form-group">
	        <label for="password">密码：</label>
	        <input type="password" name="passWord" class="form-control" id="password" placeholder="请输入密码" required/>
	      </div>

	      <hr/>
	      <div class="form-group" style="text-align: center;">
	        <input class="btn btn btn-primary" type="submit" value="登录">
	       </div>

	  	</form>
		<a href="register.jsp" style="color:navy">没有账号？注册</a>
		<!-- 出错显示的信息框 -->
	  	<div class="alert alert-warning alert-dismissible" role="alert">
		  <button type="button" class="close" data-dismiss="alert" >
		  	<span>&times</span></button>
		   <strong>${error}</strong>
		</div>
  	</div>
   </div>
  </body>
</html>