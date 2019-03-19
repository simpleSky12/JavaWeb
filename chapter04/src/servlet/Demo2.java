package servlet;

import com.sun.deploy.nativesandbox.comm.Response;
import sun.security.krb5.Config;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.http.HttpContext;
import java.io.IOException;
import java.io.PrintWriter;

public class Demo2 extends HttpServlet {

    public Demo2(){
        System.out.println("====Demo2被创建了=====");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("=====Demo2中的dopost（）方法被调用了");

        HttpSession session = req.getSession();
        ServletContext context1 = req.getServletContext(); // 获取application
        ServletContext context2 = session.getServletContext();

        resp.setContentType("text/html;charset=utf-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.write("<h1>this is Demo2, 你好 Servlet</h1>");
        out.write("<p>hello world</p>");
        out.close();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        System.out.println("======Demo2初始化=====");
        // 获取web.xml中定义的初始化值
        String encode = config.getInitParameter("encode");
        System.out.println("encode："+encode);
    }

    @Override
    public void destroy() {
        super.destroy();
        System.out.println("======Demo2被销毁======");
    }
}
