package biz.impl;

import biz.IUserBiz;
import dao.IUserDao;
import dao.impl.UserDao;
import entity.User;

public class UserBiz implements IUserBiz {
    private IUserDao userDao = new UserDao();
    public User login(String userName,String password) throws Exception{
//        将传入的用户名和密码传入，调用UserDao中的 findUser方法，
//        再通过JDBCUtil查找数据库，获取用户，创建出user对象
        return userDao.findUser(userName,password);
    }

    @Override
    public int register(String userName, String password) throws Exception {
       User user = userDao.findUser(userName);
       if(user!=null){
           return -1;
       }else{
           int res = userDao.addUser(userName,password);
           if(res>0){
               return 1;
           }else{
               return 0;
           }
       }
    }
}
