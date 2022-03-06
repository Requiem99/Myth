<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body style="background-color: #05B8F7;">
   <%@include file="header.jsp"%>
   <script>
       $(function(){
           function find01(){
               if(${result.size()==0}){
               $("#row01").append("<h2>结果不存在!</h2>");
             }
           }
           find01();
       })
   </script>
    <div style="height:100%;width: 1200px;margin: 0 auto;"><h4>搜索结果：${result.size()}</h4>
        <hr style="background-color: black;height: 2px;border: 0;">
        <div class="container">
           <div class="row" id="row01">
               <c:forEach items='${result}' var="games">
                   <div class="col-sm-6 col-md-3">
                       <div class="thumbnail" style="background-color: rgba(0, 0, 0, 0.4);height:280px">
                        <img src="${games.g_picture}" alt="...">
                           <div class="caption">
                               <h4>${games.g_name}</h4>
                               <p style="font-size: 20px;">￥${games.price}</p>
                               <p><a href="${pageContext.request.contextPath}/gIntroduction?id=${games.g_id}" class="btn btn-primary" role="button">查看</a>
                               <a href="${pageContext.request.contextPath}/addWishList?id=${games.g_id}" class="btn btn-default" role="button">+加入愿望清单</a></p>
                           </div>
                       </div>
                   </div>
               </c:forEach>

           </div>
        </div>
    </div>

</body>
</html>