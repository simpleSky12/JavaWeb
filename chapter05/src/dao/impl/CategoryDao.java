package dao.impl;

import dao.ICategoryDao;
import entity.Category;
import util.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao implements ICategoryDao {
    public List<Category> categoryList(){
        List<Category> categories = new ArrayList<Category>();
        try {
            ResultSet rs = JdbcUtil.querySQL("SELECT * FROM `news_category`");
            while (rs.next()){
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                category.setCreateDate(rs.getDate("createDate"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.closeAll();
        }
        return categories;
    }
}
