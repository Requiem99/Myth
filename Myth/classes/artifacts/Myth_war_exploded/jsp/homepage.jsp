<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<body style="background-color: #05B8F7;padding-top: 50px">
   <%@include file="header.jsp"%>
   <script src="static/js/homepage.js"></script>
   <script src="static/js/gameshow.js"></script>
   <div id="background"></div>
    <div id="menu">
            <div id="seek_image"></div>
            <form action="${pageContext.request.contextPath}/seekGames" rel="form" method="get">
                <div class="form-group has-feedback">
                    <input type="text" id="seek" class="form-control inn" name="Gname"  placeholder="按名称搜索" required>
                </div>
            </form>
            <div id="exhibition">
                <img src="static/image/1/red_dead22.png" alt="">
                <img src="static/image/2/resident_evil2_22.png" alt="">
                <img src="static/image/3/the_witcher3_22.png" alt="">
                <img src="static/image/4/Don't_get_starve22.png" alt="">
                <img src="static/image/5/batman22.png" alt="">
            </div>
            <ul id="list" class="list">
                <li><img src="static/image/1/red_dead2_min2.png" alt=""></li>
                <li><img src="static/image/2/resident_evil2_min2.png" alt=""></li>
                <li><img src="static/image/3/the_witcher3_min2.png" alt=""></li>
                <li><img src="static/image/4/Don't_get_starve_min2.png" alt=""></li>
                <li><img src="static/image/5/batman_min2.png" alt=""></li>
            </ul>
            <ul id="list2" class="list">
                <li><a href="javaScript:void(0)" >《Red Dead Redemption 2》大特买！</a></li>
                <li><a href="javaScript:void(0)" >《Resident Evil 2》</a></li>
                <li><a href="javaScript:void(0)" >《巫师 3：狂猎》</a></li>
                <li><a href="javaScript:void(0)" >《Don't Starve》</a></li>
                <li><a href="javaScript:void(0)" >《Batman™: Arkham Knight》</a></li>
            </ul>
            <div id="menu02"><br>
                <p style="font-size: 30px;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">特卖</p>
                <hr style="background-color: black;height: 2px;border: 0;">

                <div class="container">
                    <div class="row">
                        <c:forEach items="${List}" var="games">
                        <div class="col-sm-6 col-md-3" title="${games.g_name}">
                            <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);">
                                <img src="${games.g_picture}" alt="...">
                                <div class="caption">
                                    <input type="hidden" class="game-id" value="${games.g_id}"/>
                                    <p class="game-name">${games.g_name}</p>
                                    <p  style="font-size: 20px;">￥${games.price}</p>
                                    <p>
                                       <a href="${pageContext.request.contextPath}/gIntroduction?gId=${games.g_id}" class="btn btn-info " role="button" target="_blank">查看</a>
                                       <a href="javaScript:void(0)" class="btn btn-default add-list" role="button"><span class="glyphicon glyphicon-plus "></span> 加入愿望清单</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>

                <%--添加购物车之后提示的信息--%>
                <%@include file="addwishlistmassage.jsp"%>

                    <hr style="background-color: black;height: 2px;border: 0;">
                    <div class="container">
                    <div class="row" style="margin-top: 30px;" id="showGames">
                        <div class="col-md-2" >
                            <%--点击切换展示的游戏--%>
                            <ul class="nav nav-pills nav-stacked" id="olo">
                                <li role="presentation" class="active"><a href="javascript:void(0)" id="hot">热销</a></li>
                                <li role="presentation" class="wait"><a href="javascript:void(0)">推荐</a></li>
                                <li role="presentation" class="wait"><a href="javascript:void(0)">最新推出</a></li>
                            </ul>
                        </div>

                        <%--游戏展示--%>
                        <div class="col-md-10 game-container" style="height: 560px">

                        </div>

                    </div>
                   </div>

                <!-- ================= -->
                <div class="container">
                    <hr style="background-color: black;height: 2px;border: 0;">
                    <div class="row">
                        <div class="col-sm-6 col-md-6">
                            <img src="static/image/static/Diesel3.png" alt="">
                        </div>
                    </div>
                </div>
            </div>

    </div>
<%@include file="foot.jsp"%>
   <%--=========javaScriptCode==========--%>
   <script>
       $(function (){
           var li=$("#olo>li")
           var index=0;
           var c_btn=$(".active a").html()
           console.log(c_btn)
           /*点击切换展示游戏的按钮，按钮的颜色变换*/
           for (let i=0;i<li.length;i++) {
               li[i].onclick = function () {
                   for (let j=0;j<li.length;j++) {
                       if (li[j] == this) {
                           li[j].className = "active";
                       } else {
                           li[j].className = "wait";
                       }
                   }
                   c_btn=$(".active a").html();
                   /*切换展示的游戏*/
                   gameShow(c_btn)
               }

           }

           function gameShow(changeBtn){
               var html="";
               $.get("${pageContext.request.contextPath}/showGames",{text:changeBtn},function (arr) {
                   for (let i = 0;i<arr.length;i++){
                       html+=
                           '<div class="col-sm-6 col-md-3" title="'+arr[i].g_name+'">'+
                           '<div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);height:240px">'+
                           '<img src="'+arr[i].g_picture+'">'+
                           '<div class="caption">'+
                           '<input type="hidden" value="'+arr[i].g_id+'"/>'+
                           '<p class="game-name-show">'+arr[i].g_name+'</p>'+
                           '<p style="font-size: 18px";>￥'+arr[i].price+'</p>'+
                           '<p class="text-right"><a href="${pageContext.request.contextPath}/gIntroduction?gId='+arr[i].g_id+'"class="btn btn-info check" role="button">查看</a> ' +
                           '</p>'+
                           '</div></div></div>'
                   }
                   $(".game-container").html(html);
               })
           }
           gameShow(c_btn)

           /*========*/


       })
   </script>
</body>
</html>