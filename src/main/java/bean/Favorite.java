package bean;

public class Favorite {
    public String cid;
    public String gid;

    public void setPrice(int price) {
        this.price = price;
    }

    public String gurl;
    public String gname;
    public int price;
    public String Inventory;
    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
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

    public int getPrice() {
        return price;
    }

    public String getInventory() {
        return Inventory;
    }

    public void setInventory(String inventory) {
        Inventory = inventory;
    }


}
