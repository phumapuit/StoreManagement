package com.storeManagement.controller.admin;

import com.storeManagement.constant.SystemConstant;
import com.storeManagement.model.OrderItem;
import com.storeManagement.model.OrdersModel;
import com.storeManagement.model.UserModel;
import com.storeManagement.service.IOrderService;
import com.storeManagement.service.IUserService;
import com.storeManagement.utils.FormUtil;
import com.storeManagement.utils.MessageUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/admin-order"})
public class OrderController extends HttpServlet {
    @Inject
    private IOrderService orderService;

    @Inject
    private IUserService userService;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrdersModel model = FormUtil.toModel(OrdersModel.class, request);

        MessageUtil.showMessage(request);

        List<OrdersModel> ordersModels = orderService.findAll();
        List<OrderItem> orderItemList = new ArrayList<>();
        for (OrdersModel item :ordersModels) {
            OrderItem oi = new OrderItem();
            oi.setTotalBill(String.valueOf(item.getSummary_order()));
            oi.setOrderId(String.valueOf(item.getId()));

            if (item.getStatus_payment() == 0) {
                oi.setStatus_payment("Chưa thanh toán");
            }
            if (item.getStatus_payment() == 1) {
                oi.setStatus_payment("Thanh toán thành công");
            }
            if (item.getStatus_payment() == 2) {
                oi.setStatus_payment("Thanh toán thất bại");
            }

            UserModel userModel = userService.findOne(item.getUser_id());
            oi.setUsername(userModel.getUsername());

            orderItemList.add(oi);
        }

        request.setAttribute(SystemConstant.MODEL, model);
        request.setAttribute("orders", orderItemList);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order/list.jsp");
        rd.forward(request, response);
    }
}
