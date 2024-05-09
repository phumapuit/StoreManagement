package com.storeManagement.service.impl;

import com.storeManagement.dao.ICategoryDAO;
import com.storeManagement.dao.IProductDAO;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.model.ProductModel;
import com.storeManagement.paging.Pageble;
import com.storeManagement.service.IProductService;

import javax.inject.Inject;
import java.util.List;

public class ProductService implements IProductService {
    @Inject
    private IProductDAO productDAO;
    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<ProductModel> findByCategoryId(Long categoryId) {
        return productDAO.findByCategoryId(categoryId);
    }

    @Override
    public ProductModel save(ProductModel productModel) {
        CategoryModel category = categoryDAO.findOneByCategoryId(productModel.getCategory_id());
        productModel.setCategory_id(category.getId());
        Long productId = productDAO.save(productModel);
        return productDAO.findOne(productId);
    }

    @Override
    public ProductModel update(ProductModel updateProduct, String productId) {
        CategoryModel category = categoryDAO.findOneByCategoryId(updateProduct.getCategory_id());
        updateProduct.setCategory_id(category.getId());
        productDAO.update(updateProduct, productId);
        return productDAO.findOne(Long.valueOf(productId));
    }

    @Override
    public void delete(long[] ids) {
        for (long id: ids) {
            productDAO.delete(id);
        }
    }

    @Override
    public List<ProductModel> findAll() {
        return productDAO.findAll();
    }

    @Override
    public ProductModel findOne(long id) {
        ProductModel productModel = productDAO.findOne(id);
//        CategoryModel categoryModel = categoryDAO.findOneByCategoryId(productModel.getCategory_id());
//        productModel.setCategory_id(categoryModel.getId());
        return productModel;
    }

    @Override
    public List<ProductModel> searchProductByName(String productName) {
        return productDAO.searchProductByName(productName);
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble, String categoriId, String optionPrice, String productName) {
        return productDAO.findAll(pageble, categoriId, optionPrice, productName);
    }

    @Override
    public Integer getTotalItem(String categoriId, String optionPrice, String productName) {
        return productDAO.getTotalItem(categoriId, optionPrice, productName);
    }

    @Override
    public List<ProductModel> get4ProductByCategoryId(int id) {
        return productDAO.get4ProductByCategoryId(id);
    }

    @Override
    public int getQuantityProductInStock(String productId) {
        return productDAO.getQuantityProductInStock(productId);
    }

}
