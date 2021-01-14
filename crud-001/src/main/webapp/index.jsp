<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/13
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("PATH",request.getContextPath());
    /*
     * request.getContextPath()以/开头，不已/结束
     * */
%>
<html>
<head>
    <title>跳转页</title>
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${PATH}/js/jquery-1.7.2.js"></script>
    <script type="text/javascript">
        $(function () {

            pages();

            $("#tBodyBtn").on("click",$("input[name=xz]"),function () {
                $("#qx").prop("checked",$("input[name=xz]").length==$("input[name=xz]:checked").length)
            })

            $("#qx").click(function () {
                $("input[name=xz]").prop("checked",this.checked);
            })



        })
        function pages() {
            $.ajax({
                url:"${PATH}/emps",
                type:"get",
                dataType:"json",
                success:function (date) {
                    var emps=date.map.pageInfo.list;
                    var html="";

                    $.each(emps,function (i,n) {
                        var gender=n.gender=="1"?"男":"女";
                      html+='<tr>';
                      html+='<td><input type="checkbox" name="xz" id="'+n.empId+'" /></td>';
                      html+='<td>'+n.empId+'</td>';
                      html+='<td>'+n.empName+'</td>';
                      html+='<td>'+gender+'</td>';
                      html+='<td>'+n.email+'</td>';
                      html+='<td>'+n.dId+'</td>';
                      html+='<td>';
                      html+='<button class="btn btn-info btn-sm" type="submit" >';
                      html+='<span class="glyphicon glyphicon-pencil " aria-hidden="true" aria-label="Left Align"></span>';
                      html+='修改';
                      html+='</button>';
                      html+='<button class="btn btn-danger btn-sm" type="submit">';
                      html+='<span class="glyphicon glyphicon-remove" aria-hidden="true" aria-label="Left Align"></span>';
                      html+='删除';
                      html+='</button>';
                      html+='</td>';
                      html+='</tr>';

                  })
                    $("#tBodyBtn").html(html);


                }
            })


        }
    </script>
</head>
<body>
<%--<h1>跳转中......</h1>--%>
     <%--&lt;%&ndash;<jsp:forward page="/emps"></jsp:forward>&ndash;%&gt;--%>
<%--<h2><a href="${PATH}/emps">点击查询所有员工相关记录</a></h2>--%>


<div class="container">
    <div class="col-md-12">
        <h2>员工信息</h2>
    </div>
</div>

<div class="row">
    <div class="col-md-4 col-md-offset-8">
        <button class="btn btn-info" type="submit">新增</button>
        <button class="btn btn-danger" type="submit">删除</button>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="col-md-12 table-hover">
            <thead>
            <tr>
                <td><input type="checkbox" id="qx" /></td>
                <th>#</th>
                <th>name</th>
                <th>gender</th>
                <th>email</th>
                <th>deptId</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody id="tBodyBtn">

            </tbody>
        </table>
    </div>
</div>

<div class="row" id="row1">
    <span class="col-md-6">当前第${requestScope.pageInfo.getPageNum()}页  共${requestScope.pageInfo.getPages()}页  共${requestScope.pageInfo.getTotal()}条记录</span>
</div>
<div class="row">

    <div class="col-md-4 col-md-offset-8">
        <nav aria-label="Page navigation">
            <ul class="pagination" id="ulId">

            </ul>
        </nav>
    </div>
</div>

</body>
</html>
