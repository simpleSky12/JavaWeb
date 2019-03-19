package biz.impl;

import biz.ICategoryBiz;
import dao.ICategoryDao;
import dao.impl.CategoryDao;
import entity.Category;

import java.util.List;

public class CategoryBiz implements ICategoryBiz {
    private ICategoryDao categoryDao = new CategoryDao();
    public List<Category> categoryList(){
        return categoryDao.categoryList();
    }
}
