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
<form id="form" action="userLogin.jsp" method="post">
	<div>用户名登录</div>
	<div id="name">用户名：<input id="name1" type="text" name="user" value="<%=username%>" /> <span id="txt1"></span> </div>
	<div id="psw">密码：&nbsp;<input id="psw1" type="password" name="psw"> <span id="txt"></span></div>
	<div>
		<input id="btn" type="submit" value="登录">
	</div>
</form>
<%
	//    String count = (String) application.getAttribute("count");
//    if(count==null){
//      application.setAttribute("count","1");
//    }else{
//      int i = Integer.parseInt(count)+1;
//      application.setAttribute("count",i);
//    }
//    String n = (String)application.getAttribute("count");
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
	
	List<String> list = new ArrayList<String>();
	list.add("a");
	list.add("b");
	list.add("c");
	list.add("d");
	session.setAttribute("list",list);
%>


</body>

<div>
	<%=msg%>
</div>
	


	<%--<script type="text/javascript">--%>
	<%--var name1 = document.getElementById("name1");--%>
	<%--var psw1 = document.getElementById("psw1");--%>
	<%----%>
	<%--var checkName = function(){--%>
	    <%--console.log("启动");--%>
		<%--var reg1 = /^\w+$/g;--%>
		<%--var txt1 = document.getElementById("txt1");--%>
		<%----%>
		<%--if(!name.value){--%>
            <%--txt1.innerHTML="";--%>
			<%--txt1.innerHTML = "用户名不能为空，请输入用户名！";--%>
			<%--txt1.className = "";--%>
			<%--txt1.className = "red";--%>
			<%--return false;--%>
		<%--}else if(reg1.test(name.value)){--%>
            <%--txt1.innerHTML="";--%>
			<%--txt1.innerHTML = "用户名不符合格式规范";--%>
            <%--txt1.className = "";--%>
			<%--txt1.className = "red";--%>
			<%--return false;--%>
		<%--}else{--%>
            <%--txt1.innerHTML="";--%>
			<%--txt1.innerHTML = "用户名符合格式规范";--%>
            <%--txt1.className = "";--%>
			<%--txt1.className = "green";--%>
			<%--return true;--%>
		<%--}--%>
	<%--}--%>
	<%----%>
	<%--var checkPsw = function () {--%>
		<%--var txt = document.getElementById("txt");--%>
		<%--var reg = /^\d{6}$/g;--%>
		<%--if(!psw.value){--%>
			<%--txt.innerHTML = "密码不能为空，请输入密码！";--%>
			<%--txt.className = "red";--%>
			<%--return false;--%>
		<%--}else if(reg.test(psw.value)){--%>
			<%--txt.innerText = "密码格式有误！";--%>
			<%--txt.className = "red";--%>
			<%--return false;--%>
		<%--}else{--%>
			<%--txt.innerText = "密码格式正确";--%>
			<%--txt.className = "green";--%>
			<%--return true;--%>
		<%--}--%>
	<%--}--%>
	<%----%>
	<%--name1.onblur = checkName;--%>
	<%--psw1.onblur = checkPsw;--%>
	<%----%>
	<%--document.getElementById("btn").onclick = function(){--%>
		<%--if(checkName()&&checkPsw()){--%>
		<%--document.getElementById("form").submit();--%>
		<%--}--%>
	<%--}--%>
	<%--</script>--%>
</html>
