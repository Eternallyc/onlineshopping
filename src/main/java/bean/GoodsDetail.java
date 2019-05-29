package bean;

public class GoodsDetail {
    public String gid;
    public String gname;
    public int price;
    public String gurl;
    public String descript1;
    public String descript2;
    public String gweight;
    public int Salesvolum;
    public int Inventory;

    public int getSalesvolum() {
        return Salesvolum;
    }

    public void setSalesvolum(int salesvolum) {
        Salesvolum = salesvolum;
    }

    public int getInventory() {
        return Inventory;
    }

    public void setInventory(int inventory) {
        Inventory = inventory;
    }

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getGurl() {
        return gurl;
    }

    public void setGurl(String gurl) {
        this.gurl = gurl;
    }

    public String getDescript1() {
        return descript1;
    }

    public void setDescript1(String descript1) {
        this.descript1 = descript1;
    }

    public String getDescript2() {
        return descript2;
    }

    public void setDescript2(String descript2) {
        this.descript2 = descript2;
    }

    public String getGweight() {
        return gweight;
    }

    public void setGweight(String gweight) {
        this.gweight = gweight;
    }
}
