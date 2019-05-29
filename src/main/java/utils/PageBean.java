package utils;

import java.util.List;

public class PageBean<Goods> {
    private int currPage;//当前页
    private int pageSize = 10;//设置页面行数
    private int totalPage;//总共页数
    private int totalRows;//总共行数
    private List<Goods> list;

    public int getCurrPage() {
        return currPage;
    }
    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public int getTotalPage() {
        if (totalRows%pageSize==0) {
            totalPage = totalRows/pageSize;
        }else {
            totalPage = totalRows/pageSize+1;
        }
        return totalPage;
    }
    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }
    public int getTotalRows() {
        return totalRows;
    }
    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }
    public List<Goods> getList() {
        return list;
    }
    public void setList(List<Goods> list) {
        this.list = list;
    }
}
