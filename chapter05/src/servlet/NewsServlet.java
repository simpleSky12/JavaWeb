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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import util.PageUtil;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;
import java.io.*;
import java.net.URLEncoder;
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

            News news = new News();
            User user = (User)req.getSession().getAttribute("loginUser");
            news.setAuthor(user.getUserName());
            news.setStatus(1);
            news.setCreateDate(new Date());
            if(ServletFileUpload.isMultipartContent(req)){ // 判断请求是否为上传文件
                ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
                try{
                    List<FileItem> items = upload.parseRequest(req);
                    for(FileItem fileItem : items){
                        //  非文件域文件
                        if(fileItem.isFormField()){
                            if ("title".equals(fileItem.getFieldName())){
                                news.setTitle(fileItem.getString("UTF-8"));
                            }else if("categoryId".equals(fileItem.getFieldName())){
                                news.setCategoryId(Integer.parseInt(fileItem.getString("utf-8")));
                            }else if("summary".equals(fileItem.getFieldName())){
                                news.setSummary(fileItem.getString("utf-8"));
                            }else if("content".equals(fileItem.getFieldName())){
                                news.setContent(fileItem.getString("utf-8"));
                            }
                        }else{
                            // 文件的上传就是利用流进行复制粘贴，我需要 获取上传文件的原来路径，以及目标路径
                            String fileName = fileItem.getName();
                            String path = req.getServletContext().getRealPath("upload");
                            File file = new File(path,fileName);
                            fileItem.write(file);
                            news.setPicPath(fileName);
                        }
                    }
                    String msg = "";
                    if(newsBiz.insertNews(news)){
                        msg = "新闻发布成功";
                    }else{
                        msg = "新闻发布失败";
                    };
                    PrintWriter out = resp.getWriter();
                    out.println("<script>alert('"+msg+"');location='"+req.getContextPath()+"/NewsServlet'</script>");
                    out.close();
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

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

        }else if("download".equals(action)){
            String fileName = req.getParameter("fileName");
            String path = req.getServletContext().getRealPath("/upload");
            File file = new File(path,fileName);
            String  contentType = getServletContext().getMimeType(fileName);//通过文件名中的后缀名来确定文件的格式
            if(contentType==null){
                contentType = "application/octet-stream"; // 文件的通用格式
            }
            resp.setContentType(contentType);
            String fileCN = URLEncoder.encode(file.getName(),"utf-8");// 解决下载后文件名中文乱码
            // 设置response 中的响应头
            resp.addHeader("Content-Disposition","attachment;filename="+fileCN);
            resp.addHeader("Content-Length",""+file.length());
            FileInputStream fis = new FileInputStream(file);
            ServletOutputStream sos = resp.getOutputStream();
            byte[] buf = new byte[1024];
            int len = 0;
            while((len=fis.read(buf))!=-1){
                sos.write(buf,0,len);
            }
            fis.close();
            sos.close();
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
