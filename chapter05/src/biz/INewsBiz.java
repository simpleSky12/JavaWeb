package biz;

import entity.News;
import util.PageUtil;

import java.util.List;

public interface INewsBiz {
    public List<News> NewsList();
    public News getNews(int id);
    public String getCategory(int id);
    public boolean insertNews(News news);
    public boolean delNews(int id);
    public boolean modifyNews(News news);
    public boolean deleteNews(int id);
    public PageUtil<News> NewsList(int categoryId, String title, int pageNumber, int pageSize);
}
