package web;

import SMS.Sms;
import bean.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

@WebServlet(name = "UserServlet", urlPatterns = "/back/user")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = request.getParameter("flag");
        if ("reg".equals(flag)) {
            register(request, response);
        } else if ("login".equals(flag)) {
            try {
                login(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if ("vc".equals(flag)) {
            getvcode(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * 注册功能
     *
     * @param request
     * @param response
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("cname");//获取用户名
        String password = request.getParameter("cpassword");//获取密码
        String tel = request.getParameter("ctel");//获取手机号
        System.out.println(name + "----" + password + "---" + tel);
        User user = new User();//建立用户
        user.setId(name);
        user.setPassword(password);
        user.setCtel(tel);
        UserService userService = new UserService();
        boolean register = userService.register(user);//看是否注册成功
        if (register) {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            System.out.println(request.getSession().getAttribute("vc"));
            out.println("<script language=javascript>alert('注册成功');window.location='/back/login.jsp'</script>");
        } else {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script language=javascript>alert('注册失败,该用户已存在！');history.back(-2);</script>");
        }
    }

    /**
     * 登录功能
     *
     * @param request
     * @param response
     */
    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String cname = request.getParameter("cname");
        String cpassword = request.getParameter("cpassword");
        System.out.println(cname + cpassword);
        UserService userService = new UserService();
        User user = null;
        try {
            user = userService.login(cname, cpassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (user != null) {
            String remember = request.getParameter("remember");
            HttpSession session = request.getSession();
            if (remember.equals("yes")) {
                //Cookie保存帐号密码
                Cookie cname1 = new Cookie("cname", cname);
                Cookie cpassword1 = new Cookie("cpassword", cpassword);
                cname1.setMaxAge(60 * 3);//保存3分钟
                cpassword1.setMaxAge(60 * 3);
                response.addCookie(cname1);
                response.addCookie(cpassword1);
            }
            //帐号和登录状态统一用session存
            session.setAttribute("cname", cname);
            session.setAttribute("state", "logined");
            response.sendRedirect(request.getContextPath() + "/back/index.jsp");
            System.out.println("登录成功");
            //更新购物车到用户的信息
            CartServlet cartServlet = new CartServlet();
            cartServlet.peristShoppingCartWhenUserLogin(request,response);
        } else {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script language=javascript>alert('密码错误');window.location='/back/login.jsp'</script>");
        }
    }

    /**
     * 获取验证码功能
     *
     * @param request
     * @param response
     */
    public void getvcode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel = request.getParameter("ctel");
        Random r = new Random();
        String code = (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "");
        Sms vc = new Sms();
        vc.run(tel, code);
        System.out.println(tel + "----" + code);
        PrintWriter pw = response.getWriter();
        pw.write(code);
    }
}
