package web;

import bean.GoodsDetail;
import dao.GoodsDetailDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;

@WebServlet(name = "GoodsDetailServlet",urlPatterns = "/back/goodsdetail")
public class GoodsDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        GoodsDetailDao goodsDetailDao = new GoodsDetailDao();
        String gid = request.getParameter("gid");
        GoodsDetail one1=null;
        GoodsDetail one2=null;
        GoodsDetail one3=null;
        GoodsDetail one4=null;
        GoodsDetail goodsDetail=null;
        List<GoodsDetail> goodsDetailList=null;
        try {
            goodsDetailList = goodsDetailDao.get();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        int len =goodsDetailList.size();//得到数据库商品的数量
        Random random = new Random();
        int result;
        //得到相关商品ID
        int num=0;
        int nums[]=new int[4];
        while(num!=4){
            result = random.nextInt(len);
            if(result!=Integer.parseInt(gid)){
                boolean flag=false;
                for(int i = 0;i < nums.length;i++){
                    if(result==nums[i]){
                        flag=true;
                    }
                }
                if(!flag){
                    num++;
                    nums[num-1]=result;
                }
            }
        }
        for(int i = 0;i < goodsDetailList.size();i ++){
            //得到相关商品和主商品详情信息
            if(Integer.parseInt(goodsDetailList.get(i).getGid())==nums[0]){
                one1 = goodsDetailList.get(i);
            }
            else if(Integer.parseInt(goodsDetailList.get(i).getGid())==nums[1]){
                one2 = goodsDetailList.get(i);
            }
            else if(Integer.parseInt(goodsDetailList.get(i).getGid())==nums[2]){
                one3 = goodsDetailList.get(i);
            }
            else if(Integer.parseInt(goodsDetailList.get(i).getGid())==nums[3]){

                one4 = goodsDetailList.get(i);
            }
            else if(Integer.parseInt(goodsDetailList.get(i).getGid())==Integer.parseInt(gid)){
                goodsDetail = goodsDetailList.get(i);
            }
        }
        //得到商品的详情信息
        request.setAttribute("goodsDetail",goodsDetail);//保存到request
        request.setAttribute("one1",one1);
        request.setAttribute("one2",one2);
        request.setAttribute("one3",one3);
        request.setAttribute("one4",one4);
        request.getRequestDispatcher("shop-detail.jsp").forward(request,response);//转发
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
