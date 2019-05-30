package dao;

import bean.Manager;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.C3P0Utils;

import java.sql.SQLException;

public class ManageDao {
    QueryRunner qr = C3P0Utils.getQueryRunner();

    public Manager check(String name, String password) throws SQLException {
        String sql = "select * from manage where mid=? and mpassword=?";
        return qr.query(sql, new BeanHandler<Manager>(Manager.class), name, password);
    }
}
