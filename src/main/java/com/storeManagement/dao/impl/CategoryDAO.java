package com.storeManagement.dao.impl;

import com.storeManagement.dao.ICategoryDAO;
import com.storeManagement.mapper.CategoryMapper;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;


public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

    @Override
    public List<CategoryModel> findAll() {
        String sql = "SELECT * FROM category ORDER BY category_id ASC";
        return query(sql, new CategoryMapper());
    }

    @Override
    public List<CategoryModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM category");
        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" LIMIT "+pageble.getOffset()+", "+pageble.getLimit()+"");
        }
        return query(sql.toString(), new CategoryMapper());
    }

    @Override
    public CategoryModel findOneByCategoryId(int category_id) {
        String sql = "SELECT * FROM category WHERE category_id = ?";
        List<CategoryModel> category = query(sql, new CategoryMapper(), category_id);
        return category.isEmpty() ? null : category.get(0);
    }

    @Override
    public Long save(CategoryModel categoryModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO category (category_name,logo)");
        sql.append(" VALUES(?, ?)");
        return insert(sql.toString(), categoryModel.getCategory_name(),categoryModel.getLogo() );
    }

    @Override
    public void update(CategoryModel updateCategory, String category_id) {
        StringBuilder sql = new StringBuilder("UPDATE category SET category_name = ?, logo = ? WHERE category_id = ?");
        update(sql.toString(), updateCategory.getCategory_name(), updateCategory.getLogo() , category_id);
    }

    @Override
    public CategoryModel findOne(Long category_id) {
        String sql = "SELECT * FROM category WHERE category_id = ?";
        List<CategoryModel> categoryModels = query(sql, new CategoryMapper(), category_id);
        return categoryModels.isEmpty() ? null : categoryModels.get(0);
    }

    @Override
    public void delete(long id) {
        String sql = "DELETE FROM category WHERE category_id = ?";
        update(sql, id);
    }

    @Override
    public int getTotalItem() {
        String sql = "SELECT count(*) FROM category";
        return count(sql);
    }
}
