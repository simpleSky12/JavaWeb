package dao.impl;

import dao.IComDao;
import entity.Com;
import util.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ComDao implements IComDao {

    public List<Com> getComments(){
        List<Com> comments = new ArrayList<Com>();
        ResultSet rs = null;
        try {
            rs = JdbcUtil.querySQL("SELECT * FROM `news_comment`");
            while (rs.next()){
                comments.add(fillCom(rs));
            }
            return comments;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }
        return null;
    }

    public int addCom(Com com){
       return JdbcUtil.updateSQL("INSERT INTO `news_comment`(content,author,createDate,`ip`,newsId) VALUES(?,?,?,?,?)",com.getContent(),com.getAuthor(),com.getCreateDate(),com.getIp(),com.getNewsId());
    }

    public Com fillCom(ResultSet rs) throws SQLException {
        Com comment = new Com();
        comment.setId(rs.getInt("id"));
        comment.setAuthor(rs.getString("author"));
        comment.setContent(rs.getString("content"));
        comment.setIp(rs.getString("ip"));
        comment.setNewsId(rs.getInt("newsId"));
        java.sql.Date createDate = rs.getDate("createDate");
        if(createDate != null){
            comment.setCreateDate(new Date(createDate.getTime()));
        }
        return comment;
    }
}
