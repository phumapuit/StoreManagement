package com.storeManagement.service.impl;

import com.storeManagement.dao.impl.OrderDAO;
import com.storeManagement.model.OrdersModel;
import com.storeManagement.service.IOrderService;

import javax.inject.Inject;
import java.util.List;

public class OrderService implements IOrderService {

    @Inject
    private OrderDAO orderDAO;
    @Override
    public OrdersModel save(OrdersModel ordersModel) {
        Long orderId = orderDAO.save(ordersModel);
        return orderDAO.getOrderById(orderId);
    }

    @Override
    public List<OrdersModel> findAll() {
        return orderDAO.findAll();
    }

    @Override
    public OrdersModel getOrderById(long id) {
        return orderDAO.getOrderById(id);
    }

    @Override
    public OrdersModel update(OrdersModel ordersModel, int id) {
        orderDAO.update(ordersModel, id);
        return orderDAO.getOrderById(Long.valueOf(id));
    }

    @Override
    public OrdersModel getOrderByTransactionId(String vnpTxnRef) {
        return orderDAO.getOrderByTransactionId(Long.valueOf(vnpTxnRef));
    }


}
