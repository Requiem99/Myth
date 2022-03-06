<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<body>
  <%@include file="header.jsp"%>

  <script>
    $(function(){
      $(".alert").hide();

      $(".btn-warning").click(function(){
        var Row = $(this).siblings("label").html();
        var val = $(this).prev().children().val();
        var warning = $(this).nextAll();
        console.log(val)
        $.get("changeUserIntro/"+Row+"/"+val,function (flag) {
                if(flag!=0){
                  warning[0].style.display = "block"
                  console.log("Row:"+Row)
                }else {
                  warning[1].style.display = "block"
                }
        })

        if(${flag!=0}){
            $("#suc").show();
        }else{
          $("dan").show();
        }
      })

    });
  </script>

  <div class="container" style="background-color: rgba(177, 255, 255, 0.6);border-radius: 15px;">
    <hr>
    <h3 class="col-md-offset-1">设置新用户名</h3><br>

    <div class="row">
      <label for="onlyUsername" class="col-sm-1 col-md-offset-1 control-label ">用户名:</label>
      <div class="col-md-5">
        <input type="Username" name="userName" class="form-control" id="onlyUsername" placeholder="新用户名" required>
      </div>
      <button type="button" class="btn btn-warning "><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);" ></span> 修改</button>
      <div class="alert alert-success col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        用户名修改成功！
      </div>
      <div class="alert alert-danger col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        用户名修改失败！
      </div>
    </div>

    <!--  -->
    <hr>
    <h3 class="col-md-offset-1">设置新密码</h3><br>
    <div class="row">
      <label for="onlyPwd" class="col-sm-1 col-md-offset-1 control-label ">新密码:</label>
      <div class="col-md-5">
        <input type="pwd" name="pwd" class="form-control" id="onlyPwd" placeholder="新密码" required>
      </div>
      <button type="submit" class="btn btn-warning " ><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);"></span> 修改</button>
      <div class="alert alert-success col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        密码修改成功！
      </div>
      <div class="alert alert-danger col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        密码修改失败！
      </div>
    </div>

    <hr>
    <h3 class="col-md-offset-1">设置新邮箱</h3><br>
    <div class="row">
      <label for="onlyEmail" class="col-sm-1 col-md-offset-1 control-label ">新邮箱:</label>
      <div class="col-md-5">
        <input type="email" name="emaid" class="form-control" id="onlyEmail" placeholder="新邮箱" required>
      </div>
      <button type="submit" class="btn btn-warning " ><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);"></span> 修改</button>
      <div class="alert alert-success col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        邮箱修改成功！
      </div>
      <div class="alert alert-danger col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        邮箱修改失败！
      </div>
    </div>
    <hr>
    <h3 class="col-md-offset-1">设置新地址</h3><br>

    <div class="row">
      <label for="onlyAddress" class="col-sm-1 col-md-offset-1 control-label">新地址:</label>
      <div class="col-md-5">
        <input type="address" name="address" class="form-control" id="onlyAddress" placeholder="新地址" required>
      </div>
      <button type="submit" class="btn btn-warning " ><span class="glyphicon glyphicon-pencil" style="color: rgb(112, 100, 236);"></span> 修改</button>
      <div class="alert alert-success col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        地址修改成功！
      </div>
      <div class="alert alert-danger col-md-6 col-md-offset-2 alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        地址修改失败！
      </div>
    </div>
    <hr>

    <!-- ======================++++======================== -->
    <h3 class="col-md-offset-1">重置基本信息</h3><br>
    <form class="form-horizontal" action="">
      <div class="form-group">
        <label for="inputUsername3" class="col-sm-2 control-label">用户名:</label>
        <div class="col-md-6">
          <input type="Username" name="userName" class="form-control" id="inputUsername3" placeholder="新用户名" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">邮箱:</label>
        <div class="col-md-6">
          <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="更改邮箱" required>
        </div>
      </div>
      <div class="form-group">
        <label for="address" class="col-sm-2 control-label">地址:</label>
        <div class="col-md-6">
          <input type="address" name="address" class="form-control" id="address" placeholder="新地址" required>
        </div>
      </div>
      <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
        <div class="col-md-6">
          <input type="password" name="pwd" class="form-control" id="inputPassword3" placeholder="新密码" required>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10">
          <div class="alert alert-success col-md-6 col-md-offset-2 alert-dismissible" id="suc" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            重置所有信息成功！
          </div>
          <div class="alert alert-danger col-md-6 col-md-offset-2 alert-dismissible" id="dan" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            重置所有信息失败！
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-md-offset-2 col-md-2">
          <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-saved" style="color: #54bdee;"></span> 确认更改</button>
        </div>

        <div class="col-md-2">
          <button type="reset" class="btn btn-danger "><span class="glyphicon glyphicon-remove" style="color: #54bdee;"></span> 清空</button>
        </div>
      </div>
    </form>
  </div>
  </body>
</html>