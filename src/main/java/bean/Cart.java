package bean;

/**
 * 购物车类
 */
public class Cart {
    public String cid;
    public String gid;
    public int gnum;
    public String gurl;
    public String gname;
    public int price;

    public int getWeizhi() {
        return weizhi;
    }

    public void setWeizhi(int weizhi) {
        this.weizhi = weizhi;
    }

    public int weizhi;


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

    public void setPrice(int price) {
        this.price = price;
    }

    public String getGweight() {
        return gweight;
    }

    public void setGweight(String gweight) {
        this.gweight = gweight;
    }

    public  String gweight;
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

    public int getGnum() {
        return gnum;
    }

    public void setGnum(int gnum) {
        this.gnum = gnum;
    }


}
