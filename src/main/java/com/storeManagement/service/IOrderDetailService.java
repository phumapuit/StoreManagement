package com.storeManagement.service;

import com.storeManagement.model.OrdersDetailModel;

import java.util.List;

public interface IOrderDetailService {
    void save(OrdersDetailModel ordersDetailModel);
    List<OrdersDetailModel> findAll();
    List<OrdersDetailModel> getOrderDetailByOrderId(long orderDetailId);

}
