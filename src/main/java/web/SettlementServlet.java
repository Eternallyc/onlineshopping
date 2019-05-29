package web;

import bean.Cart;
import bean.Goods;
import dao.CartDao;
import dao.GoodsList;
import dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

/**
 * 在结算过程中起到判断是否登录
 */

@WebServlet(name = "SettlementServlet",urlPatterns = "/back/settlement")
public class SettlementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int total = Integer.valueOf(request.getParameter("Total"));//得到总价
        Random r = new Random();
        String orderid = "1"+ (r.nextInt(10) + "")+ (r.nextInt(10) + "")+ (r.nextInt(10) + "")+ (r.nextInt(10) + "")+ (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "") + (r.nextInt(10) + "");
        HttpSession session = request.getSession();
        String state = String.valueOf(session.getAttribute("state"));//得到登录状态
        String cid = String.valueOf(session.getAttribute("cname"));//得到用户名
        request.setAttribute("orderid1",orderid);

        List<Cart> cartList=null;
        try {
           cartList = new CartDao().getlist(cid);//得到用户的购物车列表
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if("logined".equals(state)){//如果登录了
            //因为request里面有总价就直接将请求转发到PayView.jsp中
            for(Cart e:cartList){
                try {
                    Goods goods = new GoodsList().getsimgle(e.getGid());//得到商品信息
                    System.out.println("e的"+goods.gname);
                    new OrderDao().saveordermessage(orderid,goods.gid,goods.gname,goods.price,e.gnum);//存入数据库
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
            //清空购物车
            try {
                new CartDao().deleteall(cid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("total",total);
            request.getRequestDispatcher("PayView.jsp").forward(request, response);
        }else{
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script language=javascript>alert('请登录后再操作!');window.location='/back/login.jsp'</script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
