package bean;

/**
 * 商品的基本信息
 */
public class Goods {

    public String gid;
    public String gurl;

    public String gname;

    public String gweight;
    public int price;
    public int Salesvolume;
    public int Inventory;

    public int getSalesvolume() {
        return Salesvolume;
    }

    public void setSalesvolume(int salesvolume) {
        Salesvolume = salesvolume;
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

    public String getGurl() {
        return gurl;
    }

    public void setGurl(String gurl) {
        this.gurl = gurl;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGweight() {
        return gweight;
    }

    public void setGweight(String gweight) {
        this.gweight = gweight;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }


}
