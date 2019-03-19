<%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/10
  Time: 0:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="items" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录成功</title>
    <%
//        String user = (String)request.getAttribute("user");
//        String psw = (String)request.getAttribute("psw");
        String user = (String)session.getAttribute("user");
        String psw = (String)session.getAttribute("psw");
	    request.setAttribute("txt","<h1>标题</h1>");

    %>
    <p>恭喜，${user} 登录成功！</p>
    <p>用户名：<%=user%></p>
    <p>密码：<%=psw%></p>
    <p><a href="userLogout.jsp">注销</a></p>
	
	<c:forEach items="${list}" var="str" varStatus="index">
		<c:if test="${index.index%2==0}">
			<h2 style="background-color: green;">${str}======${index.index}</h2>
		</c:if>
		<c:if test="${index.index%2 != 0}">
			<h2>${str}=========${index.index}</h2>
		</c:if>
	</c:forEach>
	<c:out value="${txt}" default="我是默认值" escapeXml="false">
	
	</c:out>
	<c:url value="index.jsp" var = "index"></c:url>
	<p><a href="${index}">首页</a></p>
	<p><a href="${pageContext.request.contextPath}/index.jsp?a=11&b=22">首页</a></p>
</head>
<body>

</body>
</html>
