package web;

import dao.BeanDao;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * 增加商品
 */
@WebServlet(name = "GoodsAddServlet",urlPatterns = "/admin/goodsadd")
public class GoodsAddServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String gid = request.getParameter("gid");
        String flag = request.getParameter("flag");
        JSONArray jsonarray=null;
        if("add".equals(flag)){
            String gname = String.valueOf(request.getParameter("gname"));

            String  gurl = String.valueOf(request.getParameter("gurl"));
            int price = Integer.valueOf(request.getParameter("price"));
            String gweight = (String) request.getParameter("gweight");
            int Salesvolume = 0;
            int inventory = Integer.valueOf(request.getParameter("inventory"));
            System.out.println(gid+"--"+gname+"--"+gurl+"--"+price);
            try {
                //插入操作
                new BeanDao().add(gid,gname,gurl,price,Salesvolume,inventory,gweight);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if("check".equals(flag)){
            try {
                if(new BeanDao().check(gid)){
                    int sum = 1;
                    jsonarray=JSONArray.fromObject(sum);
                    response.getWriter().print(jsonarray.toString());
                }else{
                    int sum = 2;
                    jsonarray=JSONArray.fromObject(sum);
                    response.getWriter().print(jsonarray.toString());
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
