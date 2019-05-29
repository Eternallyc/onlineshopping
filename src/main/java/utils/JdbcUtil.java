package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;

/**
 * 得到dbutils的QueryRunner对象
 */
public class JdbcUtil {
    private static ComboPooledDataSource dataSource;
    static{
        dataSource = new ComboPooledDataSource();
    }

    public static QueryRunner getQueryRunner(){
        return new QueryRunner(dataSource);
    }
}
