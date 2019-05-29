package dao;

import bean.Goods;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import utils.JdbcUtil;
import utils.PageBean;

import java.sql.SQLException;
import java.util.List;

public class BeanDao {
    QueryRunner qr = JdbcUtil.getQueryRunner();
    //得到总商品数
    public int getTotalRows(){
        String sql = "select count(*) from goods";
        Long count = null;
        try {
            count = qr.query(sql, new ScalarHandler<Long>());//ScalarHandler<Long> 泛型中的类型和返回值一致
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }


    public void getAll(PageBean<Goods> pb) {
        int totalCount = getTotalRows();
        pb.setTotalRows(totalCount);//设置商品数

        int index = 0;

        int pageCount = pb.getPageSize();//得到页面行数

        //如果页面数位0或者为空，默认为1
        if (pb.getCurrPage()==0||"".equals(pb.getCurrPage())) {
            pb.setCurrPage(1);
        }//如果当前页面大于总页面
        else if(pb.getCurrPage()>pb.getTotalPage()){
            pb.setCurrPage(pb.getTotalPage());
        }

        String sql = "select * from goods limit ?,?";

        index = (pb.getCurrPage()-1)*pb.getPageSize();//设置起始值


        try {
            List<Goods> goodsList = qr.query(sql, new BeanListHandler<Goods>(Goods.class),index,pageCount);//得到当前页面的列表
            pb.setList(goodsList);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除操作
     * @param gid
     * @throws SQLException
     */
    public void delete(String gid) throws SQLException {
        String sql = "delete from goods where gid = ?";
        qr.update(sql,gid);//执行删除操作
    }
    /**
     * 增加操作
     */
    public void add(String gid,String gname,String gurl,int price,int Salesvolume,int Inventory,String gweight)throws  SQLException{
        System.out.println(gid+"--"+gname+"--"+gurl+"--"+price);
        String sql="insert into goods(gid,gname,gurl,price,Salesvolume,Inventory,gweight) values(?,?,?,?,?,?,?)";
        int row = qr.update(sql,gid,gname,gurl,price,Salesvolume,Inventory,gweight);//加入商品
        if(row>0){
            System.out.println("增加成功");
        }
    }

    /**
     * 更新操作
     *
     */
    public void update(String gid,String gname,String gurl,int price,int Salesvolume,int Inventory,String gweight)throws  SQLException{
        String sql="update goods set gname=?,gurl=?,price=?,Salesvolume=?,Inventory=?,gweight=? where gid=?";
        int row = qr.update(sql,gname,gurl,price,Salesvolume,Inventory,gweight,gid);
        if(row>0){
            System.out.println("更新成功");
        }
    }

    //查询功能
    public boolean check(String gid) throws SQLException {
        String sql = "select * from goods where gid = ?";

        Goods goods = null;
        goods = qr.query(sql,new BeanHandler<Goods>(Goods.class),gid);
        if(goods==null){
            return false;
        }else{
            return true;
        }
    }

}
