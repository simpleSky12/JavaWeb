package servlet;

import biz.IUserBiz;
import biz.impl.UserBiz;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;



public class UserServlet extends HttpServlet {

    private IUserBiz userBiz= new UserBiz();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String un = req.getParameter("uName");
        String pwd = req.getParameter("pwd");
        String action = req.getParameter("action");
        User user;
        try {
            if("login".equals(action)){
                user = userBiz.login(un,pwd);
                if(user!=null){
                    req.getSession().setAttribute("loginUser",user);
                    resp.sendRedirect(req.getContextPath()+"/NewsServlet");
//                    req.getRequestDispatcher("/newsList.jsp").forward(req,resp);
                }else{
                    req.setAttribute("msg","对不起，用户名或密码错误");
                    req.getRequestDispatcher("/index.jsp").forward(req,resp);
                }
            }else if("reg".equals(action)){
                int num = userBiz.register(un,pwd);
                if(num<0){
                    req.setAttribute("msg","对不起，该用户已存在！");
                    req.getRequestDispatcher("/reg.jsp").forward(req,resp);
                }else if(num>0){
                    req.setAttribute("msg","恭喜你注册成功，请登录！");
                    req.getRequestDispatcher("/index.jsp").forward(req,resp);
                }else if(num == 0){
                    req.setAttribute("msg","对不起，注册失败！");
                    req.getRequestDispatcher("/reg.jsp").forward(req,resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
