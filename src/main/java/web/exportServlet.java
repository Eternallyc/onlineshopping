package web;

import bean.Goods;
import dao.GoodsList;
import org.apache.poi.hssf.usermodel.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * 导出EXCEL表
 */
@WebServlet(name = "exportServlet",urlPatterns = "/admin/export")
public class exportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Goods> goodsList = null;
        try {
            goodsList=new GoodsList().get();//得到数据
        } catch (SQLException e) {
            e.printStackTrace();
        }
       //第一步，创建一个webbook，对应一个Excel文件
        HSSFWorkbook wb = new HSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet("商品列表");
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);//表头为0
        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        HSSFCell cell = row.createCell((short) 0);
        cell.setCellValue("商品id");
        cell.setCellStyle(style);
        cell = row.createCell((short) 1);
        cell.setCellValue("商品昵称");
        cell.setCellStyle(style);
        cell = row.createCell((short) 2);
        cell.setCellValue("商品图片地址");
        cell.setCellStyle(style);
        cell = row.createCell((short) 3);
        cell.setCellValue("商品价格");
        cell.setCellStyle(style);
        cell = row.createCell((short) 4);
        cell.setCellValue("商品销售量");
        cell.setCellStyle(style);
        cell = row.createCell((short) 5);
        cell.setCellValue("商品库存量");
        cell.setCellStyle(style);
        cell = row.createCell((short) 6);
        cell.setCellValue("商品重量");
        cell.setCellStyle(style);
        for(int i = 0;i < goodsList.size();i ++){
            row = sheet.createRow((int) i + 1);
            Goods goods = goodsList.get(i);
            row.createCell((short) 0).setCellValue(goods.gid);
            row.createCell((short) 1).setCellValue(goods.gname);
            row.createCell((short) 2).setCellValue(goods.gurl);
            row.createCell((short) 3).setCellValue(goods.price);
            row.createCell((short) 4).setCellValue(goods.Salesvolume);
            row.createCell((short) 5).setCellValue(goods.Inventory);
            row.createCell((short) 6).setCellValue(goods.gweight);
        }
        FileOutputStream fout = new FileOutputStream("C:\\Users\\Public\\Desktop\\商品列表.xls");
        wb.write(fout);
        fout.close();
        System.out.println("创建成功");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }
}
