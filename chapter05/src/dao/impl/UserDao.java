package dao.impl;

import dao.IUserDao;
import entity.User;
import util.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao implements IUserDao {
    public User findUser(String name,String password) throws Exception{
        ResultSet rs = JdbcUtil.querySQL("SELECT * FROM `news_user` WHERE userName = ? AND `password` = ?",name,password);
        return next(rs);
    }

    // 判断账号是否存在
    public User findUser(String name) throws SQLException {
        ResultSet rs = JdbcUtil.querySQL("SElECT * FROM `news_user` WHERE userName = ?",name);
        return next(rs);
    }

    public int addUser(String name,String password) throws Exception {
        return JdbcUtil.updateSQL("INSERT INTO `news_user`(userName,`password`) VALUE(?,?)",name,password);
        // 返回的是 数据库中受影响的行数，以此判断插入数据是否成功
    }

    public User next(ResultSet rs) throws SQLException {
        if(rs.next()){
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setUserName(rs.getString("userName"));
            user.setPassword(rs.getString("password"));
            user.setEmail(rs.getString("email"));
            user.setType(rs.getInt("userType"));
            return user;
        }
        JdbcUtil.closeAll();
        return null;
    }
}
