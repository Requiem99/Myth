
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
<div class="modal fade" tabindex="-1" id="paymentResult" role="dialog" aria-labelledby="myLargeModalLabel" >
    <div class="modal-dialog modal-lg" role="document" style="height: 500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <img src="static/image/static/myth-logo01.png" alt="logo" style="height: 60px;width: 120px">
            </div>
            <div class="modal-body">
               <div style="height: 520px;padding-top: 60px" id="result">

               </div>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
</body>
<script>
   $(function () {
       $(".pay").click(function () {
          $.get("${pageContext.request.contextPath}/paymentResult/${count}/wx",
            function (data) {
                if (data===true){
                    $("#result").html(' <div style="height: 250px;width: 200px;margin: 0 auto ;">'+
                                            '<img src="static/image/static/打勾.png" alt="">'+
                                            '<h3>支付成功！</h3>'+
                                            '<h4>感谢您对MYTH的支持！</h4>'+
                                       '</div>')
                }else {
                    $("#result").html(' <div style="height: 250px;width: 200px;margin: 0 auto ;">'+
                                            '<img src="static/image/static/打叉.png" alt="">'+
                                            '<h3>支付失败！</h3>'+
                                            '<h4>请检查您的账户余额！</h4>'+
                                       '</div>')
                }
            }
           )
           $("#paymentResult").modal('show')
       })
   })
</script>
</html>

