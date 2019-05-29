package dao;

import bean.Goods;
import bean.Weekly;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class AdminIndexDao {
    QueryRunner qr = JdbcUtil.getQueryRunner();
    /**
     * 得到收藏数
     */
    public Long getcollect() throws SQLException {
        String sql = "select count(*) from favorite";
        Long count = qr.query(sql, new ScalarHandler<Long>());
        return count;
    }

    /**
     * 得到会员数
     */
    public Long getVIPnum() throws SQLException{
        String sql = "select count(*) from customer";
        Long count = qr.query(sql, new ScalarHandler<Long>());
        return count;
    }

    /**
     * 得到销售量
     * @return
     * @throws SQLException
     */
    public int getsalenum() throws SQLException{
        int count=0;
        List<Goods> list = null;
        String sql = "select * from goods";
        list = (List<Goods>) qr.query(sql ,new BeanListHandler<Goods>(Goods.class));//得到商品列表
        //遍历
        for(Goods e:list){
            count = count +e.getSalesvolume();
        }
        return count;
    }

    /**
     * 得到库存量
     * @return
     * @throws SQLException
     */
    public int getinventory() throws SQLException{
        int count=0;
        List<Goods> list = null;
        String sql = "select * from goods";
        list = (List<Goods>) qr.query(sql ,new BeanListHandler<Goods>(Goods.class));//得到商品列表
        //遍历list
        for(Goods e:list){
            count = count +e.getInventory();
        }
        return count;
    }

    //得到当前收益
    public int getcurrentprofit()throws SQLException{
        int count=0;
        List<Goods> list = null;
        String sql = "select * from goods";
        list = (List<Goods>) qr.query(sql ,new BeanListHandler<Goods>(Goods.class));//得到商品列表
        //遍历list
        for(Goods e:list){
            count = count +e.getPrice()*e.getSalesvolume();//销量和价格
        }
        return count;
    }

    //得到总收益
    public int gettolprofit()throws  SQLException{
        int count=0;
        List<Weekly> list = null;
        String sql = "select * from weekly";
        list = (List<Weekly>) qr.query(sql ,new BeanListHandler<Weekly>(Weekly.class));//得到时报对象
        if(list==null){
            System.out.println("lalala");
        }
        //遍历list
        for(Weekly e:list){
            count = count +e.getProfits();//得到收益
        }
        return count;
    }

    //得到总销量
    public int gettolsalenum()throws SQLException{
        int count=0;
        List<Weekly> list = null;
        String sql = "select * from weekly";
        list = (List<Weekly>) qr.query(sql ,new BeanListHandler<Weekly>(Weekly.class));//得到时报对象
        //遍历list
        for(Weekly e:list){
            count = count +e.getSalenum();//得到销量
        }
        return count;
    }

    //得到商品列表
    public List<Goods> get() throws SQLException {
        List<Goods> list = null;
        String sql = "select * from goods";
        list = (List<Goods>) qr.query(sql ,new BeanListHandler<Goods>(Goods.class));

        return list;
    }
}
