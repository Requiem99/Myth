<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<body>
   <%@include file="header.jsp"%>
   <script src="js/homepage.js"></script>
    <div id="menu">
        <div id="exhibition">
            <img src="image/1/red_dead22.png" alt="">
            <img src="image/2/resident_evil2_22.png" alt="">
            <img src="image/3/the_witcher3_22.png" alt="">
            <img src="image/4/Don't_get_starve22.png" alt="">
            <img src="image/5/batman22.png" alt="">
        </div>
        <ul id="list" class="list">
            <c:forEach var="game" items="${List}">
            <li><img src="${game.g_picture}" alt=""></li>
            </c:forEach>
        </ul>
        <ul id="list2" class="list">
            <c:forEach var="game" items="${List}">
            <li><a href="http://" >${game.g_name}</a></li>
            </c:forEach>
        </ul>
       <%-- <ul id="list2" class="list">
            <li><a href="huangye.html" >《Red Dead Redemption 2》大特买！</a></li>
            <li><a href="shenhua.html" >《Resident Evil 2》</a></li>
            <li><a href="wushi3.jsp" >《巫师 3：狂猎》</a></li>
            <li><a href="jihuang.html" >《Don't Starve》</a></li>
            <li><a href="http://" >《Batman™: Arkham Knight》</a></li>
        </ul>--%>
        <div id="menu02">
            <p style="font-size: 30px;font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">特卖</p>
            <hr style="background-color: black;height: 2px;border: 0;">

            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);">
                            <img src="image/1/red_dead22.png" alt="...">
                            <div class="caption">
                                <h3>《Red Dead Redemption 2》</h3>
                                <p  style="font-size: 20px;">￥250</p>
                                <p><a href="#" class="btn btn-primary" role="button">查看</a> <a href="#" class="btn btn-default" role="button"><span class="glyphicon glyphicon-plus"></span> 加入愿望清单</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);">
                            <img src="image/3/the_witcher3.png" alt="...">
                            <div class="caption">
                                <h3>《巫师 3：狂猎》</h3>
                                <p style="font-size: 20px;">￥250</p>
                                <p><a href="#" class="btn btn-primary" role="button">查看</a> <a href="#" class="btn btn-default" role="button"><span class="glyphicon glyphicon-plus"></span> 加入愿望清单</a></p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);">
                            <img src="image/2/resident_evil2.png" alt="...">
                            <div class="caption">
                                <h3>《Resident Evil 2》</h3>
                                <p style="font-size: 20px;">￥250</p>
                                <p><a href="#" class="btn btn-primary" role="button">查看</a> <a href="#" class="btn btn-default" role="button"><span class="glyphicon glyphicon-plus"></span> 加入愿望清单</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%--===================--%>
                <script>
                    var html = "";
                    $(function (){
                            var li=$("#olo>li")
                            var index=0;
                            for (let i=0;i<li.length;i++) {
                                li[i].onclick = function () {
                                    for (let j=0;j<li.length;j++) {
                                        if (li[j] == this) {
                                            li[j].className = "active";
                                        } else {
                                            li[j].className = "wait";
                                        }
                                    }
                                }

                            }

                        $.get("${pageContext.request.contextPath}/showGames",{text:$(".active a").html()},function (arr) {
                            for (let i = 0;i<arr.length;i++){
                                html+=
                                    '<div class="col-sm-6 col-md-3">'+
                                    '<div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);height:260px">'+
                                    '<img src="'+arr[i].g_picture+'"...">'+
                                    '<div class="caption">'+
                                    '<h4>'+arr[i].g_name+'</h4>'+
                                    '<p>￥'+arr[i].price+'</p>'+
                                    '<p><a href="${pageContext.request.contextPath}/gIntroduction?gId='+arr[i].g_id+'"class="btn btn-primary" role="button">查看</a> ' +
                                    '<a href="${pageContext.request.contextPath}/addWishList?gId='+arr[i].g_id+'" class="btn btn-default" role="button"><span class="glyphicon glyphicon-plus"></span></a></p>'+
                                    '</div></div></div>'
                            }
                            $(".col-md-10").append(html);
                        })

                            
                        
                    })
                </script>
                <hr style="background-color: black;height: 2px;border: 0;">
                <div class="row" style="margin-top: 30px;" id="showGames">
                    <div class="col-md-2" >
                        <ul class="nav nav-pills nav-stacked" id="olo">
                            <li role="presentation" class="active"><a href="javascript:void(0)" id="hot">热销</a></li>
                            <li role="presentation" class="wait"><a href="javascript:void(0)">推荐</a></li>
                            <li role="presentation" class="wait"><a href="javascript:void(0)">最新推出</a></li>
                        </ul>
                    </div>
                    <div class="col-md-10" >

                    </div>

               </div>

            <!-- ================= -->
            <div class="container">
                <hr style="background-color: black;height: 2px;border: 0;">
                <div class="row">
                    <div class="col-sm-6 col-md-6">
                        <img src="image/static/Diesel2.png" alt="">
                    </div>
                </div>
            </div>
            <div style="width: 100%;height: 65px;background-color:rgba(0, 0, 0, 0.8);">
                <div style="">
                    <p id="sevep" style="color: #fff;">芜湖HUHUHUHUHUH！|免费游戏资料|LOL技术群|MYTH公众号|隐私政策</p>
                </div>
            </div>

        </div>
    </div>


</body>

</html>