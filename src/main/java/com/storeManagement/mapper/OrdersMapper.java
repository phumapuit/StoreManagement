package com.storeManagement.mapper;

import com.storeManagement.model.OrdersModel;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrdersMapper implements RowMapper<OrdersModel> {
    @Override
    public OrdersModel mapRow(ResultSet resultSet) {
        try {
            OrdersModel orders = new OrdersModel();
            orders.setId(resultSet.getInt("order_id"));
            orders.setUser_id(resultSet.getInt("user_id"));
            orders.setSummary_order(resultSet.getDouble("summary_order"));
            orders.setVnp_TxnRef(resultSet.getString("vnp_TxnRef"));
            orders.setStatus_payment(resultSet.getInt("status_payment"));
            return orders;
        } catch (SQLException e) {
            return null;
        }
    }
}
