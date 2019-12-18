<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/17
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员页面</title>
    <link rel="stylesheet" href="statics/css/bootstrap-3.3.7-dist/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">管理员系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="" onclick="reg()">用户注册页面</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    管理员
                </a>
            </li>
            <li class="layui-nav-item"><a href="adminlogin.jsp">退出</a></li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="">操作中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:changePage();">查看主贴</a></dd>
                        <dd><a href="">用户管理</a></dd>
                        <dd><a href="">板块管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body" id="body">
        <!-- 内容主体区域 -->
    </div>
    <div class="layui-footer">
    </div>
</div>
<script src="statics/js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });

    function reg(){
        document.getElementById("body").innerHTML='<iframe src="register.jsp"></iframe>'
    }
</script>
</body>
</html>
