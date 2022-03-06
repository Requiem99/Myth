<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<script>
    $(function(){
        var only = $(".assHold");
        var radios = $(".radios");

        for (var i = 0; i < only.length; i++) {
            radios[i].checked=false;

            only[i].onclick=function(){
                var index=i;
                for (let j = 0; j < radios.length; j++) {
                    if(only[j]==this){
                        radios[j].checked=true;
                    }else{
                        radios[j].checked=false;
                    }

                }
            }
        }

    })
</script>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">请支付！</h3>
            </div>
            <div class="modal-body container">
                <div class="panel-group col-md-6" id="accordion">
                    <div class="panel panel-default row">
                        <div class="panel-heading" >
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" >
                                <div class="input-group assHold" >
                                          <span class="input-group-addon">
                                            <input type="radio" aria-label="..." class="radios ">
                                          </span>
                                    <p  class="form-control "><span class="glyphicon glyphicon-qrcode zf" style="color: rgb(0, 255, 1);"> 微信支付</span></p>
                                </div><!-- /input-group -->
                            </a>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body">
                                <img src="image/static/weixin.png" alt="..." class="img-rounded" style="height: 45px;width: 112px">
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default row">
                        <div class="panel-heading" >
                            <a data-toggle="collapse" data-parent="#accordion"  href="#collapseThree" >
                                <div class="input-group assHold">
                                          <span class="input-group-addon">
                                            <input type="radio" aria-label="..."  class="radios ">
                                          </span>
                                    <p class="form-control "><span class="glyphicon glyphicon-qrcode zf" style="color: rgb(0, 127, 255);"> 支付宝支付</span></p>
                                </div><!-- /input-group -->
                            </a>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                <img src="image/static/zhifubao.png" alt="..." class="img-rounded" style="height: 53px;width: 85px">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 订单汇总 -->
                <div class="col-md-3 " style="height: 500px; background-color: rgba(0, 100,255, 0.2);">
                    <img src="${game.g_picture}" alt="..." class="img-thumbnail">
                    <h4>${game.g_name}</h4>
                    <p>列出价格:￥${game.price}</p>
                    <p>价格:￥${game.price}</p>
                    <hr>
                    <p>总共:￥${game.price}</p>
                    <p>您支付:￥${game.price}</p>
                    <hr>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="blankCheckbox" value="option1" aria-label="...">
                        </label>
                        <span class="warning">请点击处确认已仔细阅读<strong>免责声明</strong>!</span>
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">
                    <span class="glyphicon glyphicon-ok" style="color: rgb(255, 101, 125);"></span>  确认支付
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
