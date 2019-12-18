
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
<html>
<head>
    <title>主贴管理</title>
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
            <table class="table table-hover" id="mains_table">
                <thead>
                <tr>
                    <th>主贴名称</th>
                    <th>主贴内容</th>
                    <th>置顶情况</th>
                    <th>加精情况</th>
                    <th>发帖日期</th>
                    <th>积分</th>
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
        <div class="col-md-6" id="page_info_area">
        </div>
        <!--分页条-->
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalRecord;//总记录数
    var currentPage;//当前页
    //1.页面加载请完成后，直接发送一个ajax求，拿到分页信息
    $(function(){
        to_page(1);//首次加载页面时显示第一页
    });
    //跳转到页面
    function to_page(pn){
        $.ajax({
            url:"${APP_PATH}/main",
            data:"pn="+pn,
            type:"get",
            success:function (result) {
                //console.log(result);
                //1.解析并且显示员工数据
                build_mains_table(result);
                //2.解析并且显示分页信息
                build_page_info(result);
                //3.分页条的显示
                build_page_nav(result);
            }
        });
    }
    //table结构
    function build_mains_table(result) {
        //清空table表
        $("table tbody").empty();
        var mains=result.extend.pageInfo.list;
        $.each(mains,function (index,item) {
            //alert(item.empName);
            //
            //
            //
            // var 主贴名称 = $("<td></td>").append(item.主贴名称);
            //
            //
            //
            //
            // var 主贴名称Td = $("<td></td>").append(item.主贴名称);
            var mMainidTd = $("<td></td>").append(item.mMainid);
            var mContentTd = $("<td></td>").append(item.mContent);
            var mIsontopTd = $("<td></td>").append(item.mIsontop);
            var mIsperfectTd = $("<td></td>").append(item.mIsperfect);
            var mMaindateTd = $("<td></td>").append(item.mMaindate);
            var mPointTd = $("<td></td>").append(item.mPoint);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("delete-id",item.mMainid);
            var btnTd = $("<td></td>").append(delBtn);
            $("<tr></tr>")
                // .append(主贴名称)
                .append(mMainidTd)
                .append(mContentTd)
                .append(mIsontopTd)
                .append(mIsperfectTd)
                .append(mMaindateTd)
                .append(mPointTd)
                .append(btnTd)
                .appendTo("#mains_table tbody");
        });
    }
    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，" +
            "总共"+result.extend.pageInfo.pages+"页，" +
            "总共"+result.extend.pageInfo.total+"条记录");
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }
    //解析显示分页条，点击分页要去下一页
    function build_page_nav(result){
        $("#page_nav_area").empty();

        var ul=$("<ul><ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加翻页事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }
        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage==false){
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        }else{
            //为元素添加翻页事件
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);
            });
        }
        //添加首页和前一页的提示
        ul.append(firstPageLi).append(prePageLi);
        //遍历给ul中添加页码
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");//高亮显示
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加末页和下一页的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul添加到nav中
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }
    $(document).on("click",".delete_btn",function () {
        //弹出是否确认删除的对话框
        // alert($(this).parents("tr").find("td:eq(0)").text());
        var mMaintitle=$(this).parents("tr").find("td:eq(0)").text();
        var mMainid=$(this).attr("delete-id");
        if(confirm("确认删除【"+mMaintitle+"】吗？")){
            //确认，发送ajax请求删除
            $.ajax({
                url:"${APP_PATH}/mains/"+mMainid,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });
    <%--//完成全选，全不选功能--%>
    <%--$("#check_all").click(function () {--%>
    <%--    //attr获取checked是undefined,dom原生的属性--%>
    <%--    //以后使用prop修改和读取dom原生属性的值--%>
    <%--    //alert($(this).prop("checked"));--%>
    <%--    $(".check_item").prop("checked",$(this).prop("checked"));--%>
    <%--});--%>
    <%--//check_item--%>
    <%--$(document).on("click",".check_item",function () {--%>
    <%--    //判断当前选择的元素是否是5个--%>
    <%--    var flag=$(".check_item:checked").length==$(".check_item").length;--%>
    <%--    $("#check_all").prop("checked",flag);--%>
    <%--});--%>
    <%--//点击全部删除就批量删除--%>
    <%--$("#emp_delete_all").click(function () {--%>
    <%--    var empNames="";--%>
    <%--    var del_idstr="";--%>
    <%--    $.each($(".check_item:checked"),function () {--%>
    <%--        //当前遍历的元素--%>
    <%--        //$(this).parents("tr").find("td:eq(2)").text();--%>
    <%--        empNames+=$(this).parents("tr").find("td:eq(2)").text()+" ,";--%>
    <%--        //组装员工id的字符串--%>
    <%--        del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";--%>
    <%--    });--%>
    <%--    //去除empNames多余的逗号--%>
    <%--    empNames=empNames.substring(0,empNames.length-1);--%>
    <%--    del_idstr=del_idstr.substring(0,del_idstr.length-1);--%>
    <%--    if(confirm("确认删除【"+empNames+"】吗？")){--%>
    <%--        //发送ajax请求--%>
    <%--        $.ajax({--%>
    <%--            url:"${APP_PATH}/employee/emp/"+del_idstr,--%>
    <%--            type:"DELETE",--%>
    <%--            success:function (result) {--%>
    <%--                alert(result.msg);--%>
    <%--                //回到当期页面--%>
    <%--                to_page(currentPage);--%>
    <%--            }--%>
    <%--        });--%>
    <%--    }--%>
    <%--})--%>
</script>
</body>
</html>
