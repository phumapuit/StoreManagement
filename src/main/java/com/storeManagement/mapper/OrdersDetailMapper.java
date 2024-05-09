package com.storeManagement.mapper;

import com.storeManagement.model.OrdersDetailModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrdersDetailMapper implements RowMapper<OrdersDetailModel> {
    @Override
    public OrdersDetailModel mapRow(ResultSet resultSet) {
        try {
            OrdersDetailModel ordersDetailModel = new OrdersDetailModel();
            ordersDetailModel.setOrder_id(resultSet.getInt("order_id"));
            ordersDetailModel.setProduct_id(resultSet.getInt("product_id"));
            ordersDetailModel.setProduct_name(resultSet.getString("product_name"));
            ordersDetailModel.setQuantity(resultSet.getInt("quantity"));
            ordersDetailModel.setPrice_quotation(resultSet.getDouble("price_quotation"));

            return ordersDetailModel;
        } catch (SQLException e) {
            return null;
        }
    }
}
