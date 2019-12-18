<%--<jsp:useBean id="user" scope="request" type=""/>--%>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/18
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:useBean id="pageInfo" scope="page" type="com.github.pagehelper.Page"/>--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<jsp:forward page="/user"/>--%>
<html>
<head>
    <title>用户管理</title>
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
<body>
     <!--搭建显示页面-->
     <div class="container">
         <!--标题-->
         <div class="row" class="col-md-12">
             <h1>用户管理</h1>
         </div>
         <!--按钮-->
         <div class="row">
         </div>
         <!--显示表格数据-->
         <div class="row">
             <div class="col-md-12">
                 <table class="table table-hover" id="users_table">
                     <thead>
                     <tr>
                         <th>账号</th>
                         <th>昵称</th>
                         <th>性别</th>
                         <th>姓名</th>
                         <th>E-mail</th>
                         <th>地区</th>
                         <th>操作</th>
                     </tr>
                     </thead>
                     <tbody>

                     </tbody>
                 </table>
             </div>
         </div>
         <!--显示分页信息-->
         <div class="row">
             <!--分页文字信息-->
             <div class="col-md-6">
                 当前 页，总 页,总 条记录
             </div>
             <!--分页条-->
             <div class="col-md-6">

             </div>
         </div>
     </div>
     <script type="text/javascript">
         //1.页面加载完成以后，直接去发送ajax要分页数据
         $(function (){
            $.ajax({
                url:"${APP_PATH}/user",
                date:"pn=1",
                type:"get",
                success:function (result){
                    // console.log(result);
                    //解析显示员工数据
                    build_user_table(result);
                    //解析显示分页

                }
            })
         });
         // <th>账号</th>
         // <th>昵称</th>
         // <th>性别</th>
         // <th>姓名</th>
         // <th>E-mail</th>
         // <th>地区</th>
         // <th>操作</th>
         function build_user_table(result) {
             var users = result.extend.pageInfo.list;
             $.each(users,function (index,item){
                 var uUseridTd = $("<td></td>").append(item.uUserid);
                 var uNicknameTd = $("<td></td>").append(item.uNickname);
                 var uSexTd = $("<td></td>").append(item.uSex);
                 var uNameTd = $("<td></td>").append(item.uName);
                 var uEmailTd = $("<td></td>").append(item.uEmail);
                 var uWorkplaceTd = $("<td></td>").append(item.uWorkplace);
                 var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm")
                                                    .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                 var btnTd = $("<td></td>").append(delBtn);
                 $("<tr></tr>").append(uUseridTd)
                     .append(uNicknameTd)
                     .append(uSexTd)
                     .append(uNameTd)
                     .append(uEmailTd)
                     .append(uWorkplaceTd)
                     .append(btnTd)
                     .appendTo("#users_table tbody");
             });
         }
         //解析显示分页
         function build_page_info(){

         }
         //解析显示分页条
         function build_page_nav(result) {

         }
     </script>
</body>
</html>
