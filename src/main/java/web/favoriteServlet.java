package web;

import bean.Favorite;
import dao.FavoriteDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 收藏功能
 */
@WebServlet(name = "favoriteServlet",urlPatterns = "/back/favorite")
public class favoriteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = request.getParameter("flag");
        if(flag.equals("view")){
            check(request,response);
        }else if(flag.equals("add")){
            try {
                add(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(flag.equals("delete")){
            try {
                delete(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 查看收藏
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void check(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        HttpSession session = request.getSession();
        String cname = String.valueOf(session.getAttribute("cname"));//获得到顾客的id
        FavoriteDao favoriteDao =  new FavoriteDao();
        List<Favorite> list = null;
        try {
            //得到收藏列表
            list= favoriteDao.get(cname);
            request.setAttribute("favoritelist",list);
            request.getRequestDispatcher("favorite.jsp").forward(request, response);
        } catch (SQLException e) {

        }
    }

    //收藏
    public void add(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        String cname = String.valueOf(session.getAttribute("cname"));//获得到顾客的id
        String gid = request.getParameter("gid");//需要添加的商品id
        FavoriteDao favoriteDao =  new FavoriteDao();
        boolean add = favoriteDao.add(cname, gid);//执行添加操作
    }

    //取消收藏
    public void delete(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException{
        HttpSession session = request.getSession();
        String cname = String.valueOf(session.getAttribute("cname"));//获得到顾客的id
        String gid = request.getParameter("gid");//需要删除的商品id
        FavoriteDao favoriteDao =  new FavoriteDao();
        boolean delete = favoriteDao.delete(cname, gid);//执行删除操作
    }
}
