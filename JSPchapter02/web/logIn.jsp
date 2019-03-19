<%--suppress ALL --%>
<%@ page import="java.util.Arrays" %>
<%@ page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="content-type" content="text/html; charset=UTF-8">
<html>
<head>
    <title>登录</title>
</head>
<body>
    This is login
    <%
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String username = request.getParameter("user");
        System.out.println("姓名："+username);
        String psw = request.getParameter("psw");
        System.out.println("密码："+psw);
//        String sex = request.getParameter("sex");
//        String[] hoby = request.getParameterValues("hoby");
//        System.out.println("性别："+sex);
//        System.out.println("爱好："+ Arrays.toString(hoby));
//        String city = request.getParameter("city");
//        System.out.println("城市："+city);
        if("张昭".equals(username)){
            User user = new User(username,psw);
            session.setAttribute("loginName",user);
            response.sendRedirect("welcom.jsp");
////            response.sendRedirect("http://www.baidu.com");
//            request.setAttribute("user",username);
//            request.getRequestDispatcher("welcom.jsp").forward(request,response);
        }else{
//            response.sendRedirect("welcom.jsp");
            request.setAttribute("msg","登录失败");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    %>
</body>
</html>
