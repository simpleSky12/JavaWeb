package biz.impl;

import biz.INewsBiz;
import com.sun.org.apache.bcel.internal.generic.NEW;
import dao.INewsDao;
import dao.impl.NewsDao;
import entity.News;
import util.PageUtil;

import java.util.ArrayList;
import java.util.List;

public class NewsBiz implements INewsBiz {
    private INewsDao newsDao = new NewsDao();
    public List<News> NewsList(){
        return newsDao.NewsList();
    }

    public News getNews(int id){
        return newsDao.getNews(id);
    }

    public String getCategory(int id){
        return newsDao.getCategoryId(id);
    }

// 插入新闻
    public boolean insertNews(News news){
        return newsDao.insertNews(news)>0;
    }

    public boolean delNews(int id){
        return newsDao.delNews(id)>0;
    }

    public boolean deleteNews(int id){
        return newsDao.deleteNews(id)>0;
    }

    public boolean modifyNews(News news){
        return newsDao.modifyNews(news)>0;
    }

    public PageUtil<News> NewsList(int categoryId, String title, int pageNumber, int pageSize){
        List<News> newsList = new ArrayList<News>();
        return newsDao.NewsList(categoryId,title,pageNumber,pageSize);
    }
}
