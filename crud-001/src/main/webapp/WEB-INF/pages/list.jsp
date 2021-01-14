<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/13
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  pageContext.setAttribute("PATH",request.getContextPath());
  /*
  * request.getContextPath()以/开头，不已/结束
  * */
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${PATH}/js/jquery-1.7.2.js"></script>
</head>
<body>

</body>
</html>
