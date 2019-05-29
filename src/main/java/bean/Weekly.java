package bean;

public class Weekly{
    private String date;
    private int collect;
    private int salenum;
    private int inventory;
    private int vipnum;
    private int profits;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCollect() {
        return collect;
    }

    public void setCollect(int collect) {
        this.collect = collect;
    }

    public int getSalenum() {
        return salenum;
    }

    public void setSalenum(int salenum) {
        this.salenum = salenum;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getVipnum() {
        return vipnum;
    }

    public void setVipnum(int vipnum) {
        this.vipnum = vipnum;
    }

    public int getProfits() {
        return profits;
    }

    public void setProfits(int profit) {
        this.profits = profit;
    }

}
