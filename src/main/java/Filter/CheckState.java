package Filter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 检测是否登录
 */
public class CheckState extends HttpServlet {
    public static Boolean check(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Object state = session.getAttribute("state");
        if("logined".equals(String.valueOf(state))==true){
            return true;
        }else{
            return false;
        }
    }
}
