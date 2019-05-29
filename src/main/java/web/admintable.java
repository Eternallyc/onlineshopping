package web;

import bean.Goods;
import dao.BeanDao;
import utils.PageBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 后台商品列表
 */
@WebServlet(name = "admintable",urlPatterns = "/admin/admintable")
public class admintable extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String currPage = request.getParameter("currPage");//获取当前页面
        if (currPage == null || "".equals(currPage.trim())){
            currPage = "1";     // 第一次访问，设置当前页为1;
        }
        PageBean<Goods> pb = new PageBean<Goods>();//得到所有页面对象
        pb.setCurrPage(Integer.parseInt(currPage));//设置当前页面
        BeanDao beanDao =new BeanDao();
        beanDao.getAll(pb);
        request.setAttribute("pageBean", pb);
        request.getRequestDispatcher("table.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
