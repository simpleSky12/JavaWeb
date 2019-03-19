package filter;

import javax.servlet.*;
import java.io.IOException;

public class filterDemo2 implements Filter {

    public filterDemo2(){
        System.out.println("=========filter2实例化=============");
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("=======filter2初始化============");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        filterChain.doFilter(servletRequest,servletResponse);
        System.out.println("==========filter2===========");
    }

    @Override
    public void destroy() {
        System.out.println("=========filter2销毁==========");
    }
}
