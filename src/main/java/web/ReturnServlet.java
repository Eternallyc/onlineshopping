package web;

import bean.AlipayConfig;
import bean.OrderInfo;
import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.*;

/**
 * 支付成功后回调地址
 */
@WebServlet(name = "ReturnServlet",urlPatterns = "/back/order")
public class ReturnServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            returnUrl(request,response);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            returnUrl(request,response);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
    }

    public void returnUrl(HttpServletRequest request, HttpServletResponse response) throws AlipayApiException, UnsupportedEncodingException {
        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        //切记alipaypublickey是支付宝的公钥，请去open.alipay.com对应应用下查看。
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        if(signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            request.setAttribute("out_trade_no", out_trade_no);

            request.setAttribute("trade_no", trade_no);

            request.setAttribute("total_amount", total_amount);

            try {
                String cname = String.valueOf(request.getSession().getAttribute("cname"));
                System.out.println(total_amount.substring(0,total_amount.length()-3));
                System.out.println(Integer.valueOf(total_amount.substring(0,total_amount.length()-3)));
                new OrderDao().saveorder(out_trade_no,cname,Integer.valueOf(total_amount.substring(0,total_amount.length()-3)));//保存

                ArrayList<OrderInfo> toll = new ArrayList<>();//得到用户当前表
                List<OrderInfo> old= null;
                try {
                        //导入总表
                        old = new OrderDao().getmessage(out_trade_no);
                        for(OrderInfo e:old){
                            OrderInfo orderInfo = new OrderInfo();
                            orderInfo.setOrderid(out_trade_no);
                            orderInfo.setGname(e.getGname());
                            orderInfo.setGid(e.getGid());
                            orderInfo.setPrice(e.getPrice());
                            orderInfo.setNum(e.getNum());
                            toll.add(orderInfo);
                        }

                }catch (SQLException e){

                }
                request.setAttribute("tol",toll);//将表存入
                try {
                    request.getRequestDispatcher("MyOrder.jsp").forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
