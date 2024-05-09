package com.storeManagement.dao.impl;

import com.storeManagement.dao.IOrderDAO;
import com.storeManagement.mapper.OrdersMapper;
import com.storeManagement.model.OrdersModel;

import java.util.List;

public class OrderDAO extends AbstractDAO<OrdersModel> implements IOrderDAO {
    @Override
    public List<OrdersModel> findAll() {
        String sql = "SELECT * FROM orders";
        return query(sql, new OrdersMapper());
    }

    @Override
    public OrdersModel getOrderById(long orderid) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        List<OrdersModel> ordersModelList = query(sql, new OrdersMapper(), orderid);
        return ordersModelList.isEmpty() ? null : ordersModelList.get(0);
    }

    @Override
    public Long save(OrdersModel ordersModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO orders (user_id,summary_order, vnp_TxnRef, status_payment)");
        sql.append(" VALUES(?, ?,?, ?)");
        return insert(sql.toString(), ordersModel.getUser_id(),0.0,"", 0);
    }

    public void update(OrdersModel ordersModel, int id) {
        if (0 != ordersModel.getSummary_order()) {
            String sql = "UPDATE orders SET summary_order = ? WHERE order_id = ?";
            update(sql.toString(), ordersModel.getSummary_order(), id);
        }

        if (ordersModel.getVnp_TxnRef() != null && !ordersModel.getVnp_TxnRef().trim().isEmpty() && !ordersModel.getVnp_TxnRef().trim().isBlank()) {
            String sql = "UPDATE orders SET vnp_TxnRef = ? WHERE order_id = ?";
            update(sql.toString(), ordersModel.getVnp_TxnRef(), id);
        }

        if (0 != ordersModel.getStatus_payment()) {
            String sql = "UPDATE orders SET status_payment = ? WHERE order_id = ?";
            update(sql.toString(), ordersModel.getStatus_payment(), id);
        }

    }

    @Override
    public OrdersModel getOrderByTransactionId(Long vnp_TxnRef) {
        String sql = "SELECT * FROM orders WHERE vnp_TxnRef = ?";
        List<OrdersModel> ordersModelList = query(sql, new OrdersMapper(), vnp_TxnRef);
        return ordersModelList.isEmpty() ? null : ordersModelList.get(0);
    }
}
