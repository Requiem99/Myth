<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<%@include file="header.jsp"%>
<body style="background-color:#05B8F7 ;padding-top: 60px">
<!-- 仓库内容 -->
<div class="container-fluid">
    <div class="row">
    <div class="col-md-2 col-md-offset-1 " style="background-color: rgba(0, 0, 0, 0.8); height: 675px;"><br>
        <div class="form-group has-feedback">
            <input type="text" class="form-control inn"  placeholder="按名称搜索">
            <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true" style="color: rgb(161, 198, 251);"></span>
        </div>
        <div>
            <c:if test="${OwnGame!=null}">
                <c:forEach items="${OwnGame}" var="game">
                    <p class="games-reveal-name">${game.g_name}</p>
                    <input type="hidden" value="${game.g_id}">
                </c:forEach>
            </c:if>
        </div>
    </div>
    <div class="col-md-8" id="own-game-platform" style="background-color: rgba(0, 0, 0, 0.8); height: 675px;"><br>
        <!-- =========展示仓库里的游戏========= -->
        <h4 style="color: #fff;">您拥有的游戏：</h4><hr>
        <div class="row ">
            <c:if test="${OwnGame!=null}">
                <c:forEach items="${OwnGame}" var="game">
                    <a href="javaScript:void(0)" class = "gaaaa">
                        <img src="static/image/${game.g_id}/game-reveal.jpg" title="详情" class="img-rounded games-reveal">
                        <input type="hidden" value="${game.g_id}">
                    </a>
                </c:forEach>
            </c:if>
        </div>
    </div>

  </div>
 </div>
</body>
<script>
    $(function (){
        var gameName = $(".games-reveal-name");
        var gameReveal = $(".games-reveal");
        console.log(gameName)

        /*展示游戏细节的HTML的函数*/
        function revealGameDetail(gameId) {
            var html='';
            $.ajax({
                type:"get",
                url:"revealGame/"+gameId,
                //data:{"gid":gameId},
                success:function (game) {
                    html = '<div id="myGame" style="background-color: rgba(0, 0, 0, 0.5);" class="container">'+
                        '<div class="row">'+
                        '<button type="button" id="myButton" class="btn btn-primary col-md-2 btn-lg myButton">'+
                        '<span class="glyphicon glyphicon-download-alt " style="color: rgb(255, 255, 255);"> Download</span>'+
                        '</button>'+
                        '<span class="glyphicon glyphicon-time game-time col-md-offset-1 myButton" style="color: rgb(155, 255, 140);"> 游戏时间<p>2021年10月21日</p></span>'+
                        '<div class="btn-group col-md-offset-5" role="group" style="margin-top: 20px;">'+
                        '<button type="button" class="btn btn-info">'+
                        '<span class="glyphicon glyphicon-thumbs-up" style="color: rgb(255, 255, 115);"></span>'+
                        '</button>'+
                        '<button type="button" class="btn btn-info">'+
                        '<span class="glyphicon glyphicon-tags" style="color: rgb(255, 255, 115);"></span>'+
                        '</button>'+
                        '<button type="button" class="btn btn-info">'+
                        '<span class="glyphicon glyphicon-share-alt" style="color: rgb(255, 255, 115);"></span>'+
                        '</button>'+
                        '</div></div><br>'+
                        '<div class="row">'+
                        '<div class="col-md-10 domain" style="background-color: rgba(0, 0, 0, 0.8); border-radius: 5px;height: 50px;line-height: 50px;">'+
                        '<a href="${pageContext.request.contextPath}/gIntroduction?gId='+game.g_id+'" class="memee">游戏详情</a>'+
                        '<a href="javaScript:void(0)" class="memee">社区中心</a>'+
                        '<a href="javaScript:void(0)" class="memee">讨论区</a>'+
                        '<a href="javaScript:void(0)" class="memee">创意工坊</a>'+
                        '<a href="javaScript:void(0)" class="memee">客服</a>'+
                        '<a href="javaScript:void(0)" class="memee">指南</a>'+
                        '</div></div>'+
                        '<div class="row">'+
                        '<div class="panel panel-default col-md-8 domain" style="background-color: rgba(0, 0, 0, 0.8); border: none;margin-top: 10px;">'+
                        '<div class="panel-heading" style="background-color: rgba(0, 0, 0, 0.8);">'+
                        '<input type="text " class="form-control inn" placeholder="将此游戏介绍给你的好友"></div>'+
                        '<div class="btn-group col-md-offset-9" role="group" style="margin-top: 5px;">'+
                        '<button type="button" class="btn btn-info"><span class="glyphicon glyphicon-heart-empty" style="color: rgb(255, 78, 81);"></span></button>'+
                        '<button type="button" class="btn btn-info">发布</button>'+
                        '</div></div></div></div>'+
                        '<img src="'+game.gd_image+'" class="imges">';
                    $("#own-game-platform").html(html)
                    //console.log(html)
                }
            })

        }

        /*点击图片展开游戏的详细信息*/
        for (let i=0;i<gameReveal.length;i++){
            gameReveal[i].onclick = function () {
                var gid = $(this).siblings().val();
                gameName[i].style.backgroundColor="rgb(156, 173, 234)";
                revealGameDetail(gid);
            }
        }

        //console.log(gameReveal)

        for (let i=0;i<gameName.length;i++){
            gameName[i].onclick = function () {
                var gid;
                for (let j=0;j<gameName.length;j++){
                    if(gameName[j]==this){
                        gameName[j].style.backgroundColor="rgb(156, 173, 234)";
                         gid = $(this).next().val();
                    }else{
                        gameName[j].style.backgroundColor="";
                    }
                }
                console.log(gid)
                revealGameDetail(gid);
            }
        }

    })
</script>
</html>