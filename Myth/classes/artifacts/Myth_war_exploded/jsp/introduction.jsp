<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<body style="background-color:  #05B8F7;padding-top: 50px">
   <%@include file="header.jsp"%>
       <div style="height:auto;width: 1000px;margin: 0 auto; background-color: rgba(0, 0,0, 0.8);padding-bottom: 50px"><br>
           <p class="font-color game-intro-title">${game.g_name}</p>
           <hr style="background-color:#FFF;height: 2px;border: 0;">
           <div class="container" style="height:auto;width: 1000px">
               <div class="row">
                   <div class="col-md-10 col-md-offset-1" >
                       <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                           <!-- Indicators -->
                           <ol class="carousel-indicators">
                               <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                           </ol>

                           <!-- Wrapper for slides -->
                           <div class="carousel-inner" role="listbox" style="height: 300px;">
                               <div class="item active">
                                   <img src="static/image/${game.g_id}/1.jpg" alt="...">
                               </div>
                               <div class="item">
                                   <img src="static/image/${game.g_id}/2.jpg" alt="...">
                               </div>
                               <div class="item">
                                   <img src="static/image/${game.g_id}/3.jpg" alt="...">
                               </div>
                               <div class="item">
                                   <img src="static/image/${game.g_id}/4.jpg" alt="...">
                               </div>
                           </div>

                           <!-- Controls -->
                           <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                               <span class="sr-only">Previous</span>
                           </a>
                           <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                               <span class="sr-only">Next</span>
                           </a>
                       </div>
                   </div>
               </div>
               <br>
               <div class="row">
                   <div class="col-md-6 col-md-offset-1">
                       <h4 class="font-color">游戏简介</h4>
                       <p class="text-left font-color">${game.g_detail}</p>
                   </div>
               </div><br>
               <div class="row">
                   <div class="col-md-6 col-md-offset-1"><img src="${game.g_picture}" alt=""></div>
                   <h4 class="font-color">${game.g_name}</h4>
                   <input type="hidden" class="game-id" value="${game.g_id}"/>
                   <div class="btn-group-vertical col-md-3" role="group">
                       <a class="btn btn-primary col-md-2 buy-game"
                          href="${pageContext.request.contextPath}/buyGameOrder?o_u_id=${sessionScope.user.id}&o_g_id=${game.g_id}&o_g_name=${game.g_name}&o_g_picture=${game.g_picture}&o_g_money=${game.price}" target="_blank">立即购买￥${game.price}</a><br>
                       <button type="button" class="btn btn-defualt col-md-2 add-list" style="height:40px">
                           <span class="glyphicon glyphicon-plus-sign" style="color: rgb(65, 78, 69); border-radius: 5px;"></span><b>添加至愿望清单</b></button><br>
                       <button type="button" class="btn btn-default col-md-2 add-order"> <span class="glyphicon glyphicon-plus-sign" style="color: rgb(0, 0, 60);"></span> <b>加入购物车</b></button><br>
                   </div>
               </div><br>

               <%--评论区--%>
               <hr>
               <div>
                   <c:if test="${sessionScope.user!=null}">
                       <h4 class="comment-font">为${game.g_name}撰写一篇测评</h4>
                       <p class="comment-font">您认为这款游戏有什么优点或缺点？您是否会将这款游戏推荐给他人？请写下您的看法。</p>
                       <p class="comment-font">请注意保持礼貌并遵守 <a href="">《规则及指引》</a>。</p>
                   </c:if>
                   <c:if test="${sessionScope.user==null}">
                       <h4 class="comment-font">未登录！</h4>
                       <p class="comment-font">登录之后开始测评！ <a href="login.jsp" class="btn btn-default">登录</a></p><br>
                   </c:if>
                   <form class="form-horizontal " id="comment-all" method="post">
                       <input type="hidden" name="c_g_id" value="${game.g_id}">
                       <input type="hidden" name="c_g_name" value="${game.g_name}">
                       <input type="hidden" name="c_author_id" value="${sessionScope.user.id}">
                       <input type="hidden" name="c_author_username" value="${sessionScope.user.name}">
                       <input type="hidden" name="c_author_header_icon" value="${sessionScope.user.header_icon}">
                       <div class="form-group ">
                           <div class="col-md-1">
                               <img class="img-rounded" id="login-default" src="static/image/static/login.png" alt="未登录！"  style="height: 75px;width: 75px"  />
                           </div>
                           <div class="col-md-8">
                               <textarea class="form-control inn writ-comment" name="c_content" placeholder="..." required></textarea>
                           </div>
                       </div>
                       <div class="form-group">
                           <c:if test="${sessionScope.user!=null}">
                               <a href="${pageContext.request.contextPath}/showWishList" class="btn btn-default col-lg-offset-2">愿望清单</a>
                               <a href="" class="btn btn-default">查看订单</a>
                           </c:if>
                           <button type="submit" class="btn btn-info col-lg-offset-6 submit-comment" data-toggle="tooltip" title="未登录！请先登录！" data-placement = "top">发布测评</button>
                       </div>
                   </form>
               </div>
               <hr>
               <div class="container" style="width: 1000px;min-height: 300px;height: auto">
                   <%--如果改游戏没有评论--%>
                   <c:if test="${commentForUpThumbsNumList.size()==0}">
                        <h4 class="comment-font">${game.g_name}还没有评论！请来留下第一条！</h4>
                   </c:if>
                   <%--如果该游戏有评论--%>
                   <c:if test="${commentForUpThumbsNumList.size()!=0}">
                       <h4 class="comment-font">评论区：${commentList.size()}条评论！</h4>
                       <span class="col-md-2 comment-font">最有价值的测评</span> <span class="col-md-2 col-md-offset-6 comment-font">最新发布</span>
                       <%--点赞最高--%>
                       <div class="col-md-8" id = "comment-box01">

                            <c:forEach items="${commentForUpThumbsNumList}" var="commentForUpThumbsNum">
                                <div class="container-fluid comment-item">
                                   <input type="hidden" value="${commentForUpThumbsNum.c_id}">
                                   <div class="row" >
                                       <div class="col-md-1">
                                           <img src="${commentForUpThumbsNum.c_author_header_icon}" alt="${commentForUpThumbsNum.c_author_username}"  style="height: 50px;width: 50px"  class="img-rounded"/>
                                       </div>
                                       <div class="col-md-2">
                                           <label class="comment-font">${commentForUpThumbsNum.c_author_username}</label>
                                       </div>
                                       <div class="col-md-9 comment-font comment-content">
                                           <p>发布于${commentForUpThumbsNum.c_datetime}</p>
                                           <span class="comment">${commentForUpThumbsNum.c_content}</span>
                                           <span class="show-all-content"></span>
                                       </div>
                                   </div>
                                   <div class="row">
                                       <div class="col-md-3 col-md-offset-4">
                                           <a href="javaScript:void(0)" class="btn thumbs" title="未登录！" data-toggle="tooltip"><span class="glyphicon glyphicon-thumbs-up"   style="color: #FFFFFF;text-shadow: black 5px 3px 3px;">是</span></a>
                                           <a href="javaScript:void(0)" class="btn thumbs" title="未登录！" data-toggle="tooltip"><span class="glyphicon glyphicon-thumbs-down" style="color: #FFFFFF;text-shadow: black 5px 3px 3px;">否</span></a>
                                           <input type="hidden" value="${commentForUpThumbsNum.c_id}">
                                       </div>
                                   </div>
                                   <div class="row">
                                       <small class="col-md-5 col-md-offset-4 comment-font " id = "thumbs-count${commentForUpThumbsNum.c_id}">有${commentForUpThumbsNum.thumbs_up}人觉得这篇测评很有价值</small>
                                       <a href="javaScript:void(0)" class="btn col-md-offset-1 secondary-comment"></a>
                                   </div>
                                   <br>
                                </div>
                            </c:forEach>
                           </div>

                       <%--最近发出的测评--%>
                       <div class="col-md-3 " id="comment-box02">
                           <c:forEach items="${commentForRecentList}" var="commentForRecent">
                               <div class="container-fluid comment-recent">
                                   <div class="row" style="background-color: #7EBBDE">
                                       <label>${commentForRecent.c_author_username}</label>
                                   </div>
                                   <div class="row comment-font comment-content-recent" >
                                       <span>
                                           ${commentForRecent.c_content}
                                       </span>
                                   </div>
                               </div>
                           </c:forEach>
                       </div>
                   </c:if>

               </div>
               <%----%>
           </div>
       </div>
    <%@include file="addwishlistmassage.jsp"%>
    <%@include file="foot.jsp"%>
   </body>
