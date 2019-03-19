package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        session.removeAttribute("user");
        session.removeAttribute("psw");
        session.setAttribute("msg","注销成功");
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.write("<script>alert('注销成功');location='"+req.getContextPath()+"/index.jsp'</script>");
        out.close();
        resp.sendRedirect("index.jsp");
    }
}
