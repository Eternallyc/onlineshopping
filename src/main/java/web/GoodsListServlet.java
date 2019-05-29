package web;

import bean.Goods;
import dao.GoodsList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("unchecked")
@WebServlet(name = "GoodsListServlet",urlPatterns = "/back/goods")
public class GoodsListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsList goodsList = new GoodsList();
        try {
            List<Goods> goods = goodsList.get();
           /* for(Goods e:goods){
                System.out.println(e.getGid());
                System.out.println(e.getGname());
            }*/
            request.setAttribute("goodslist",goods);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
