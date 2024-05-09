package com.storeManagement.mapper;
import com.storeManagement.model.CategoryModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoryMapper implements RowMapper<CategoryModel> {

	@Override
	public CategoryModel mapRow(ResultSet resultSet) {
		try {
			CategoryModel category = new CategoryModel();
			category.setId(resultSet.getInt("category_id"));
			category.setCategory_name(resultSet.getString("category_name"));
			category.setLogo(resultSet.getString("logo"));
			return category;
		} catch (SQLException e) {
			return null;
		}
	}
}
