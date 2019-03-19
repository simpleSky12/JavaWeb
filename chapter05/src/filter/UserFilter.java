package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String cond = request.getRequestURI();
        if(cond.equals("/chapter05/")||cond.endsWith("UserServlet")||cond.endsWith("reg.jsp")||cond.endsWith("png")||cond.endsWith("index.jsp")){
            filterChain.doFilter(request,response);
        }else{
            HttpSession session = request.getSession();
            if(session.getAttribute("loginUser")!=null){
                filterChain.doFilter(request,response);
            }else{
                request.setAttribute("msg","对不起，请先登录！");
                request.getRequestDispatcher("/index.jsp").forward(request,response);
            }
        }
    }

    @Override
    public void destroy() {

    }
}
