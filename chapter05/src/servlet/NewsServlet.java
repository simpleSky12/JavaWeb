package servlet;

import biz.ICategoryBiz;
import biz.IComBiz;
import biz.INewsBiz;
import biz.impl.CategoryBiz;
import biz.impl.ComBiz;
import biz.impl.NewsBiz;
import entity.Category;
import entity.Com;
import entity.News;
import entity.User;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import util.PageUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

public class NewsServlet extends HttpServlet {
    private INewsBiz newsBiz = new NewsBiz();
    private ICategoryBiz categoryBiz = new CategoryBiz();
    private IComBiz comBiz = new ComBiz();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if("detail".equals(action)){
            int id = Integer.parseInt(req.getParameter("id"));
            News news = newsBiz.getNews(id);
            String category = newsBiz.getCategory(id);
            List<Com> comments = comBiz.getComments();
            User user = (User) req.getSession().getAttribute("user");
            req.setAttribute("loginUser",user);
            req.setAttribute("news",news);
            req.setAttribute("category",category);
            req.setAttribute("comments",comments);
            req.getRequestDispatcher("/newsDetail.jsp").forward(req,resp);
        }else if("add".equals(action)){
            List<Category> categories = categoryBiz.categoryList();
            req.setAttribute("categories",categories);
            req.getRequestDispatcher("/addnews.jsp").forward(req,resp);
        }else if("addTo".equals(action)){
            News news = fillNews(req);
            news.setCreateDate(new Date());
            String msg = "";
            if(newsBiz.insertNews(news)){
                msg = "新闻发布成功";
            }else{
                msg = "新闻发布失败";
            };
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('"+msg+"');location='"+req.getContextPath()+"/NewsServlet'</script>");
            out.close();
//            News news = new News();
//            news.setCreateDate(new Date());
//            if(ServletFileUpload.isMultipartContent(req)){ // 判断请求是否为上传文件
//                ServletFileUpload upload
//            }

        }else if("modify".equals(action)){
            int id = Integer.parseInt(req.getParameter("id"));
            News news = newsBiz.getNews(id);
            List<Category> categories = categoryBiz.categoryList();
            String categoryName = newsBiz.getCategory(id);
            req.setAttribute("news",news);
            req.setAttribute("id",id);
            req.setAttribute("categoryName",categoryName);
            req.setAttribute("categories",categories);
            req.getRequestDispatcher("/editnews.jsp").forward(req,resp);
        }else if("modifyTo".equals(action)){
            News news = fillNews(req);
            int id = Integer.parseInt(req.getParameter("id"));
            news.setId(id);
            news.setModifyDate(new Date());
            String msg = "";
            if(newsBiz.modifyNews(news)){
                msg = "新闻修改成功";
            }else{
                msg = "新闻修改失败";
            }
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('"+msg+"');location='"+req.getContextPath()+"/NewsServlet'</script>");

        }else if("del".equals(action)){
            int id = Integer.parseInt(req.getParameter("id"));
            String msg = "";
            if(newsBiz.deleteNews(id)){
                msg = "删除成功";
            }else {
                msg="删除失败";
            }
            PrintWriter out = resp.getWriter();
            out.print("<script>alert('"+msg+"');location='"+req.getContextPath()+"/NewsServlet'</script>");
            out.close();
        }else{
            List<Category> categories = categoryBiz.categoryList();
            String title = req.getParameter("title");
            String categoryId = req.getParameter("categoryId");
            String pageNum = req.getParameter("pageNum");
            int id = 0;
            if(categoryId!=null&&!categoryId.isEmpty()){
                id = Integer.parseInt(categoryId);
            }
            int pn = 1;
            if(pageNum!=null && !pageNum.isEmpty()){
                pn = Integer.parseInt(pageNum);
            }
            PageUtil<News> newsPage = newsBiz.NewsList(id,title,pn,5);
            req.setAttribute("newsPage",newsPage);
            req.setAttribute("categories",categories);

            //  参数回显
            req.setAttribute("title",title);
            req.setAttribute("categoryId",categoryId);

            req.getRequestDispatcher("/newsList.jsp").forward(req,resp);
        }
    }

    public News fillNews(HttpServletRequest req){
        String title = req.getParameter("title");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String summary = req.getParameter("summary");
        String content = req.getParameter("content");
        User user = (User)req.getSession().getAttribute("loginUser");
        String author = user.getUserName();
        News news = new News();
        news.setTitle(title);
        news.setCategoryId(categoryId);
        news.setSummary(summary);
        news.setContent(content);
        news.setAuthor(author);
        news.setStatus(1);
        return news;
    }
}
