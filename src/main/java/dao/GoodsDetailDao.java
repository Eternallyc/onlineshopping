package dao;

import bean.GoodsDetail;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 * 从数据库中取出所有个商品的详细信息
 */
@SuppressWarnings("unchecked")
public class GoodsDetailDao {
    public QueryRunner qr = new QueryRunner(new ComboPooledDataSource());
    List<GoodsDetail> goodsdetail=null;
    public List<GoodsDetail> get() throws SQLException {
        String sql = "select * from goods_message";
        goodsdetail = (List<GoodsDetail>) qr.query(sql ,new BeanListHandler<GoodsDetail>(GoodsDetail.class));
        return goodsdetail;
    }
}
