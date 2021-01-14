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

        })
        function pages() {
            $.ajax({
                url:"${PATH}/emps",
                type:"get",
                dataType:"json",
                success:function (date) {
                   alert("成功")
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
            <tr>
                <th>#</th>
                <th>name</th>
                <th>gender</th>
                <th>email</th>
                <th>deptId</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.pageInfo.getList()}" var="page" varStatus="s">
                <tr>
                    <td>${page.empId}</td>
                    <td>${page.empName}</td>
                    <td>${page.gender eq "1"?'男':'女'}</td>
                    <td>${page.email}</td>
                    <td>${page.dId}</td>
                    <td>
                        <button class="btn btn-info btn-sm" type="submit" >

                            <span class="glyphicon glyphicon-pencil " aria-hidden="true" aria-label="Left Align"></span>
                            修改
                        </button>
                        <button class="btn btn-danger btn-sm" type="submit">

                            <span class="glyphicon glyphicon-remove" aria-hidden="true" aria-label="Left Align"></span>
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

<div class="row">
    <span class="col-md-6">当前第${requestScope.pageInfo.getPageNum()}页  共${requestScope.pageInfo.getPages()}页  共${requestScope.pageInfo.getTotal()}条记录</span>
</div>
<div class="row">

    <div class="col-md-4 col-md-offset-8">
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li><a href="${PATH}/emps?pn=1">首页</a></li>
                <c:if test="${pageInfo.hasPreviousPage}">
                    <li>
                        <a href="${PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                    <c:if test="${page_num eq pageInfo.pageNum}">
                        <li class="active"><a href="${PATH}/emps?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                    <c:if test="${page_num ne pageInfo.pageNum}">
                        <li><a href="${PATH}/emps?pn=${page_num}">${page_num}</a></li>
                    </c:if>
                </c:forEach>
                <c:if test="${pageInfo.hasNextPage}">
                    <li>
                        <a href="${PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>

                <li><a href="${PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
</div>

</body>
</html>
