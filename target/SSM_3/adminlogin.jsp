<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/19
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
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
</head>
<body >
<form method="post" id="adminloginform">
    <h1>欢迎管理员</h1>
    <hr/>
    <table align="center">
        <tr>
            <td>账号：</td>
            <td><input type="text" name="aAdminname" id="aAdminname" class="form-control">
                <div id="idError" style="display:inline;color:red;"></div>
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="aPassword" id="aPassword" class="form-control">
                <div id="passwordError" style="display:inline;color:red;"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="checkbox">
                    <label>
                        <input type="checkbox">记住密码
                    </label>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="1">
            </td>
            <td>
                <button id="admin_login_btn" type="submit" class="btn btn-primary">登录</button>
                <input type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
<script>
        $("#adminloginform").submit(function() {
        //发送ajax请求校验账号是否重复
        var aAdminname=$("#aAdminname").val();
        $.ajax({
            url:"${APP_PATH}/checkaAdminname",
            data:"aAdminname="+aAdminname,
            type:"POST",
            async:false,
            success:function (result){
                if(result.code==100){
                    alert("对不起，您还不是管理员");
                    return false;
                }else{
                    var aPassword=$("#aPassword").val();
                    $.ajax({
                        url:"${APP_PATH}/checkaPassword",
                        data:"aPassword="+aPassword,
                        type:"POST",
                        async:false,
                        success:function (result){
                            if(result.code==100){
                                alert("密码错误");
                                return false;
                            }else{
                                window.open('admin.jsp');
                            }
                        }
                    });
                }
            }
        });
    });
</script>
</html>
