package com.storeManagement.dao;


import com.storeManagement.model.CategoryModel;
import com.storeManagement.paging.Pageble;

import java.util.List;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
    List<CategoryModel> findAll();
    List<CategoryModel> findAll(Pageble pageble);
    CategoryModel findOneByCategoryId(int category_id);

    Long save(CategoryModel categoryModel);
    void update(CategoryModel updateCategory, String category_id);

    CategoryModel findOne(Long newId);

    void delete(long id);

    int getTotalItem();
}
