<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--添加游戏到愿望清单成功--%>
<body>
    <div class="modal fade" id="addSuccess" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">MYTH</h4>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">  <span class="glyphicon glyphicon-ok"></span> Ok</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
</body>


<script>
     $(".add-list").click(function () {
         var val=$(this).parent().siblings('input').val();
         console.log(val)
         if(${sessionScope.user==null}) {
             location.href = "jsp/login.jsp" //如果未登录，则跳转到登陆界面
         }else {
             $.get("${pageContext.request.contextPath}/addWishList/"+val,function (item) {
             if (item == true) {
                     $(".modal-body").html("添加愿望清单成功！")
                     $("#addSuccess").modal("show")
                 }else {
                     $(".modal-body").html("添加愿望清单失败！")
                     $("#addSuccess").modal("show")
                 }
             })
             $(this).addClass("disabled")
             $(this).html('<span class="glyphicon glyphicon-ok"></span> 游戏已在愿望清单中')
             //$(this).css({"cursor":"not-allowed"})
         }

     })
</script>
</html>