package com.storeManagement.service.impl;

import com.storeManagement.dao.ICategoryDAO;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.paging.Pageble;
import com.storeManagement.service.ICategoryService;

import javax.inject.Inject;
import java.util.List;

public class CategoryService implements ICategoryService {
	
	@Inject
	private ICategoryDAO categoryDao;

	public List<CategoryModel> findAll() {
		return categoryDao.findAll();
	}

	@Override
	public List<CategoryModel> findAll(Pageble pageble) {
		return categoryDao.findAll(pageble);
	}

	@Override
	public CategoryModel save(CategoryModel categoryModel) {
		Long categoryId = categoryDao.save(categoryModel);
		return categoryDao.findOne(categoryId);
	}

	@Override
	public CategoryModel update(CategoryModel updateCategory, String idCategory) {
		categoryDao.update(updateCategory, idCategory);
		return categoryDao.findOne(Long.valueOf(idCategory));
	}

	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			categoryDao.delete(id);
		}
	}

	@Override
	public int getTotalItem() {
		return categoryDao.getTotalItem();
	}

	@Override
	public CategoryModel findOne(long id) {
		return categoryDao.findOne(id);
	}
}
