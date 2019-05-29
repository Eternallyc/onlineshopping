package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(filterName = "adminFilter",urlPatterns = "/admin/*")
public class adminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse= (HttpServletResponse)response;
        HttpSession session = httpRequest.getSession();
        Object state = session.getAttribute("adminstate");
        boolean flag=false;
        if (httpRequest.getServletPath().equals("/admin/adminlogin.jsp")){
            flag = true;
        }
        if (httpRequest.getServletPath().equals("/admin/Practice.jsp")){
            flag = true;
        }
        if (httpRequest.getServletPath().equals("/admin/register2")){
            flag = true;
        }
        if (httpRequest.getServletPath().equals("/admin/ajax-validate2")){
            flag = true;
        }
        if (httpRequest.getServletPath().equals("/admin/gt.js")){
            flag = true;
        }
        if (httpRequest.getServletPath().equals("/admin/adminlogin")){
            flag = true;
        }

        if(String.valueOf(state).equals("logined")||flag==true){
            //如果已经登录

            chain.doFilter(request, response);
        }else{
            httpServletResponse.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script language=javascript>alert('请登录后再操作!');window.location='/admin/adminlogin.jsp'</script>");
        }


    }

    public void init(FilterConfig config) throws ServletException {

    }

}
