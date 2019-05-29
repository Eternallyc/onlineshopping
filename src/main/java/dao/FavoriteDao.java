package dao;

import bean.Favorite;
import bean.Goods;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

/**
 *完成收藏功能的增删查功能
 */
public class FavoriteDao {
    ComboPooledDataSource dataSource=new ComboPooledDataSource();
    QueryRunner queryRunner=new QueryRunner(dataSource);

    /**
     * 查询功能
     * @param
     * @return
     * @throws SQLException
     */
    public boolean check(String cid,String gid) throws SQLException {
        String sql = "select * from favorite where cid = ? and gid = ?";
        Favorite favorite = queryRunner.query(sql, new BeanHandler<Favorite>(Favorite.class),cid,gid);//执行查询语句
        if(favorite==null){
            return false;//查询到了返回false
        }
        else{
            return true;//没有查询到返回true
        }
    }

    /**
     * 增加功能
     * @param cid
     * @param gid
     * @return
     */
    public boolean add(String cid,String gid) throws SQLException {
        String sql = "insert into favorite(cid,gid,gurl,gname,price,Inventory) values (?,?,?,?,?,?)";
        GoodsList goodsList = new GoodsList();
        //取出整个商品表
        boolean x = check(cid,gid);
        if(x==true){
            return false;
        }
        List<Goods> goods = goodsList.get();
        //forEach进行迭代
        for(Goods e:goods){
            if(Integer.parseInt(e.getGid())==Integer.parseInt(gid)){
                //存取数据
                int row = queryRunner.update(sql,cid,e.getGid(),e.getGurl(),e.getGname(),e.getPrice(),e.getInventory());
                System.out.println("ROW"+row);
                if(row>0){
                    return true;//存取成功
                }else{
                    return false;//存取失败
                }
            }
        }
        return false;
    }

    /**
     * 删除功能
     */
    public boolean delete(String cid,String gid) throws SQLException {
        String sql = "delete from favorite where cid=? and gid=?";
        int row = queryRunner.update(sql,cid,gid);
        if(row>0){
            return true;
        }
        else{
            return false;
        }
    }

    /**
     * 获得收藏列表
     * @param cid
     * @return
     * @throws SQLException
     */
    public List<Favorite> get(String cid) throws SQLException {
        List<Favorite> list = null;
        String sql = "select * from favorite where cid=?";
        list = queryRunner.query(sql,new BeanListHandler<Favorite>(Favorite.class),cid);
        return list;
    }

}
