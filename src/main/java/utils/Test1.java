package utils;





import bean.Cart;
import com.alibaba.druid.util.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.List;

public class Test1 {

    @Test
    public void testAddUser(){
        try {
            //2.从池子中获取连接
            QueryRunner qr = C3P0Utils.getQueryRunner();
           List<Cart> list= qr.query("select * from cart",new BeanListHandler<>(Cart.class));
            System.out.println(list.size());
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

        }
    }


    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //jdbc:mysql://主机名或IP抵制：端口号/数据库名?useUnicode=true&characterEncoding=UTF-8&useSSL=true
        String URL="jdbc:mysql://39.108.73.162:3306/shop?serverTimezone=GMT%2B8";
        String USER="root";
        String PASSWORD="062821";
        //1.加载驱动
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn= DriverManager.getConnection(URL, USER, PASSWORD);
        //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select * from cart");
        //4.处理数据库的返回结果(使用ResultSet类)
        while(rs.next()) {
            System.out.println(rs.getString("gid")+" "+rs.getString("gnum"));
        }
        //关闭资源
        rs.close();
        st.close();
        conn.close();
    }

}
