<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'reg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <style type="text/css">
		  .red{color: red;}
		  .green{color: green;}
	  </style>
  </head>
  
  <body>
  <h1>注册页面</h1>
     <form action="${pageContext.request.contextPath}/UserServlet" method="post">
	     <p>用户名：<input id="input1" type="text" name="uName"/><span id="txt1"></span></p>
	     <p>密码：<input id="input2" type="password" name="pwd"/><span id="txt2"></span></p>
    	<input type="hidden" name="action" value="reg"/>
    	<input  type="submit" value="注册"/>
    </form>
	${msg}
  </body>
  <script>
      var input1 = document.getElementById("input1");
      var input2 = document.getElementById("input2");

      input1.onblur = function(){
          var reg = /^\w+$/g;
          var txt1 = document.getElementById("txt1");
          if(input1.value == ""){
              txt1.innerText = "账户名不能为空";
              txt1.className = "red";
          }else if(!reg.test(input1.value)){
              txt1.innerText = "账户名不规范(用户名由数字、字母、下划线组成)";
              txt1.className = "red";
          }else{
              txt1.innerText = "账户名符合规范";
              txt1.className = "green";
          }
      }
      input2.onblur = function(){
          var reg = /^\d+$/g;
          var txt2 = document.getElementById("txt2");
          if(input2.value == ""){
              txt2.innerText = "密码不能为空";
              txt2.className = "red";
          }else if(!reg.test(input2.value)){
              txt2.innerText = "密码格式不规范（密码只能是数字组成）";
              txt2.className = "red";
          }else{
              txt2.innerText = "密码符合规范";
              txt2.className = "green";
          }
      }
  </script>
</html>
