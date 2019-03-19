package dao;

import entity.News;
import util.PageUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface INewsDao {
    public List<News> NewsList();
    public News getNews(int id);
    public String getCategoryId(int id);
    public int insertNews(News news);
    public int delNews(int id);
    public int modifyNews(News news);
    public int deleteNews(int id);
    public PageUtil<News> NewsList(int categoryId, String title, int pageNumber, int pageSize);
}
