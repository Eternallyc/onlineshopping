package web;

import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "UpdataPasswordServlet",urlPatterns = "/back/updatapassword")
public class UpdataPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cid = (String) request.getSession().getAttribute("cname");//得到用户id
        String cpassword = request.getParameter("cpassword");//得到新密码
        try {
            if(new UserDao().updata(cid,cpassword)){
                    //修改密码
                request.getSession().removeAttribute("cname");
                request.getSession().removeAttribute("state");
                response.setContentType("text/html;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.println("<script language=javascript>alert('修改成功');window.location='/back/login.jsp'</script>");
            }else{
                System.out.println("修改失败");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
