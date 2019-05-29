package dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;

/**
 * 完成购物车的数据库操作
 */
public class GoodsCartDao {
    ComboPooledDataSource dataSource=new ComboPooledDataSource();
    QueryRunner queryRunner=new QueryRunner(dataSource);

}
