package dao;

import bean.Goods;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.C3P0Utils;

import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("unchecked")

public class GoodsList {
    /**
     * 实现查询数据库中的商品列表
     */
    QueryRunner runner = C3P0Utils.getQueryRunner();
    public List<Goods> get() throws SQLException {
        List<Goods> list = null;
        String sql = "select * from goods";
        list = (List<Goods>) runner.query(sql ,new BeanListHandler<Goods>(Goods.class));
        /**/
        return list;
    }

    public Goods getsimgle(String gid) throws SQLException {
        Goods goods = null;
        String sql = "select * from goods where gid=?";
        //获得单行
        goods = runner.query(sql,new BeanHandler<Goods>(Goods.class),gid);
        return goods;
    }
}
