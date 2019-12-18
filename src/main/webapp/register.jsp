<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/16
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <%
        //这个的路径是以斜线开始的，不以斜线结束
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!--引入jquery-->
    <script src="${APP_PATH}/statics/js/jquery-2.0.0.js"></script>
    <script src="${APP_PATH}/statics/css/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/statics/js/bootstrapValidator.js"></script>
    <!--引入样式-->
    <link href="${APP_PATH}/statics/css/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <link href="${APP_PATH}/statics/css/bootstrap-3.3.7-dist/css/bootstrapValidator.css" rel="stylesheet">
    <title>注册</title>
</head>
<body>
<div class="container">
    <div class="row">
        <!-- form: -->
        <section>
            <div class="col-lg-8 col-lg-offset-2">
                <div class="page-header">
                    <h2>注&nbsp;册</h2>
                </div>
                <form id="user_regis_form" class="form-horizontal"
<%--                      method="post" action="reguser"--%>
                      data-bv-message="This value is not valid"
                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">真实姓名</label>
                        <div class="col-lg-4">
                            <input action="reguser" type="text" class="form-control" name="uName" id="uName" placeholder="Full name" required data-bv-notempty-message="The Full name is required and cannot be empty" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">年龄</label>
                        <div class="col-lg-3">
                            <input type="text" class="form-control" name="uAge" id="uAge" placeholder="Age"
                                   required data-bv-notempty-message="The id is required and cannot be empty"
                            />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">账号</label>
                        <div class="col-lg-5">
                            <input type="text" class="form-control" name="uUserid" id="uUserid" placeholder="Userid"
                                   required data-bv-notempty-message="The id is required and cannot be empty"
                                   pattern="^[0-9]+$" data-bv-regexp-message="The id can only consist of alphabetical and digits"
                                   data-bv-stringlength="true" data-bv-stringlength-min="6" data-bv-stringlength-max="30" data-bv-stringlength-message="The id must be more than 6 and less than 30 characters long"
                                   data-bv-different="true" data-bv-different-field="password" data-bv-different-message="The id and password cannot be the same as each other"
                            />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">昵称</label>
                        <div class="col-lg-4">
                            <input type="text" class="form-control" name="uNickname" id="uNickname" placeholder="Nickname" required data-bv-notempty-message="The Nickname is required and cannot be empty" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">Email address</label>
                        <div class="col-lg-5">
                            <input class="form-control" name="uEmail" id="uEmail" type="email" placeholder="*****@qq.com" data-bv-emailaddress-message="The input is not a valid email address" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="uPassword" id="uPassword" placeholder="password(Connot be the same as Nickname )"
                                   required data-bv-notempty-message="The password is required and cannot be empty"
                                   data-bv-identical="true" data-bv-identical-field="confirmPassword" data-bv-identical-message="The password and its confirm are not the same"
                                   data-bv-different="true" data-bv-different-field="uNickname" data-bv-different-message="The password cannot be the same as username"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">确认密码</label>
                        <div class="col-lg-5">
                            <input type="password" class="form-control" name="confirmPassword" placeholder="confrim your password"
                                   required data-bv-notempty-message="The confirm password is required and cannot be empty"
                                   data-bv-identical="true" data-bv-identical-field="uPassword" data-bv-identical-message="The password and its confirm are not the same"
                                   data-bv-different="true" data-bv-different-field="uNickname" data-bv-different-message="The password cannot be the same as Nickname"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">性别</label>
                        <div class="col-lg-5">
                            <div class="radio">
                                <label>
                                    <input type="radio" name="uSex" id="uSex" value="男" required data-bv-notempty-message="The gender is required" />男
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="uSex" value="女"/>女
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-lg-3 control-label">地区</label>
                        <div class="col-lg-5">
                            <select class="form-control" name="uWorkplace" id="uWorkplace" data-bv-notempty data-bv-notempty-message="The country is required">
                                <option value="">-- Select a country --</option>
                                <option value="中国">China</option>
                                <option value="法国">France</option>
                                <option value="德国">Germany</option>
                                <option value="意大利">Italy</option>
                                <option value="日本">Japan</option>
                                <option value="俄罗斯">Russia</option>
                                <option value="英国">United Kingdom</option>
                                <option value="美国">United State</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-lg-9 col-lg-offset-3">
                            <button id="user_save_btn" type="submit" class="btn btn-primary">注册</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- :form -->
    </div>
</div>
</body>
<script>
     $("#user_save_btn").click(function (){
        //1.采用模态框进行表单数据的提交给服务器
        //2.发送ajax请求保存新用户
             var uName=$("#uName").val();
             var uAge=$("#uAge").val();
             var uUserid=$("#uUserid").val();
             var uNickname=$("#uNickname").val();
             var uEmail=$("#uEmail").val();
             var uPassword=$("#uPassword").val();
             var uSex=$("#uSex").val();
             var uWorkplace=$("#uWorkplace").val();
         // };
         alert($("#uName").val());
        $.ajax({
            url:"${APP_PATH}/reguser?uName="+uName+"&uAge="+uAge+"&uUserid="+uUserid+"&uNickname="+uNickname+"&uEmail="+uEmail+"&uPassword="+uPassword+"&uSex="+uSex+"&uWorkplace="+uWorkplace,
            type:"POST",
            success:function(result){
                if(result.msg){
                    alert("注册成功");
                }else{
                    alert("注册失败");
                }
                }
        });
    });
     $("#uUserid").change(function (){
         //发送ajax请求校验账号是否重复
         var uUserid=$("#uUserid").val();
         $.ajax({
             url:"${APP_PATH}/checkuUserid",
             data:"uUserid="+uUserid,
             type:"POST",
             success:function (result){
                 if(result.code==100){
                 }else{
                     alert("账号重复");
                 }
             }
         })
     });
     $(document).ready(function(){
         $('#user_regis_form').bootstrapValidator();
     });
</script>
</html>
