package com.storeManagement.service.impl;

import com.storeManagement.dao.impl.OrderDetailDAO;
import com.storeManagement.model.OrdersDetailModel;
import com.storeManagement.service.IOrderDetailService;

import javax.inject.Inject;
import java.util.List;

public class OrderDetailService implements IOrderDetailService {

    @Inject
    private OrderDetailDAO orderDetailDAO;
    @Override
    public void save(OrdersDetailModel ordersDetailModel) {
        orderDetailDAO.save(ordersDetailModel);
    }

    @Override
    public List<OrdersDetailModel> findAll() {
        return orderDetailDAO.findAll();
    }

    @Override
    public List<OrdersDetailModel> getOrderDetailByOrderId(long orderDetailId) {
        return orderDetailDAO.getOrderDetailByOrderId(orderDetailId);
    }

}
