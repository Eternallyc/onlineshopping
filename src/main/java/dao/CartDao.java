package dao;

import bean.Cart;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3P0Utils;

import java.sql.SQLException;
import java.util.List;

public class CartDao {
    //验证是否存在
    public static boolean isExist(String cid,String gid) throws SQLException {
        QueryRunner queryRunner= C3P0Utils.getQueryRunner();
        String sql = "select * from cart where cid=? and gid=?";
        Cart cart = queryRunner.query(sql,new BeanHandler<Cart>(Cart.class),cid,gid);
        if(cart!=null){
            return true;
        }
        return false;
    }
    //执行获得单个数据操作
    public static Cart get(String cid, String gid) throws SQLException {//得到该商品在购物车的情况
        QueryRunner queryRunner= C3P0Utils.getQueryRunner();
        String sql = "select * from cart where cid=? and gid=?";
        Cart cart = queryRunner.query(sql,new BeanHandler<Cart>(Cart.class),cid,gid);
        return cart;
    }
    //获得某个用户的购物车
    public static List<Cart> getlist(String cid) throws SQLException {

        QueryRunner queryRunner= C3P0Utils.getQueryRunner();
        String sql = "select * from cart where cid=?";
        List<Cart> cartlist = queryRunner.query(sql,new BeanListHandler<Cart>(Cart.class),cid);
        return cartlist;
    }
    //执行修改操作
    public static void update(String cid,String gid,int value) throws SQLException{
        QueryRunner queryRunner= C3P0Utils.getQueryRunner();
        String sql = "update cart set gnum=? where cid=? and gid=?";
        queryRunner.update(sql,value,cid,gid);
    }

    //执行插入操作
    public static void save(String cid,String gid ,int value) throws  SQLException{
        ComboPooledDataSource dataSource=new ComboPooledDataSource();
        QueryRunner queryRunner=new QueryRunner(dataSource);
        String sql = "insert into cart(cid,gid,gnum) values(?,?,?)";
        queryRunner.update(sql,cid,gid,value);
    }

    //删除某个商品
    public static void delete(String cid,String gid) throws  SQLException{
        ComboPooledDataSource dataSource=new ComboPooledDataSource();
        QueryRunner queryRunner=new QueryRunner(dataSource);
        String sql = "delete from cart where cid=? and gid=?";
        queryRunner.update(sql,cid,gid);
    }

    //清空商品
    public static void deleteall(String cid) throws  SQLException{
        System.out.println(cid);
        ComboPooledDataSource dataSource=new ComboPooledDataSource();
        QueryRunner queryRunner=new QueryRunner(dataSource);
        String sql = "delete from cart where cid=?";
        queryRunner.update(sql,cid);
    }
}
