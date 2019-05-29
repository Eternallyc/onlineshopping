package web;

import bean.Goods;
import dao.AdminIndexDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 后台周报
 */
@WebServlet(name = "AdminIndexServlet",urlPatterns = "/admin/admin")
public class AdminIndexServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminIndexDao adminIndexDao = new AdminIndexDao();
        System.out.println(request.getLocalName());
        Long collectnum = null;
        int salenum = 0;
        int inventory = 0;
        Long VIPnum =null;
        int tolsalenum = 0;
        int currentProfit = 0;
        int tolprofit = 0;
        try {
            tolsalenum = adminIndexDao.gettolsalenum();//得到总销量
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            tolprofit = adminIndexDao.gettolprofit();//得到总收益
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            currentProfit = adminIndexDao.getcurrentprofit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            collectnum = adminIndexDao.getcollect();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
           salenum = adminIndexDao.getsalenum();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
           inventory = adminIndexDao.getinventory();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            VIPnum = adminIndexDao.getVIPnum();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //得到商品列表
        List<Goods> goodslist =null;
        try {
            goodslist = adminIndexDao.get();
            //进行排序
            Collections.sort(goodslist, new Comparator<Goods>() {
                @Override
                public int compare(Goods o2, Goods o1) {
                    int i = o1.getSalesvolume() - o2.getSalesvolume();
                    if(i == 0){
                        return o1.getInventory() - o2.getInventory();
                    }
                    return i;
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ArrayList<Goods> goodsArrayList = new ArrayList<>();//得到排行榜前5
        for(int i = 0;i < 5;i ++){
            goodsArrayList.add(goodslist.get(i));
        }
        request.setAttribute("tolsalenum",tolsalenum);
        request.setAttribute("tolprofit",tolprofit);
        request.setAttribute("goodsArrayList",goodsArrayList);
        request.setAttribute("collectnum",collectnum);
        request.setAttribute("salenum",salenum);
        request.setAttribute("inventory",inventory);
        request.setAttribute("VIPnum",VIPnum);
        request.setAttribute("currentProfit",currentProfit);
        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
        String riqi = String.valueOf(dateFormat.format(date)).substring(0,10);
        request.setAttribute("date",riqi);
        request.getRequestDispatcher("adminindex.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
