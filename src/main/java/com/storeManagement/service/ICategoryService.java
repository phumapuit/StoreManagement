package com.storeManagement.service;

import com.storeManagement.model.CategoryModel;
import com.storeManagement.paging.Pageble;

import java.util.List;



public interface ICategoryService {

	CategoryModel save(CategoryModel categoryModel);
	CategoryModel update(CategoryModel updateCategory, String idCategory);
	void delete(long[] ids);

	/*Phan trang Category*/
	List<CategoryModel> findAll();
	List<CategoryModel> findAll(Pageble pageble);
	int getTotalItem();
	CategoryModel findOne(long id);
}
