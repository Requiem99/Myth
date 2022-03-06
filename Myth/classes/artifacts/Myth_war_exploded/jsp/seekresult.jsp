<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body style="background-color: #05B8F7;padding-top: 50px">
   <%@include file="header.jsp"%>
   <script>
       $(function(){
           function find01(){
               if(${result.size()==0}){
               $("#row01").append("<h2 class='font-color'> &nbsp;&nbsp;&nbsp;结果不存在!</h2>");
             }
           }
           find01();
       })
   </script>
    <div style="height:auto;min-height: 700px;width: 1200px;margin: 0 auto;background-color: rgba(0,0,0,0.8)">
        <div class="row">
            <h4 class="col-md-2 font-color"> &nbsp;&nbsp; 搜索结果：${result.size()}</h4>
            <form rel="form" class="col-md-2 col-lg-offset-7" style="margin-top: 20px;margin-bottom:0px;height: 40px" action="${pageContext.request.contextPath}/seekGames" method="get">
                <div class="form-group has-feedback">
                    <input type="text" class="form-control inn " name="Gname" placeholder="按名称搜索">
                    <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true" style="color: rgb(0, 0, 0);"></span>
                </div>
            </form>
        </div>
        <hr style="background-color: #FFF;height: 2px;border: 0;">
        <div class="container-fluid">
           <div class="row" id="row01">
               <c:forEach items='${result}' var="games">
                   <div class="col-sm-6 col-md-3 " title="${games.g_name}">
                       <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);height:280px">
                            <img src="${games.g_picture}" alt="...">
                               <div class="caption">
                                   <input type="hidden" class="game-id" value="${games.g_id}"/>
                                   <p class="game-name font-color">${games.g_name}</p>
                                   <p style="font-size: 20px;" class="font-color">￥${games.price}</p>
                                   <p>
                                       <a href="${pageContext.request.contextPath}/gIntroduction?gId=${games.g_id}" class="btn btn-info" role="button" target="_blank">查看</a>
                                       <a href="javaScript:void(0)" class="btn btn-default add-list" role="button">+加入愿望清单</a>
                                   </p>
                               </div>
                           </div>
                   </div>
                   <script>
                       console.log($(".add-list").parent().siblings('input').val());
                   </script>
               </c:forEach>

           </div>
        </div>
    </div>
<%@include file="addwishlistmassage.jsp"%>
<%@include file="foot.jsp"%>
</body>
</html>