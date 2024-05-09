package com.storeManagement.dao;

import com.storeManagement.model.ProductModel;
import com.storeManagement.paging.Pageble;

import java.util.List;

public interface IProductDAO extends GenericDAO<ProductModel> {
    ProductModel findOne(Long id);
    List<ProductModel> findByCategoryId(Long categoryId);
    Long save(ProductModel newModel);
    void update(ProductModel updateProduct, String productId);
    void delete(long id);

    List<ProductModel> findAll();

    List<ProductModel> searchProductByName(String productName);

    List<ProductModel> findAll(Pageble pageble, String categoriId, String optionPrice, String productName);

    Integer getTotalItem(String categoryId, String optionPrice, String productName);

    List<ProductModel> get4ProductByCategoryId(int id);

    int getQuantityProductInStock(String productId);
}
