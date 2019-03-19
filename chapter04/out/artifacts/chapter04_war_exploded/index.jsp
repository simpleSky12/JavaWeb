<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.sun.xml.internal.ws.developer.ServerSideException" %><%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/9
  Time: 23:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="items" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>首页</title>
	<style type="text/css">
		.red{color: red;}
		.green{color:green;}
	</style>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	String username = "";
	for(Cookie cookie:cookies){
		if("user".equals(cookie.getName())){
			username = cookie.getValue();
		}
	}
	
%>
<form id="form" action="${pageContext.request.contextPath}/loginServlet" method="post">
	<div>用户名登录</div>
	<div id="name">用户名：<input id="name1" type="text" name="user" value="<%=username%>" /> <span id="txt1"></span> </div>
	<div id="psw">密码：&nbsp;<input id="psw1" type="password" name="psw"> <span id="txt"></span></div>
	<div>
		<input id="btn" type="submit" value="登录">
	</div>
</form>
<%
	Object count = application.getAttribute("count");
	if(count == null){
		application.setAttribute("count",new Integer(1));
	}else{
		Integer i = (Integer)count;
		application.setAttribute("count",i.intValue()+1);
	}
	Integer n = (Integer)application.getAttribute("count");
	out.println("该网页被浏览次数为："+ n.intValue());
	
	String msg = (String)session.getAttribute("msg");

%>
</body>

<div>
	<%=msg%>
</div>
</html>
