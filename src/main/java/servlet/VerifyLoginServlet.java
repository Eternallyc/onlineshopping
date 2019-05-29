package servlet;

import bean.Manager;
import config.GeetestConfig;
import dao.ManageDao;
import sdk.GeetestLib;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


/**
 * 使用post方式，返回验证结果, request表单中必须包含challenge, validate, seccode
 */
@WebServlet(name="VerifyLoginServlet",urlPatterns = "/admin/ajax-validate2")
public class VerifyLoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key(), 
				GeetestConfig.isnewfailback());
			
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
		
		//从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
		
		//从session中获取userid
		String userid = (String)request.getSession().getAttribute("userid");
		
		int gtResult = 0;

		if (gt_server_status_code == 1) {
			//gt-server正常，向gt-server进行二次验证
				
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);
		} else {
			// gt-server非正常情况下，进行failback模式验证

			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);

		}

		String mid = request.getParameter("mid");
		String mpassword = request.getParameter("mpassword");

		Manager manager = null;
		try {
			manager = new ManageDao().check(mid,mpassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(manager!=null){
			//如果登录成功则转发
			response.setContentType("text/html;charset=utf-8");
			HttpSession session = request.getSession();
			session.setAttribute("adminstate", "logined");
			response.sendRedirect(request.getContextPath() + "/admin/admin");
		}else{
			//如果登录失败
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script language=javascript>alert('密码错误');window.location='/admin/adminlogin.jsp'</script>");
		}
	}
}
