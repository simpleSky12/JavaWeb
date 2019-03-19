package servlet;

import java.io.IOException;
import javax.servlet.*;


public class ServletDemo implements Servlet{

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        System.out.println("这是servlet的初始化方法");
    }

    @Override
    public ServletConfig getServletConfig() {
        return null;
    }

    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        System.out.println("提供服务");
    }

    @Override
    public String getServletInfo() {
        return null;
    }

    @Override
    public void destroy() {
        System.out.println("这是servlet的销毁方法");
    }
}
