<%--
  Created by IntelliJ IDEA.
  User: smoothWater
  Date: 2019/3/8
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<body>
    <form action="logIn.jsp" method="post">
        <p>用户名：<input type="text" name="user"></p>
        <p>密码：<input type="password" name="psw"></p>
        <p>
            性别：<input type="radio" name="sex" value="man">男 <input type="radio" name="sex" value="women">女
        </p>
        <p>
            兴趣：<input type="checkbox" name="hoby" value="read">看书 <input type="checkbox" name="hoby" value="music">听音乐
        </p>
        <p>
            <select name="city">
                <option value="hf">合肥</option>
                <option value="ch">巢湖</option>
            </select>
        </p>

        <input type="submit" value="登录"><br>
        <%
            String msg = (String)request.getAttribute("msg");
        %>
        <%=msg%>
    </form>
</body>
</html>
