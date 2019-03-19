package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class welcome extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");

        out.println("<%@ page contentType='text/html;charset=UTF-8' language='java' %>");
        out.println("<%@taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>");
        out.println("<%@taglib uri='http://java.sun.com/jsp/jstl/fmt' prefix='fmt'%>");
        out.println("<%@ taglib prefix=\"items\" uri='http://java.sun.com/jsp/jstl/core' %>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>登录成功</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<p>恭喜，${user} 登录成功！</p>");
        out.println("<p>用户名：${user}</p>");
        out.println("<p>密码：${psw}</p>");
        out.println("<p><a href=\"userLogout.jsp\">注销</a></p>");
        out.println("</body>");
        out.println("</html>");
    }
}













