<%--
  Created by IntelliJ IDEA.
  User: 邓文钢
  Date: 2021/6/16
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
 <%
     request.getRequestDispatcher("/homePage").forward(request,response);
     /*request.getRequestDispatcher(request.getContextPath()+"/homepage").forward(request,response);*/
   /*  response.sendRedirect(request.getContextPath()+"/game/homePage");*/
 %>
  </body>
</html>
