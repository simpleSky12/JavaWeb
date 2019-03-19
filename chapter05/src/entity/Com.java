package entity;

import util.JdbcUtil;

import javax.xml.transform.Result;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Com {
    private Integer id;
    private String  content;
    private String author;
    private Date createDate;
    private int newsId;
    private String ip;
    private int length;

    public int getLength() {
        return length;
    }

    public void setLength(int newsId) {
        ResultSet rs= null;
        try {
            int i = 1;
            rs = JdbcUtil.querySQL("SELECT * FROM `news_comment` WHERE newsId=?",newsId);
            if(rs==null){
                this.length = i;
            }else {
                while (rs.next()){
                    i++;
                }
                this.length = i;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }

    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