<script>
    $(function () {
        var occur = false;

        /*=======查看游戏是否在仓库中=========*/
        function checkGameOnWareHouse() {
            if (${sessionScope.user!=null}){
                var i = ${sessionScope.user.id}
                $.get("${pageContext.request.contextPath}/checkGameOnWareHouse",
                    {gId:$(".game-id").val(),
                     uId:i},
                    function (data){
                    console.log(data)
                        if (data===true){
                            $(".buy-game").html("游戏已在库中");
                            $(".buy-game").attr("disabled",true)
                        }
                    })
           }else{
                $(".buy-game").click(function () {
                    alert("请先登录再购买游戏！")
                    location.href = "jsp/login.jsp"
                })
            }
        }
        checkGameOnWareHouse();
       /*=============检查游戏是否在购物车中==============*/
        function checkGameOnCart() {
            if(${sessionScope.user!=null}){
            var i = ${sessionScope.user.id}
            $.get("${pageContext.request.contextPath}/checkGameOnCart",
                {gId:$(".game-id").val(),
                    uId:i},
                function (data) {
                    console.log(data)
                    if (data === true) {
                        $(".add-order").html("游戏已在购物车中");
                        $(".add-order").attr("disabled", true)
                    }
                })
            }else {
                    $(".add-order").click(function () {
                        alert("请先登录再添加购物车！")
                        location.href = "jsp/login.jsp"
                    })
                }

        }
        checkGameOnCart()
        /*========游戏加入购物车=========*/
        $(".add-order").click(function () {
            $.get("${pageContext.request.contextPath}/addCart",
                { o_u_id:'${sessionScope.user.id}',   /*get ajax 非url传参 一定要为String类型*/
                  o_g_id:'${game.g_id}',
                  o_g_name:'${game.g_name}',
                  o_g_picture:'${game.g_picture}',
                  o_g_money:'${game.price}'
                },
                function () {
                    $(".add-order").html("游戏已在购物车中")
                    $(".add-order").attr("disabled",true)
                }
            )
        })


        /*==========查看评论是否超出字数，超出就收起============*/
        $(".comment-item").each(function () {
            var commnt =  $(this).find(".comment").text();//获取 当前 父元素下的 .comment的text
            if (commnt.length>300){
                $(this).find(".comment").text(commnt.substr(0,300)+"...")
                $(this).find(".show-all-content").text("[查看]")
            }
            /*点击展开 评论内容 或 收起评论*/
            $(this).find(".show-all-content").click(function () {
                if(occur){
                    $(this).prev().text(commnt.substr(0,300)+"...")
                    $(this).text("[查看]")
                }else{
                    $(this).prev().text(commnt)
                    $(this).text("[收起]")
                }
                occur = !occur;
            })
        })


        $("[data-toggle='tooltip']").mouseover(function () {
            if (${sessionScope.user==null}){
                $(this).tooltip('show');
            }else {
                $(this).tooltip('hide')
                $(this).attr('title','')
            }
        })

        /*----提交评论----*/
        $("#comment-all").submit(function () {
            if (${sessionScope.user==null}){
              alert("请先登录！")
              location.href = "jsp/login.jsp"
            }else{
            let date = new Date()
            $("[name = 'dateTime']").val(date.getFullYear()+"-"+date.getMonth()+"-"+date.getDate()+"-"+date.getHours())
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/submitComment",
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data:$("#comment-all").serialize(),//必须要序列化表单的值，不然后台无法获取。
                success:function (data) {
                    if (data!=null){
                        alert("测评成功!")
                        $("#comment-box02").prepend('<div class="container-fluid comment-recent">'+
                                                     '<div class="row" style="background-color: #7EBBDE">'+
                                                     '<label>'+data.c_author_username+'</label>'+
                                                     '</div><div class="row comment-font comment-content-recent" >'+
                                                     '<span>'+data.c_content+'</span></div></div>')
                    }else {
                        alert("测评失败!")
                    }
                }

              })
            }
            return false;//必须要，不然会刷新页面
        })


        /*点赞数和点踩数*/
        var n = 0;
        $(".thumbs").click(function () {
            n++;
            var upOrDownThumbs = $(this).find("span").html();
            var commentId = $(this).siblings("input").val();
            var gameId = ${game.g_id};
            if (${sessionScope.user==null}){
                location.href = "jsp/login.jsp";
            }else{
                $.get(
                    "${pageContext.request.contextPath}/commentThumbs/"+commentId+"/"+gameId,
                    {upOrDownThumbs:upOrDownThumbs},
                    function (count) {
                        $("#thumbs-count"+commentId).html("有"+count+"人觉得这篇测评很有价值")
                    })
            }
        })

        /*获取每个评论的次级评论数*/
        var commentSize = ${commentForUpThumbsNumList.size()};
        for (let i = 0;i<commentSize;i++){
            var c_id = $(".secondary-comment:eq(i)").prev().siblings("input").val()
            $.get(
                "${pageContext.request.contextPath}/getSecondaryNum/"+c_id,
                function (num) {
                    if (num!=0){
                        $(".secondary-comment:eq(i)").html(num+'<span class="glyphicon glyphicon-comment" style="color: #38B1FF;"></span>')
                    }

                }
            )

        }

    })
</script>
</html>
