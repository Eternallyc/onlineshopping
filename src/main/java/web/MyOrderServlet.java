package web;

import bean.OrderInfo;
import dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MyOrderServlet",urlPatterns = "/back/myorder")
public class MyOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<OrderInfo> tol = new ArrayList<>();//得到用户总表
        String cname = String.valueOf(request.getSession().getAttribute("cname"));//得到用户id
        System.out.println(cname);
        List<OrderInfo> old= null;
        List<OrderInfo> newold= null;
        try {
             old = new OrderDao().get(cname);//得到订单表1

            for(OrderInfo e:old){
                //导入总表
                newold = new OrderDao().getmessage(e.getOrderid());
                for(OrderInfo f:newold){
                    OrderInfo orderInfo = new OrderInfo();
                    orderInfo.setOrderid(e.getOrderid());
                    orderInfo.setGid(f.getGid());
                    orderInfo.setGname(f.getGname());
                    orderInfo.setPrice(f.getPrice());
                    orderInfo.setNum(f.getNum());
                    tol.add(orderInfo);

                }
            }
        }catch (SQLException e){

        }
        request.setAttribute("tol",tol);//将表存入
        request.getRequestDispatcher("MyOrder.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }
}
