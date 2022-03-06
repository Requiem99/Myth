<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>MYTH注册</title>
    <base href="<%=basePath%>">
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/js/jquery-1.11.3.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
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
            background-image: url("../static/image/static/logo1.png");
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
            <li><a href="${pageContext.request.contextPath}/homepage" >商城</a> </li>
            <li><a href="about.jsp" >关于</a> </li>
            <li><a href="communication.jsp" >社区</a></li>
        </ul>
    </div>

    <div class="container" style="width:550px;background-color: rgba(0,0, 0, 0.3);padding-bottom: 50px;margin-top: 20px;border-radius: 8px">

        <h2 style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">Join in MYTH！ <span class="label label-default">注册</span></h2>
        <form action="${pageContext.request.contextPath}/register" method="POST">
            <div class="input-group" style="margin-top:15px;">
                <span class="input-group-addon" id="sizing-addon2">姓名</span>
                <input type="text" name="name" class="form-control" placeholder="请输入姓名" aria-describedby="sizing-addon2" required>
            </div>
            <div class="input-group" style="margin-top:15px;">
                <span class="input-group-addon" id="sizing-addon2">email</span>
                <input type="text" name="email" class="form-control" placeholder="Email" aria-describedby="sizing-addon2" required>
            </div>
            <div class="input-group" style="margin-top:15px;">
                <span class="input-group-addon" id="sizing-addon2">address</span>
                <input type="text" name="address" class="form-control" placeholder="家庭住址" aria-describedby="sizing-addon2" required>
            </div>
            <div class="input-group" style="margin-top:15px;">
                <span class="input-group-addon" id="sizing-addon2">用户名</span>
                <input type="text" name="username" class="form-control" placeholder="请输入用户名" aria-describedby="sizing-addon2" required>
            </div>
            <div class="input-group" style="margin-top:15px;">
                <span class="input-group-addon" id="sizing-addon2">密码</span>
                <input type="password" name="password" class="form-control" placeholder="请输入密码" aria-describedby="sizing-addon2" required>
            </div>
            <div class="btn-group btn-group-justified" role="group" aria-label="王八蛋" style="margin-top: 25px;">
                <div class="btn-group" role="group">
                    <button type="submit" class="btn btn-default">注册</button>
                </div>
                <div class="btn-group" role="group">
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
                <div class="btn-group" role="group">
                    <a href="../index.jsp"><button type="button" class="btn btn-default">返回</button></a>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
