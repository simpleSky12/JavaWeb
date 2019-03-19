<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/10
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页</title>
    <style type="text/css">
        div{text-align: center;}
    </style>
</head>
<body>
	
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String user = (String)request.getParameter("user");
        String psw = (String)request.getParameter("psw");

        if("张昭".equals(user)&& Integer.parseInt(psw)==12345){
//            request.setAttribute("user",user);
//            request.setAttribute("psw",psw);
//            request.getRequestDispatcher("loginSuccess.jsp").forward(request,response);

            Cookie cookie = new Cookie("user", URLEncoder.encode(user,"utf-8"));
            cookie.setMaxAge(60*60);
            cookie.setPath("/chapter02");
            response.addCookie(cookie);

            session.setAttribute("user",user);
            session.setAttribute("psw",psw);
            response.sendRedirect("loginSuccess.jsp");
        }else{
            if("小明".equals(user)){
                Cookie cookie = new Cookie("us er", URLEncoder.encode(user,"utf-8"));
                cookie.setMaxAge(60*60);
                cookie.setPath("/chapter02");
                response.addCookie(cookie);
            }
//            request.setAttribute("msg","登录失败，请重新登录");
//            request.getRequestDispatcher("index.jsp").forward(request,response);
            session.setAttribute("msg","登录失败，请重新登录");
            response.sendRedirect("index.jsp");
        }
    %>
	
</body>
</html>
