package com.storeManagement.mapper;

import com.storeManagement.model.CategoryModel;
import com.storeManagement.model.ProductModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<ProductModel> {
    @Override
    public ProductModel mapRow(ResultSet resultSet) {
        try {
            ProductModel productModel = new ProductModel();
            productModel.setId(resultSet.getInt("product_id"));
            productModel.setProduct_name(resultSet.getString("product_name"));
            productModel.setProduct_price(resultSet.getDouble("product_price"));
            productModel.setCategory_id(resultSet.getInt("category_id"));
            productModel.setImages(resultSet.getString("images"));
            productModel.setRate_point(resultSet.getInt("rate_point"));
            productModel.setProduct_quantity(resultSet.getInt("product_quantity"));
            productModel.setCpu(resultSet.getString("cpu"));
            productModel.setMonitor(resultSet.getString("monitor"));
            productModel.setRam(resultSet.getString("ram"));
            productModel.setRom(resultSet.getString("rom"));
            productModel.setWeight(resultSet.getString("weight"));
            productModel.setColor(resultSet.getString("color"));

//            try {
//                CategoryModel categoryModel = new CategoryModel();
//                categoryModel.setId(resultSet.getInt("category_id"));
//                categoryModel.setCategory_name(resultSet.getString("category_name"));
//                categoryModel.setLogo(resultSet.getString("logo"));
//                productModel.setCategoryModel(categoryModel);
//            } catch (Exception e) {
//                System.out.print(e.getMessage());
//            }
            return productModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
