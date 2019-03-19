package dao;

import entity.News;
import entity.User;

import java.sql.SQLException;

public interface IUserDao {
    public User findUser(String name, String password) throws Exception;
    public User findUser(String name) throws SQLException;
    public int addUser(String name,String password) throws Exception;
}
