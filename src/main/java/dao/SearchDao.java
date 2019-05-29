package dao;

import bean.Goods;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.JdbcUtil;

import java.sql.SQLException;
import java.util.List;

public class SearchDao {
    QueryRunner qr = JdbcUtil.getQueryRunner();
    public List<Goods> get(String gname) throws SQLException {
        List<Goods> goodsList = null;
        String sql = "select *from goods where gname like ? ";
        goodsList = qr.query(sql,new BeanListHandler<Goods>(Goods.class),"%"+gname+"%");
        return goodsList;
    }
}
