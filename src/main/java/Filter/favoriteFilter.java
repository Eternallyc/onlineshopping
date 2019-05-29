package Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 对是否登录状态做出判断
 */
@WebFilter(filterName = "favoriteFilter",urlPatterns = {"/back/favorite","/back/updatapassword.jsp"})
public class favoriteFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse= (HttpServletResponse)response;
        boolean charge = CheckState.check(httpRequest,httpServletResponse);
        if (charge!=true){
            httpServletResponse.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script language=javascript>alert('请登录后再操作!');window.location='/back/login.jsp'</script>");
        }else {
            chain.doFilter(request,response);
        }
    }
    public void init(FilterConfig config) throws ServletException {

    }

}
