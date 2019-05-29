package bean;

public class User implements java.io.Serializable {
    public String ctel;

    public String id;

    public String password;
    public String getCtel() {
        return ctel;
    }
    public void setCtel(String ctel) {
        this.ctel = ctel;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
