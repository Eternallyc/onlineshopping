package web;

import bean.Cart;
import bean.Goods;
import dao.CartDao;
import dao.GoodsList;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 实现购物车功能
 */
@SuppressWarnings("unchecked")
@WebServlet(name = "CartServlet", urlPatterns = "/back/cart")
public class CartServlet extends HttpServlet {
    public String IDUONA_CASHTICKET_COOKIE_STARTNAME = "cartgoods_";//充当cookie标记

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Object state = request.getSession().getAttribute("state");
        String flag = request.getParameter("flag");
        String gid = request.getParameter("gid");
        //表示已经登录
        if ("logined".equals(String.valueOf(state)) == true) {
            if ("add".equals(flag)) {
                try {
                    addcart(gid,request);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if ("delete".equals(flag)) {
                try {
                    delete(gid,request);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if ("view".equals(flag)) {
                List<Cart> cartList = null;
                try {
                    cartList = getlist(request);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                request.removeAttribute("cartList");
                request.setAttribute("cartList", cartList);
                request.getRequestDispatcher("shop-cart.jsp").forward(request, response);
            }else if ("deleteall".equals(flag)) {
                try {
                    deleteall(request);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            //如果是更新
            else if("updata".equals(flag)){
                //得到需要修改的数量
                int gnum = Integer.valueOf(request.getParameter("gnum"));
                //获得用户id
                String cid = String.valueOf(request.getSession().getAttribute("cname"));
                try {
                    CartDao.update(cid,gid,gnum);//执行修改操作
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                List<Cart> cartList = null;
                try {
                    cartList = getlist(request);//得到购物车列表
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                int sum = 0;
                for(Cart cart:cartList){
                    sum = sum+cart.getGnum()*cart.getPrice();
                }
                JSONArray jsonarray=null;
                jsonarray=JSONArray.fromObject(sum);
                System.out.println(jsonarray.toString());
                response.getWriter().print(jsonarray.toString());
            }
        } else {//没有登录
            if ("add".equals(flag)) {
                int gnum = Integer.valueOf(request.getParameter("gnum"));
                addCookie(gid, gnum, request, response);//加入购物车
            } else if ("delete".equals(flag)) {
                delete(gid, request, response);//执行删除操作
            } else if ("deleteall".equals(flag)) {
                removeAllCookies(request, response);
            } else if ("view".equals(flag)) {
                List<Cart> cartList = null;
                try {
                    cartList = get(request);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                request.removeAttribute("cartList");
                request.setAttribute("cartList", cartList);
                request.getRequestDispatcher("shop-cart.jsp").forward(request, response);
            }
            else if("updata".equals(flag)){
                int gnum = Integer.valueOf(request.getParameter("gnum"));
                fixCookie(gid,gnum,request,response);
                Cookie[] cookie = request.getCookies();
                int sum = 0;
                for(Cookie cookie1:cookie){
                    if(cookie1.getName().startsWith(IDUONA_CASHTICKET_COOKIE_STARTNAME)){
                        String gid1 = cookie1.getName();
                        String gid2 = gid1.substring(gid1.lastIndexOf("_") + 1);//获得cookie中商品的id
                        Goods goods = new Goods();
                        try {
                            goods = new GoodsList().getsimgle(gid2);//获得商品的详细信息
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        sum = sum+Integer.valueOf(Integer.valueOf(cookie1.getValue())*Integer.valueOf(goods.getPrice()));
                    }
                }
                JSONArray jsonarray=null;
                jsonarray=JSONArray.fromObject(sum);
                System.out.println(jsonarray.toString());
                response.getWriter().print(jsonarray.toString());
                //修改总价cookie
                /*for(Cookie cookie1:cookie){
                    if("TotalPrice".equals(cookie1.getName())){
                        System.out.println("sum的值"+sum);
                        cookie1.setValue(String.valueOf(sum));
                        cookie1.setPath("/");
                        response.addCookie(cookie1);
                    }
                }*/


            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    /**
     * 当用户登录的时候，持久化cookie中的购物车信息，更新为本用户的购物车信息
     */
    public void peristShoppingCartWhenUserLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException {

        Cookie cookies[] = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().startsWith(IDUONA_CASHTICKET_COOKIE_STARTNAME)) {
                    // 获取cookie的名称："iduona_cashTicket_45" 和 cookie的值： "21"
                    String gid1 = c.getName();

                    Integer value = Integer.valueOf(c.getValue());//获得cookie中商品的数量
                    String gid2 = gid1.substring(gid1.lastIndexOf("_") + 1);//获得cookie中商品的id

                    Goods temp = new GoodsList().getsimgle(gid2);//获得该商品的信息

                    Cart cart = new Cart();//创建一个购物车商品的临时对象
                    HttpSession httpSession = request.getSession();
                    String cid = (String) httpSession.getAttribute("cname");//得到用户的id

                    //获取到了商品的信息
                    if (null != temp) {
                        if (CartDao.isExist(cid, gid2)) {
                            // 该商品存在，从购物车中获取该商品的信息，然后进行修改
                            //Cart oldCart =CartDao.get(cid, gid);
                            //oldCart.setGnum(value);//设置商品数量
                            CartDao.update(cid, gid2, value);//直接修改数据库的数量
                        } else {
                            // 否则进行保存记录
                            CartDao.save(cid, gid2, value);
                        }
                    }
                }
            }
            // 移除购物车中所有的商品cookies
            removeAllCookies(request, response);
        }

    }

    /**
     * 登录后查看购物车
     */
    public List<Cart> getlist(HttpServletRequest request) throws SQLException {
        List<Cart> carts = null;//初始化购物车列表
        //获得用户id
        String cname = String.valueOf(request.getSession().getAttribute("cname"));
        //从数据库获取该用户的购物车
        carts = CartDao.getlist(cname);
        for (Cart e : carts) {
            Goods tem = new Goods();
            tem = new GoodsList().getsimgle(e.getGid());//通过购物车的商品id获得商品详细信息
            e.setGweight(tem.getGweight());//设置重量
            e.setGname(tem.getGname());//设置商品名
            e.setGurl(tem.getGurl());//设置图片
            e.setPrice(tem.getPrice());//设置单价
        }
        return carts;
    }
    /**
     * 登录后添加购物车
     */
    public void addcart(String gid,HttpServletRequest request) throws SQLException {
        //获得用户id
        String cid = String.valueOf(request.getSession().getAttribute("cname"));
        if(!CartDao.isExist(cid, gid)){
            CartDao.save(cid,gid,1);
        }
    }

    /**
     * 删除某个商品
     * @param gid
     * @param request
     * @throws SQLException
     */
    public void delete(String gid,HttpServletRequest request)throws  SQLException{
        //获得用户id
        String cid = String.valueOf(request.getSession().getAttribute("cname"));
        CartDao.delete(cid,gid);
    }

    public void deleteall(HttpServletRequest request)throws SQLException{
        //获得用户id
        String cid = String.valueOf(request.getSession().getAttribute("cname"));
        CartDao.deleteall(cid);
    }



    /**
     * 未登录时操作
     *
     * @param
     * @param
     */

    //查看购物车
    public List<Cart> get(HttpServletRequest request) throws SQLException {
        ArrayList<Cart> cartList = new ArrayList<>();//初始化购物车列表
        //List cartList= new LinkedList();
        int jishu = 0;
        Goods goods = new Goods();
        int num = 0;
        Cookie[] cookies = request.getCookies();//得到Cookie列表

        for (Cookie c : cookies) {
            if (c.getName().startsWith(IDUONA_CASHTICKET_COOKIE_STARTNAME)) {
                Cart tem = new Cart();//创建购物车类，用于导入购物车列表
                String gid1 = c.getName();
                Integer value = Integer.valueOf(c.getValue());//获得cookie中商品的数量
                String gid = gid1.substring(gid1.lastIndexOf("_") + 1);//获得cookie中商品的id
                tem.setGid(String.valueOf(gid));
                tem.setGnum(value);
                goods = new GoodsList().getsimgle(gid);//获得商品的详细信息
                tem.setGurl(goods.getGurl());
                tem.setGname(goods.getGname());
                tem.setGweight(goods.getGweight());
                tem.setPrice(goods.getPrice());
                cartList.add(tem);
            }
        }
        return cartList;
    }

    //加入购物车
    public void addCookie(String gid, int value, HttpServletRequest request, HttpServletResponse response) {
        String name = IDUONA_CASHTICKET_COOKIE_STARTNAME + gid;
        Cookie[] cookies = request.getCookies();
        for (Cookie e : cookies) {
            if (e.getName().equals(name)) {
                return;
            }
        }
        Cookie cookie = new Cookie(name, String.valueOf(value));
        cookie.setMaxAge(2 * 60 * 60);// 设置为2个钟
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    //修改商品数量
    public void fixCookie(String gid, int value,HttpServletRequest request,HttpServletResponse response) {
        String name = IDUONA_CASHTICKET_COOKIE_STARTNAME + gid;
        Cookie[] cookies = request.getCookies();
        for (Cookie e : cookies) {
            if (e.getName().equals(name)) {
                //找到该商品Cookie
                System.out.println(e.getName());
                e.setValue(String.valueOf(value));
                e.setPath("/");
                response.addCookie(e);
            }
        }

    }

    //清空购物车
    public void removeAllCookies(HttpServletRequest request, HttpServletResponse response) {
        Cookie cookies[] = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().startsWith(IDUONA_CASHTICKET_COOKIE_STARTNAME)) {
                c.setMaxAge(0);// 设置为0
                c.setPath("/");
                response.addCookie(c);
            }
        }
    }

    //删除购物车中某件商品
    public void delete(String gid, HttpServletRequest request, HttpServletResponse response) {
        Cookie cookies[] = request.getCookies();
        for (Cookie c : cookies) {
            if (c.getName().startsWith(IDUONA_CASHTICKET_COOKIE_STARTNAME + gid)) {//删除某件商品
                c.setMaxAge(0);// 设置为0
                c.setPath("/");
                response.addCookie(c);
            }
        }
    }
}
