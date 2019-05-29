package service;

import bean.User;
import dao.UserDao;

import java.sql.SQLException;

public class UserService {
    public User login(String name, String password) throws SQLException {
        UserDao userdao = null;
        try {
            userdao = new UserDao();
        }catch (Exception e){
            e.printStackTrace();
        }
        return userdao.login(name, password);
    }

    public boolean register(User user) {


        boolean register=false;
        UserDao userDao = new UserDao();
        boolean checkUser = userDao.checkUser(user.getId());
        //2. 如果不存在就将用户信息添加到数据库
        if (checkUser) {
            register = userDao.register(user);
        }
        return register;
    }
}
