package com.storeManagement.dao.impl;

import com.storeManagement.dao.IOrderDetailDAO;
import com.storeManagement.mapper.OrdersDetailMapper;
import com.storeManagement.model.OrdersDetailModel;

import java.util.List;

public class OrderDetailDAO extends AbstractDAO<OrdersDetailModel> implements IOrderDetailDAO {
    @Override
    public List<OrdersDetailModel> findAll() {
        String sql = "SELECT * FROM orders_detail";
        return query(sql, new OrdersDetailMapper());
    }

    @Override
    public List<OrdersDetailModel> getOrderDetailByOrderId(long order_id) {
        String sql = "SELECT * FROM orders_detail WHERE order_id = ?";
        List<OrdersDetailModel> ordersDetailModels = query(sql, new OrdersDetailMapper(), order_id);
        return ordersDetailModels.isEmpty() ? null : ordersDetailModels;
    }

    @Override
    public Long save(OrdersDetailModel ordersDetailModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO orders_detail (order_id,product_id,product_name,quantity,price_quotation)");
        sql.append(" VALUES(?, ?,?, ?, ?)");
        return insert(sql.toString(), ordersDetailModel.getOrder_id(),ordersDetailModel.getProduct_id(),ordersDetailModel.getProduct_name(),ordersDetailModel.getQuantity(),ordersDetailModel.getPrice_quotation());
    }

}
