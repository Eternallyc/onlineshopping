package utils;





import java.sql.*;

public class Test {
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
