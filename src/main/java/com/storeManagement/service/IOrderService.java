package com.storeManagement.service;

import com.storeManagement.model.OrdersModel;

import java.util.List;

public interface IOrderService {

    OrdersModel save(OrdersModel ordersModel);
    List<OrdersModel> findAll();
    OrdersModel getOrderById(long id);
    OrdersModel update(OrdersModel ordersModel, int id);

    OrdersModel getOrderByTransactionId(String vnpTxnRef);
}
