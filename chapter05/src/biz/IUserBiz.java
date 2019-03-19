package biz;

import entity.User;


public interface IUserBiz {
    public User login(String userName, String password) throws Exception;
    public int register(String userName,String password) throws Exception;
}