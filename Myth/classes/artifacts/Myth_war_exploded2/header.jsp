<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MYTH</title>
        <script src="js/jquery-1.11.3.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="css/homepage.css">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body style="background-color: #05B8F7;">
    <div id="nav01">
        <div id="logo"></div>
        <div id="seek_image"></div>
        <form action="${pageContext.request.contextPath}/seekGames" method="get">
            <input type="text" id="seek" name="Gname"  placeholder="搜索" required>
        </form>
        <ul id="nav02">
            <li><a href="${pageContext.request.contextPath}/homepage">商城</a> </li>
            <li><a href="About.jsp" >关于</a> </li>
            <li><a href="Communication.jsp" >社区</a></li>
        </ul>
        <div id="language_image" ></div>
            <div id="nav03" class="dropdown">
                <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" >
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="ssss">

                </ul>
            </div>
            <script>
                $(function () {
                    var html = "";
                    function apex() {
                        if(${sessionScope.user==null}){
                            $("#dropdownMenu1").prepend("See")
                            html+=' <li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="login.jsp">' +
                                '<span class="glyphicon glyphicon-log-in" style="color: rgb(255, 140, 60);"> 登录</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="register.jsp">' +
                                '<span class="glyphicon glyphicon-user" style="color: rgb(87, 90, 174);"> 注册</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'
                        }else{
                            $("#dropdownMenu1").prepend("My")
                            html+='<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/warehouse"><span class="glyphicon glyphicon-th-large" style="color: rgb(198, 131, 183);"> 仓库</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/showWishList">' +
                                '<span class="glyphicon glyphicon-shopping-cart" style="color: rgb(158, 231, 86);"> 愿望清单</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="Edit.jsp">' +
                                '<span class="glyphicon glyphicon-edit" style="color: rgb(122, 128, 197);"> 个人信息</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/loginOut">' +
                                '<span class="glyphicon glyphicon-log-out" style="color: rgb(255, 140, 60);"> 退出</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'
                        }
                        $("#ssss").html(html);
                    }
                    apex()

                })
            </script>
        </div>
        <div id="login_image"></div>
</body>
</html>