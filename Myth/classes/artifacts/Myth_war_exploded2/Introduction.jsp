<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body style="background-color:  #05B8F7;">
   <%@include file="header.jsp"%>
     <script>

     </script>
       <div style="height:800px;width: 1000px;margin: 0 auto; background-color: rgba(255, 255,255, 0.2);border-radius: 15px">
           <h2>${game.g_name}</h2>
           <hr style="background-color: black;height: 2px;border: 0;">
           <div class="container">
               <div class="row">
                   <div class="col-md-8 col-md-offset-1" >
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
                                   <img src="image/${game.g_id}/1.jpg" alt="...">
                               </div>
                               <div class="item">
                                   <img src="image/${game.g_id}/2.jpg" alt="...">
                               </div>
                               <div class="item">
                                   <img src="image/${game.g_id}/3.jpg" alt="...">
                               </div>
                               <div class="item">
                                   <img src="image/${game.g_id}/4.jpg" alt="...">
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
                       <h4>游戏简介</h4>
                       <p class="text-center">${game.g_detail}</p>
                   </div>
               </div><br>
               <div class="row">
                   <div class="col-md-6 col-md-offset-1"><img src="${game.g_picture}" alt=""></div>
                   <h4>${game.g_name}</h4>
                   <div class="btn-group-vertical" role="group">
                       <button type="button" class="btn btn-primary col-md-2" style="height:50px" data-toggle="modal" data-target="#myModal">立即购买￥${game.price}</button><br>
                       <button type="button" class="btn btn-defualt col-md-2  " style="height:40px">
                           <span class="glyphicon glyphicon-plus-sign" style="color: rgb(65, 78, 69); border-radius: 5px;"> 添加至愿望清单</span></button><br>
                       <span class="glyphicon glyphicon-euro" style="color: rgb(12, 41, 70);"> 平台</span>
                       &nbsp;
                   </div>
               </div>
           </div>
       </div>
    <%@include file="Pay.jsp"%>>
   </body>
</html>
