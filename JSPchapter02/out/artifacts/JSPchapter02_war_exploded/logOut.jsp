<%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/8
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>
    <%
        session.removeAttribute("loginName");
        session.invalidate();
        session.setMaxInactiveInterval(3600);
        request.setAttribute("msg","注销成功");
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    %>
</body>
</html>
