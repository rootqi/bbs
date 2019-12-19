
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
<!-- 编辑板块模态框 -->
<div class="modal fade" id="sectionUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">修改板块</h4>
            </div>
            <div class="modal-body">
                <!--编辑表单-->
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="sBanzhuid_update_input" class="col-sm-2 control-label">版主id</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="sBanzhuid" id="sBanzhuid_update_input" placeholder="请输入你要修改后的版主id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sSectionname_update_static" class="col-sm-2 control-label">版块名称</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="sSectionname_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sDescription_update_static" class="col-sm-2 control-label">板块描述</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="sDescription_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default" id="section_update_btn">修改</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<!--搭建显示页面-->
<div class="container">
    <!--标题-->
    <div class="row" class="col-md-12">
        <h1>板块管理</h1>
    </div>
    <!--按钮-->
    <div class="row">
    </div>
    <!--显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="sections_table">
                <thead>
                <tr>
                    <th>板块名称</th>
                    <th>板块描述</th>
                    <th>版主id</th>
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
            url:"${APP_PATH}/section",
            data:"pn="+pn,
            type:"get",
            success:function (result) {
                //console.log(result);
                //1.解析并且显示员工数据
                build_sections_table(result);
                //2.解析并且显示分页信息
                build_page_info(result);
                //3.分页条的显示
                build_page_nav(result);
            }
        });
    }
    //table结构
    function build_sections_table(result) {
        //清空table表
        $("table tbody").empty();
        var sections=result.extend.pageInfo.list;
        $.each(sections,function (index,item) {
            var sIdTd = $("<td></td>").append(item.sId);
            var sSectionnameTd = $("<td></td>").append(item.sSectionname);
            var sDescriptionTd = $("<td></td>").append(item.sDescription);
            var sBanzhuidTd = $("<td></td>").append(item.sBanzhuid);
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个自定义的属性
            editBtn.attr("edit-id",item.sId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("delete-id",item.sId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>")
                .append(sSectionnameTd)
                .append(sDescriptionTd )
                .append(sBanzhuidTd )
                .append(btnTd)
                .appendTo("#sections_table tbody");
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

    //删除操作
    $(document).on("click",".delete_btn",function () {
        //弹出是否确认删除的对话框
        var sSectionname =$(this).parents("tr").find("td:eq(0)").text();
        var sId=$(this).attr("delete-id");
        if(confirm("确认删除"+sSectionname+"板块吗？")){
            //确认，发送ajax请求删除
            $.ajax({
                url:"${APP_PATH}/sections/"+sId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });
    //点击编辑钮创建之前就绑定了事件，编辑信息资料
    //2.可以在创建按钮的时候绑定事件 3.绑定点击.live()
    //jquery新版本没有live(),使用on替代
    $(document).on("click",".edit_btn",function () {
        //alert("");
        //-------------注意以下的逻辑关系，先后次序不能改变

        getSection($(this).attr("edit-id"));

        $("#sectionUpdateModal").modal({
            backdrop:"static"
        });

        //2.把版主的id传递给模态框的更新按钮
        $("#section_update_btn").attr("edit-id",$(this).attr("edit-id"));


    });


    //获取员工信息
    function getSection(sId) {
        $.ajax({
            url:"${APP_PATH}/section/"+sId,
            type:"GET",
            success:function (result) {
                var sectionData=result.extend.section;
                $("#sSectionname_update_static").text(sectionData.sSectionname);
                $("#sDescription_update_static").text(sectionData.sDescription);
                $("#sBanzhuid_update_input").val(sectionData.sBanzhuid);
            }
        });
    }
    <%--//点击更新，更新板块信息--%>
    <%--$("#section_update_btn").click(function () {--%>
    <%--    var sBanzhuid=$("#sBanzhuid_update_input").val();--%>
    <%--    alert(sBanzhuid);--%>
    <%--    //发送ajax请求，保存更新的用户信息--%>
    <%--    $.ajax({--%>
    <%--        url:"${APP_PATH}/section/"+$(this).attr("edit-id"),--%>
    <%--        method:"PUT",--%>
    <%--        data:"sBanzhuid="+sBanzhuid,--%>
    <%--        success:function (result) {--%>
    <%--            alert(result.msg);--%>
    <%--            //1.关闭对话框--%>
    <%--            $("#sectionUpdateModal").modal("hide");--%>
    <%--            //2.回到本页面--%>
    <%--            to_page(currentPage);--%>
    <%--        }--%>
    <%--    });--%>
    <%--});--%>
    //点击更新，更新板块信息
    $("#section_update_btn").click(function () {
        var sBanzhuid=$("#sBanzhuid_update_input").val();
        alert(sBanzhuid);
        alert($(this).attr("edit-id"));
        //发送ajax请求，保存更新的用户信息
        $.ajax({
            url:"${APP_PATH}/saveBanzhuid？sBanzhuid="+sBanzhuid+"&sId="+$(this).attr("edit-id"),
            method:"POST",
            success:function (result) {
                alert(result.msg);
                //1.关闭对话框
                $("#sectionUpdateModal").modal("hide");
                //2.回到本页面
                to_page(currentPage);
            }
        });
    });
</script>
</body>
</html>
