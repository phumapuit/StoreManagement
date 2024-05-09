package com.storeManagement.dao.impl;

import com.storeManagement.dao.IProductDAO;
import com.storeManagement.mapper.ProductMapper;
import com.storeManagement.model.ProductModel;
import com.storeManagement.paging.Pageble;
import org.apache.commons.lang.StringUtils;

import java.util.List;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {
    @Override
    public ProductModel findOne(Long product_id) {
        String sql = "SELECT * FROM product WHERE product_id = ?";
        List<ProductModel> productModels = query(sql, new ProductMapper(), product_id);
        return productModels.isEmpty() ? null : productModels.get(0);
    }

    @Override
    public List<ProductModel> findByCategoryId(Long category_id) {
        return query("SELECT * FROM product WHERE category_id = ?", new ProductMapper(), category_id);
    }

    @Override
    public Long save(ProductModel productModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO product (product_name, product_price, category_id, " +
                "images, rate_point, product_quantity, cpu, monitor, ram, rom, weight, color)");
        sql.append(" VALUES(?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ? )");
        return insert(sql.toString(), productModel.getProduct_name(), productModel.getProduct_price(),
                productModel.getCategory_id(), productModel.getImages(), productModel.getRate_point(),
                productModel.getProduct_quantity(), productModel.getCpu(), productModel.getMonitor(),
                productModel.getRam(), productModel.getRom(), productModel.getWeight(), productModel.getColor());
    }

    @Override
    public void update(ProductModel productModel, String productId) {
        StringBuilder sql = new StringBuilder("UPDATE product SET product_name = ?, product_price = ?,");
        sql.append(" category_id = ?, images = ?, rate_point = ?,");
        sql.append(" product_quantity = ?, cpu = ?, monitor = ?, ram = ?, rom = ?, weight = ?, color = ? WHERE product_id = ?");
        update(sql.toString(), productModel.getProduct_name(), productModel.getProduct_price(),
                productModel.getCategory_id(), productModel.getImages(), productModel.getRate_point(),
                productModel.getProduct_quantity(), productModel.getCpu(), productModel.getMonitor(),
                productModel.getRam(), productModel.getRom(), productModel.getWeight(), productModel.getColor(), productId);
    }

    @Override
    public void delete(long id) {
        update("DELETE FROM product WHERE product_id = ?", id);
    }

    @Override
    public List<ProductModel> findAll() {
        return query("SELECT * FROM product", new ProductMapper());
    }

    @Override
    public List<ProductModel> searchProductByName(String productName) {
        String sql = "SELECT * FROM product WHERE product_name LIKE" + "'%" + productName + "%'" + "LIMIT 5";
        return query(sql, new ProductMapper(), productName);
    }

    @Override
    public List<ProductModel> findAll(Pageble pageble, String categoriId, String optionPrice, String productName) {
        StringBuilder sql = new StringBuilder("select * from product");

        if (productName != null) {
            sql.append(" where product_name like '%" + productName + "%'");
        }

        if (categoriId != null) {
            sql.append(" where category_id = " +categoriId);
        }

        if (optionPrice != null) {
            switch (optionPrice) {
                case "1":
                    sql.append(" and product_price < 10000000 ");
                    break;
                case "2":
                    sql.append(" and product_price >= 10000000 and product_price <= 15000000");
                    break;
                case "3":
                    sql.append(" and product_price >= 15000000 and product_price <= 20000000");
                    break;
                case "4":
                    sql.append(" and product_price >= 20000000 and product_price <= 30000000");
                    break;
                case "5":
                    sql.append(" and product_price >= 30000000 and product_price <= 50000000");
                    break;
                case "6":
                    sql.append(" and product_price > 50000000");
                    break;
                default:
                    sql.append("");
                    break;
            }
        }

        if (pageble.getSorter() != null && StringUtils.isNotBlank(pageble.getSorter().getSortName()) && StringUtils.isNotBlank(pageble.getSorter().getSortBy())) {
            sql.append(" ORDER BY "+pageble.getSorter().getSortName()+" "+pageble.getSorter().getSortBy()+"");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            // lay limit record tu trang thu offset
            sql.append(" limit "+pageble.getOffset()+", "+pageble.getLimit()+"");
        }
        return query(sql.toString(), new ProductMapper());
    }

    public Integer getTotalItem(String categoriId, String optionPrice, String productName) {
        StringBuilder sql = new StringBuilder("select count(*) from product");

        if (productName != null) {
            sql.append(" where product_name like '%" + productName + "%'");
        }

        if (categoriId != null) {
            sql.append(" where category_id = " +categoriId);
        }

        if (optionPrice != null) {
            switch (optionPrice) {
                case "1":
                    sql.append(" and product_price < 10000 ");
                    break;
                case "2":
                    sql.append(" and product_price >= 10000 and product_price <= 15000");
                    break;
                case "3":
                    sql.append(" and product_price >= 15000 and product_price <= 20000");
                    break;
                case "4":
                    sql.append(" and product_price >= 20000 and product_price <= 30000");
                    break;
                case "5":
                    sql.append(" and product_price >= 30000 and product_price <= 50000");
                    break;
                case "6":
                    sql.append(" and product_price > 50000");
                    break;
                default:
                    sql.append("");
                    break;
            }
        }
        return count(sql.toString());
    }

    @Override
    public List<ProductModel> get4ProductByCategoryId(int category_id) {
        return query("SELECT * FROM product WHERE category_id = ? ORDER BY category_id ASC LIMIT 4 ", new ProductMapper(), category_id);
    }

    @Override
    public int getQuantityProductInStock(String productId) {
        List<ProductModel> productModels =  query("select * from product where product_id = ", new ProductMapper(), productId);
        return productModels.isEmpty() ? 0 : productModels.get(0).getProduct_quantity();

    }

}
