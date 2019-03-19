<%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/10
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注销页面</title>
</head>
<body>
    <%
        session.removeAttribute("user");
        session.removeAttribute("psw");
        session.setAttribute("msg","注销成功");
//        response.sendRedirect("index.jsp");
    %>
<%--<c:redirect url="index.jsp?a=1&b=2"></c:redirect>--%>
<%--<c:redirect url="index.jsp">--%>
	<%--<c:param name="a">1</c:param>--%>
	<%--<c:param name="b">2</c:param>--%>
<%--</c:redirect>--%>
	<c:redirect url="index.jsp">
		<c:param name="a" value = "1a"></c:param>
		<c:param name="b" value="2b"></c:param>
	</c:redirect>
</body>
</html>
