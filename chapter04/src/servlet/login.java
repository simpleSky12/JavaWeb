package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("utf-8");

        String user = (String)req.getParameter("user");
        String psw = (String)req.getParameter("psw");

        if("张昭".equals(user)&& Integer.parseInt(psw)==12345){
//            HttpSession session = req.getSession();
            req.setAttribute("user",user);
            req.setAttribute("psw",psw);
            req.getRequestDispatcher("loginSuccess.jsp").forward(req,resp);
//            resp.sendRedirect("loginSuccess.jsp");
        }else if(user==null||psw==null){
            req.setAttribute("msg","登录失败，请重新登录");
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }
    }
}
