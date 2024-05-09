package com.storeManagement.service;

import com.storeManagement.model.ProductModel;
import com.storeManagement.paging.Pageble;

import java.util.List;

public interface IProductService {
    List<ProductModel> findByCategoryId(Long categoryId);
    ProductModel save(ProductModel newModel);
    ProductModel update(ProductModel updateNew, String productId);
    void delete(long[] ids);
    List<ProductModel> findAll();
    ProductModel findOne(long id);
    List<ProductModel> searchProductByName(String productName);
    List<ProductModel> findAll(Pageble pageble, String categoriId, String optionPrice, String productName);
    Integer getTotalItem(String categoryId, String optionPrice, String productName);

    List<ProductModel> get4ProductByCategoryId(int id);

    int getQuantityProductInStock(String productId);
}
