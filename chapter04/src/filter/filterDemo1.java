package filter;

import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class filterDemo1 implements Filter {
    public filterDemo1(){
        System.out.println("========filter1实例化===========");
    }
    @Override
    public void init(FilterConfig cfg) throws ServletException {
        System.out.println("======filter1初始化=====");
        String encode = cfg.getInitParameter("Encode");
        System.out.println("Filter1=====encode:"+encode);
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("=======filter1请求经过过滤=======");
        chain.doFilter(request,response);
        System.out.println("=====filter1通过过滤=======");

    }

    @Override
    public void destroy() {
        System.out.println("=======filter1销毁======");
    }
}
