package web;

import bean.Goods;
import dao.SearchDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "SearchServlet",urlPatterns = "/back/search")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword=new String(request.getParameter("keyword").getBytes("iso-8859-1"),"utf-8");
        System.out.println("关键词"+keyword);
        try {
            List<Goods> goodsList =  new SearchDao().get(keyword);
            request.setAttribute("goodsList10",goodsList);
            request.setAttribute("keyword",keyword);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
