package web;

import dao.BeanDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "OperationServlet",urlPatterns = "/admin/Operation")
public class OperationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gid = request.getParameter("gid");
        String flag = request.getParameter("flag");
        if("delete".equals(flag)){
            try {
                new BeanDao().delete(gid);//执行删除操作
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if("update".equals(flag)){
            String gurl = request.getParameter("gurl");
            String gname = request.getParameter("gname");
            int price = Integer.valueOf(request.getParameter("price"));
            int Salesvolume = Integer.valueOf(request.getParameter("salesvolume"));
            int Inventory = Integer.valueOf(request.getParameter("inventory"));
            String gweight = request.getParameter("gweight");
            try {
                //执行修改商品信息
                new BeanDao().update(gid,gname,gurl,price,Salesvolume,Inventory,gweight);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }else if("add".equals(flag)){
            String gurl = request.getParameter("gurl");
            String gname = request.getParameter("gname");
            int price = Integer.valueOf(request.getParameter("price"));
            int Salesvolume = 0;//销售量初始化为0
            int Inventory = Integer.valueOf(request.getParameter("Inventory"));
            String gweight = request.getParameter("gweight");
            try {
                //执行增加操作
                new BeanDao().add(gid,gurl,gname,price,Salesvolume,Inventory,gweight);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
