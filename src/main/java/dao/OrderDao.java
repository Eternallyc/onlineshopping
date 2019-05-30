package dao;

import bean.OrderInfo;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3P0Utils;

import java.sql.SQLException;
import java.util.List;

public class OrderDao {
    QueryRunner qr = C3P0Utils.getQueryRunner();
    //支付成功后保存订单
    public void saveorder(String orderid,String cid,int sum)throws SQLException {
        String sql = "insert into orderid(orderid,cid,sum) values(?,?,?)";
        int row = qr.update(sql,orderid,cid,sum);
    }

    //保存订单详情信息
    public void saveordermessage(String orderid,String gid,String gname,int price,int num) throws SQLException {
        System.out.println(orderid+"---"+gid+"---"+gname);
        String sql ="insert into order_message(orderid,gid,gname,price,num) values(?,?,?,?,?)";
        int row = qr.update(sql,orderid,gid,gname,price,num);
        if(row>0)
        {
            System.out.println("存储成功啦");
        }
    }

    //得到订单
    public List<OrderInfo> get(String cid) throws SQLException {
        String sql = "select * from orderid where cid = ?";
        List<OrderInfo> orderInfoList=qr.query(sql,new BeanListHandler<OrderInfo>(OrderInfo.class),cid);
        return orderInfoList;
    }

    //得到订单详情根据订单id得到
    public List<OrderInfo> getmessage(String orderid) throws SQLException {
        String sql = "select * from order_message where orderid=?";
        List<OrderInfo> orderInfoList=qr.query(sql,new BeanListHandler<OrderInfo>(OrderInfo.class),orderid);
        for(OrderInfo e:orderInfoList){
            System.out.println(e.getGname());
        }
        return orderInfoList;
    }
}
