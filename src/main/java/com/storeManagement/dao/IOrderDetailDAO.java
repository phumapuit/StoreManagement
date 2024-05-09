package com.storeManagement.dao;

import com.storeManagement.model.OrdersDetailModel;

import java.util.List;

public interface IOrderDetailDAO extends GenericDAO<OrdersDetailModel> {
    List<OrdersDetailModel> findAll();

    List<OrdersDetailModel> getOrderDetailByOrderId(long orderId);

    Long save(OrdersDetailModel ordersDetailModel);

}
