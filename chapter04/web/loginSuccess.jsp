
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="items" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
	<p>恭喜，${user} 登录成功！</p>
	<p>用户名：${user}</p>
	<p>密码：${psw}</p>
	<p><a href="logoutServlet">注销</a></p>
</body>
</html>
