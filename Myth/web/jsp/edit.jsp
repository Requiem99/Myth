<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body style=";background-color: #05B8F7;padding-top: 50px">
  <%@include file="header.jsp"%>

  <script>
    $(function(){
      $(".alert").hide();
      var str ='';

      $(".btnAlter").click(function(){
        var row = $(this).siblings("label").html();
        var val = $(this).prev().children().val();
        let msg1 = '未填写！'
        let msg2 = '修改'
        let url1 = '${pageContext.request.contextPath}/changeUserIntro/'
        console.log(val)
        //var is = $(this);
        alterMsg(val,row,msg1,msg2,url1);
        console.log(str)
        $(this).attr("data-content",str)
        $(this).popover({delay:{hide:300}})
        $(this).popover("show");
      })



      function alterMsg(v1,v2,m1,m2,url) {
        if(v1===""){
          str = '<div class="alert alert-warning" role="alert">'+m1+'</div>'
          return;
        }else{
          $.ajax({
            type:"get",
            url:url+v2,
            data:{"userIntro":v1},
            async:false,
            success:function (flag) {
              if(flag!=0){
                str = '<div class="alert alert-success  alert-dismissible" role="alert">'+m2+'成功！</div>'
              }else {
                str = '<div class="alert alert-danger  alert-dismissible" role="alert">'+m2+'失败！</div>'
              }
            },
          })
        }
      }

      /*if (${nexus!=null}){
        if(${nexus!=0}){
          $("#suc").show();
        }else{
          $("dan").show();
        }
      }*/

      /*======头像上传======*/
      console.log(typeof FileReader==="undefined")

      //var file = document.getElementById("UploadFile").files[0];

      /*头像预览*/
      $("#UploadFile").change(function () {//当UploadFile的value发生改变
        // 1. 创建一个读取文件的对象
        var fileReader = new FileReader();
        // 取到当前选中的头像文件
         console.log(this.files[0]);
        // 读取你选中的那个文件
        fileReader.readAsDataURL(this.files[0]);  // 读取文件是需要时间的
        fileReader.onload = function () {
          // 2. 等上一步读完文件之后才 把图片加载到img标签中
          $("#UploadIcon").attr("src", fileReader.result);
        };
      });
      /*头像上传*/
      $("#load").click(function (){
        var iconFile = document.getElementById("UploadFile").files[0];
        console.log(iconFile);
        if (typeof(iconFile)==="undefined"){
            $("[title = '头像']").attr('data-content','<div class="alert alert-warning  alert-dismissible" role="alert">未选择图片！</div>');
            $("[title = '头像']").popover('show');
            return;
        }
        var formData = new FormData();
        formData.append("icon",iconFile);
        $.ajax({
          url:'${pageContext.request.contextPath}/uploadIcon',
          type:'post',
          contentType:false,//必须！
          processData: false,//对参数进行序列化处理，必须设置为false
          data: formData,
          //async:false,
          success:function (flag) {
            if(flag!=0){
                $("[title = '头像']").attr('data-content','<div class="alert alert-success  alert-dismissible" role="alert">上传成功！</div>')

            }else {
                $("[title = '头像']").attr('data-content','<div class="alert alert-success  alert-dismissible" role="alert">上传失败！</div>')
                return;
            }
              $("[title = '头像']").popover('show');
          }
        })

      })
    /*  $("#load").submit(function (){
        $.ajax({
          success:function (flag) {
            if(flag!=0){
              $("[title = '头像']").attr('data-content','<div class="alert alert-success  alert-dismissible" role="alert">上传成功！</div>')
            }else {
              $("[title = '头像']").attr('data-content','<div class="alert alert-success  alert-dismissible" role="alert">上传失败！</div>')
            }
            $("[title = '头像']").popover('show');
          }
        })

      })*/

    });
  </script>



  <div class="container" style="background-color: rgba(0, 0, 8, 0.8);">
    <hr>
    <h3 class="col-md-offset-1 intro-title">上传头像</h3><br>
    <form class="row" method="post" action="${pageContext.request.contextPath}/uploadIcon" enctype="multipart/form-data">
      <div class="form-group">
        <label for="UploadIcon" class="col-md-1 col-md-offset-1 control-label ">头像:</label>
        <div class="Upload col-md-2">
          <img src="${user.header_icon}" id="UploadIcon" alt="点击上传头像！">
          <input type="file" name="icon" id="UploadFile" accept="image/jpg, image/png"><%--input 只能接受jpg和png的图片--%>
        </div>
        <button type="button" id="load" class="btn btn-warning " title="头像" data-html=ture data-container="body" data-placement="right" data-toggle="popover">
          <span class="glyphicon glyphicon-open" style="color: rgb(112, 100, 236);" ></span> 上传</button>
        <p class="col-md-offset-2 help-block">Please upload header icon !</p>
      </div>
    </form>
    <hr>
    <h3 class="col-md-offset-1 intro-title">设置新用户名</h3><br>

    <div class="row">
      <label for="onlyUsername" class="col-sm-1 col-md-offset-1 control-label ">用户名:</label>
      <div class="col-md-5">
        <input type="text" name="userName" class="form-control inn" id="onlyUsername" placeholder="${user.username}" required>
      </div>
      <button type="button" class="btn btn-warning btnAlter" title="用户名" data-html=ture data-container="body" data-placement="right" data-toggle="popover"><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);" ></span> 修改</button>

    </div>

    <!--  -->
    <hr>
    <h3 class="col-md-offset-1 intro-title">设置新密码</h3><br>
    <div class="row">
      <label for="onlyPwd" class="col-sm-1 col-md-offset-1 control-label ">新密码:</label>
      <div class="col-md-5">
        <input type="password" name="pwd" class="form-control inn" id="onlyPwd" placeholder="${user.password}" required>
      </div>
      <button type="submit" class="btn btn-warning btnAlter" title="密码" data-html=ture data-container="body" data-placement="right" data-toggle="popover"><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);"></span> 修改</button>
    </div>

    <hr>
    <h3 class="col-md-offset-1 intro-title">设置新邮箱</h3><br>
    <div class="row">
      <label for="onlyEmail" class="col-sm-1 col-md-offset-1 control-label ">新邮箱:</label>
      <div class="col-md-5">
        <input type="email" name="email" class="form-control inn" id="onlyEmail" placeholder="${user.email}" required>
      </div>
      <button type="button" class="btn btn-warning btnAlter" title="邮箱" data-html=ture data-container="body" data-placement="right" data-toggle="popover"><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);" ></span> 修改</button>

    </div>

    <hr>
    <h3 class="col-md-offset-1 intro-title">设置新地址</h3><br>
    <div class="row">
      <label for="onlyAddress" class="col-sm-1 col-md-offset-1 control-label">新地址:</label>
      <div class="col-md-5">
        <input type="text" name="address" class="form-control inn" id="onlyAddress" placeholder="${user.address}" required>
      </div>
      <button type="submit" class="btn btn-warning btnAlter" title="地址" data-html=ture data-container="body" data-placement="right" data-toggle="popover"><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);"></span> 修改</button>
    </div>
    <hr>

    <!-- ======================++++======================== -->
  </div>
  </body>
</html>