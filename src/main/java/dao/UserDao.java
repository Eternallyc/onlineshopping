package dao;

import bean.User;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.JdbcUtil;

import java.sql.SQLException;

/**
 * Created by Administrator on 2017/7/6.
 */
public class UserDao {

    /**
     *
     * @param name
     * @return
     */

    public boolean checkUser(String name){

        try {
            ComboPooledDataSource dataSource=new ComboPooledDataSource();
            QueryRunner queryRunner=new QueryRunner(dataSource);
            String sql="select cid from customer where cid=?";
            User user = queryRunner.query(sql, new BeanHandler<User>(User.class),name);
            //如果没有查询到数据 说明这个用户名没有注册过
            if (user==null) {
                return  true;
            }else {
                return  false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        }

    }
    /**
     * @method:register 用户注册
     * @date: 2017/7/7
     * @params:[name, password, email]
     * @return: boolean
     */

    public boolean register(User user) {
        try {
            ComboPooledDataSource dataSource=new ComboPooledDataSource();
            QueryRunner queryRunner=new QueryRunner(dataSource);
            String sql="insert into customer(cid,cpassword,ctel) values(?,?,?)";
            int row = queryRunner.update(sql, user.getId(), user.getPassword(),user.getCtel());//在登录表进行注册
            //行数大于零说明注册成功
            if (row>0) {
                return  true;
            }else {
                return  false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        }

    }

    /**
     * 用户登录
     * @param name
     * @param password
     * @return
     * @throws SQLException
     */
    public User login(String name, String password) throws SQLException {
        ComboPooledDataSource dataSource=new ComboPooledDataSource();
        QueryRunner queryRunner=new QueryRunner(dataSource);
        String sql="select * from customer where cid=? and cpassword=?";
        return  queryRunner.query(sql, new BeanHandler<User>(User.class),name,password);
    }

    /**
     * 用户修改密码
     */

    public boolean updata(String cid,String password)throws SQLException{
        QueryRunner qr = JdbcUtil.getQueryRunner();
        String sql = "update customer set cpassword = ? where cid = ?";
        int update = qr.update(sql, password, cid);
        if(update>0){
            return true;
        }else{
            return false;
        }
    }
}
