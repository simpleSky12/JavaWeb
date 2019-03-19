package servlet;

import biz.IComBiz;
import biz.impl.ComBiz;
import entity.Com;
import entity.News;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

public class ComServlet extends HttpServlet {
    private IComBiz comBiz = new ComBiz();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String content = req.getParameter("txt");
        String author = req.getParameter("userName");
        int newsId = Integer.parseInt(req.getParameter("newsId"));

        Date createDate = new Date();
        Com com = new Com();
        com.setCreateDate(createDate);
        com.setAuthor(author);
        com.setContent(content);
        com.setNewsId(newsId);
        com.setLength(newsId);
        String ip = com.getLength()+"楼";
        com.setIp(ip);
        String msg = "";
        if(comBiz.addCom(com)){
            msg = "评论发布成功";
        }else{
            msg = "评论发布失败";
        }

        PrintWriter out = resp.getWriter();
        out.println("<script>alert('"+msg+"');location='"+req.getContextPath()+"/NewsServlet?id="+newsId+"&action=detail'</script>");
        out.close();
    }
}
