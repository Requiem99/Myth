<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MYTH</title>
        <script src="static/js/jquery-1.11.3.js"></script>
        <script src="static/js/bootstrap.min.js" ></script>
        <%--<script src="js/gameshow.js"></script>--%>
        <link href="static/css/myth-header.css" type="text/css" rel="stylesheet">
        <link href="static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="static/css/myth-game.css" type="text/css" rel="stylesheet">
        <link href="static/css/myth-user.css" type="text/css" rel="stylesheet">
        <style type="text/css">/*添加愿望清单信息的模态框格式设置较居中*/
            #addSuccess{
                top: 30%;
            }
        </style>
    </head>
    <body>

      <%--  <div id="logo"></div>
        <ul id="nav02">
            <li><a href="${pageContext.request.contextPath}/homePage">商城</a> </li>
            <li><a href="about.jsp" >关于</a> </li>
            <li><a href="communication.jsp" >社区</a></li>
        </ul>
        <div id="language_image"></div>
            <div id="nav03" class="dropdown">
                <button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" >
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="ssss">

                </ul>
            </div>--%>


          <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
              <div class="container-fluid nav01">
                  <div class="navbar-header">
                      <img src="static/image/static/myth-logo01.png" alt="">
                  </div>
                  <div>
                      <ul class="nav navbar-nav">
                          <li class="active"></li>
                          <li><a href="${pageContext.request.contextPath}/homePage">商城</a></li>
                          <li><a href="${pageContext.request.contextPath}/communication">社区</a></li>
                          <li><a href="${pageContext.request.contextPath}/about">关于</a></li>
                      </ul>
                      <ul class="nav navbar-nav navbar-right">
                          <li><img src="static/image/static/login.png" id="login_image"/></li>
                          <li class="dropdown">
                              <a href="javaScript:void(0)" class="dropdown-toggle stayHere" id="dropdownMenu1" data-toggle="dropdown">
                                  <b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu stayHere" id="ssss">

                              </ul>
                          </li>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      </ul>
                  </div>
              </div>
          </nav>
          <script>
                $(function () {
                    var html = "";
                    $("#dropdownMenu1").mouseover(function () {
                          $("#ssss").show(150);
                        })

                    $(".dropdown").mouseleave(function () {
                          $("#ssss").hide(150)
                    })
                    function apex() {
                        if(${sessionScope.user==null}){
                            $("#dropdownMenu1").prepend("Login")
                            html+=  '<li role="presentation" class="divider"><hr style="background-color: black;height: 2px;border: 0;"></li>'+
                                ' <li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="jsp/login.jsp">' +
                                '<span class="glyphicon glyphicon-log-in" style="color: rgb(255, 140, 60);"> 登录</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="jsp/register.jsp">' +
                                '<span class="glyphicon glyphicon-user" style="color: rgb(87, 90, 174);"> 注册</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'
                        }else{
                            $("#dropdownMenu1").prepend("${sessionScope.user.name}")
                            $("#login_image").attr("src","${sessionScope.user.header_icon}")
                            //评论框的头像
                            $("#login-default").attr({"src":"${sessionScope.user.header_icon}","alt":"${sessionScope.user.name}"})
                            html+='<li role="presentation class="divider">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/showWareHouse" target="_blank">' +
                                '<span class="glyphicon glyphicon-th-large" style="color: rgb(198, 131, 183);"> 仓库</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/showWishList" target="_blank" >' +
                                '<span class="glyphicon glyphicon-list" style="color: rgb(255, 140, 60);"> 愿望清单</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/showOrder" target="_blank" >' +
                                '<span  class="glyphicon glyphicon-shopping-cart" style="color: rgb(158, 231, 86);" "> 购物车</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/edit" target="_blank" >' +
                                '<span class="glyphicon glyphicon-edit" style="color: rgb(122, 128, 197);" > 个人信息</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'+
                                '<li role="presentation">'+
                                '<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/loginOut">' +
                                '<span class="glyphicon glyphicon-log-out" style="color: rgb(255, 140, 60);"> 退出</span></a></li>'+
                                '<li role="presentation" class="divider"></li>'
                        }
                        $("#ssss").html(html);
                    }
                    apex();

                    /*==================*/
                    /*=判断用户是否拥有该游戏，或是已经将该游戏放入愿望清单=*/
                    var gamesId = $(".game-id");
                    var addList = $(".add-list");
                    /*console.log(gamesId);
                    console.log(addList);*/
                    if(${sessionScope.user!=null}) {
                        for (let i = 0; i < gamesId.length; i++) {
                            $.get("checkHaveGame/" + gamesId[i].value, function (verify) {
                                console.log(gamesId[i].value)
                                if (verify[0] === true && verify[1] === false) {//愿望清单中没有该游戏,仓库中有
                                    addList[i].innerHTML='<span class="glyphicon glyphicon-ok unable-click"></span> 游戏已在仓库中'
                                    addList[i].classList.add("disabled")
                                    addList[i].style.pointerEvents="none"
                                } else if (verify[0] === false && verify[1] === true) {//愿望清单中有该游戏,仓库中没有
                                    addList[i].innerHTML='<span class="glyphicon glyphicon-ok unable-click"></span> 游戏已在愿望清单中'
                                    addList[i].classList.add("disabled")
                                    addList[i].style.pointerEvents="none"
                                }
                            })
                        }

                    }
                })



            </script>
       <%----%>

</body>
</html>