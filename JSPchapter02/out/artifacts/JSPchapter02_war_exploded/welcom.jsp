<%--suppress ALL --%>
<%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/8
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>welcome</title>
</head>
<body>

<%
    User user = (User)session.getAttribute("loginName");
    if(user==null){
        request.setAttribute("msg","对不起，请先登录~");
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
%>
恭喜 <%=user.getName()%> 登录成功。<a href="logOut.jsp">注销</a>
</body>
</html>
