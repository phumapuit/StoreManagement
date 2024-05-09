package com.storeManagement.dao;

import com.storeManagement.model.OrdersModel;

import java.util.List;

public interface IOrderDAO extends GenericDAO<OrdersModel> {
    List<OrdersModel> findAll();

    OrdersModel getOrderById(long id);

    Long save(OrdersModel ordersModel);

    void update(OrdersModel ordersModel, int id);

    OrdersModel getOrderByTransactionId(Long aLong);
}
