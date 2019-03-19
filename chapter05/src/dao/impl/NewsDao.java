package dao.impl;

import com.sun.org.apache.bcel.internal.generic.NEW;
import dao.INewsDao;
import entity.News;
import jdk.nashorn.internal.scripts.JD;
import util.JdbcUtil;
import util.PageUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewsDao implements INewsDao {
    public List<News> NewsList(){
        List<News> newsList = new ArrayList<News>();
        try {
            ResultSet rs = JdbcUtil.querySQL("SELECT * FROM `news_detail`");
            while(rs.next()){
                newsList.add(fillNews(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }
        return newsList;
    }

//    动态条件查询
    public PageUtil<News> NewsList(int categoryId, String title, int pageNumber, int pageSize){
        List<News> newsList = new ArrayList<News>();
        List<Object> params = new ArrayList<Object>();
        String sql = " FROM `news_detail` WHERE `status`=1 ";
        StringBuilder sb = new StringBuilder(sql);
        if(categoryId>0){
//            sql+=" AND categoryId=? ";
            sb.append(" AND categoryId = ? ");
            params.add(categoryId);
        }
        if(title!=null&&!title.isEmpty()){
//            sql+= " AND title LIKE ? ";
            sb.append(" AND title LIKE ? ");
            params.add("%"+title+"%");
        }

        long totalCount = 0;
        try{
            ResultSet rs = JdbcUtil.querySQL("SELECT COUNT(*)"+sb.toString(),params.toArray());
            if(rs.next()){
                totalCount = rs.getLong(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }

        sb.append(" LIMIT ?,? ");
        params.add((pageNumber-1)*pageSize);
        params.add(pageSize);
        try {
            ResultSet rs =JdbcUtil.querySQL("SELECT * "+sb.toString(),params.toArray());
            while(rs.next()){
                newsList.add(fillNews(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            JdbcUtil.closeAll();
        }

        PageUtil<News> newsPage = new PageUtil<News>(newsList,pageNumber,pageSize,totalCount);
        return newsPage;
    }

    public News getNews(int id){
        try {
            ResultSet rs = JdbcUtil.querySQL("SELECT * FROM `news_detail` WHERE id = ?",id);
            if(rs.next()){
                return fillNews(rs);
            }else {
                return null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }
        return null;
    }

    public String getCategoryId(int id){
        ResultSet rs = null;
        String categoryId = null;
        try {
            rs = JdbcUtil.querySQL("SELECT d.*,c.`name` FROM `news_detail` d, news_category c WHERE d.categoryId=c.id AND d.id=?",id);
            if(rs.next()){
                categoryId = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }
        return categoryId;
    }

    public int insertNews(News news){
        return JdbcUtil.updateSQL("INSERT INTO `news_detail`(categoryId,title,summary,content,picPath,author,createDate,status) VALUES(?,?,?,?,?,?,?,?)",news.getCategoryId(),news.getTitle(),news.getSummary(),news.getContent(),news.getPicPath(),news.getAuthor(),news.getCreateDate(),news.getStatus());
    }

//    真删除
    public int delNews(int id){
        return JdbcUtil.updateSQL("DELETE FROM `news_detail` WHERE id=?",id);
    }
//  假删除
    public int deleteNews(int id){
        return JdbcUtil.updateSQL("UPDATE news_detail SET `status`=0 WHERE id=?;",id);
    }

    public int modifyNews(News news){
        return JdbcUtil.updateSQL("UPDATE `news_detail` SET categoryId=?,title=?,summary=?,content=?,author=?,modifyDate=?  WHERE id = ?",news.getCategoryId(),news.getTitle(),news.getSummary(),news.getContent(),news.getAuthor(),news.getModifyDate(),news.getId());
    }

    private News fillNews(ResultSet rs) throws SQLException{
        News news = new News();
        news.setId(rs.getInt("id"));
        news.setCategoryId(rs.getInt("CategoryId"));
        news.setTitle(rs.getString("title"));
        news.setAuthor(rs.getString("author"));
        news.setSummary(rs.getString("summary"));
        news.setContent(rs.getString("content"));
        news.setPicPath(rs.getString("picPath"));
        news.setStatus(rs.getInt("status"));
        java.sql.Date createDate = rs.getDate("createDate");
        if(createDate != null){
            news.setCreateDate(new Date(createDate.getTime()));
        }

        java.sql.Date modifyDate = rs.getDate("modifyDate");
        if(modifyDate!=null){
            news.setModifyDate(new Date(modifyDate.getTime()));
        }
        return news;
    }
}
