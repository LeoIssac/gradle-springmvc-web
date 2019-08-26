<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/5/22
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jstl标签-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>

    <!-- 表格样式-->
    <style type="text/css">
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border: 1px #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            padding: 8px;
            border: 1px solid #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            padding: 8px;
            border: 1px solid #666666;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div>
<table class="gridtable">
    <tr>
        <th>id</th>
        <th>姓名</th>
        <th>年龄</th>
    </tr>
    <!--循环输入表格内容-->
    <c:forEach items="${users}" var="user">
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.age}</td>
    </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
