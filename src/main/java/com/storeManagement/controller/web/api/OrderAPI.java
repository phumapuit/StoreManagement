package com.storeManagement.controller.web.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.storeManagement.exception.InvalidProductQuantityException;
import com.storeManagement.model.*;
import com.storeManagement.service.IOrderDetailService;
import com.storeManagement.service.IOrderService;
import com.storeManagement.service.IProductService;
import com.storeManagement.utils.SessionUtil;
import com.storeManagement.utils.StringUtil;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

@WebServlet(urlPatterns = {"/api-order"})
public class OrderAPI extends HttpServlet {

    @Inject
    private IProductService productService;
    @Inject
    private IOrderService orderService;
    @Inject
    private IOrderDetailService orderDetailService;

    private ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the character encoding and content type
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        List<OrderDetailItem> orderDetailItems = new ArrayList<>();

        try {
            UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            if (null == model) {
                response.sendRedirect(request.getContextPath()+"/dang-nhap?action=login");
            }

            String orderId = request.getParameter("orderId");
            List<OrdersDetailModel> ordersDetailModelList = orderDetailService.getOrderDetailByOrderId(Long.valueOf(orderId));

            if (ordersDetailModelList.size() != 0) {
                for (OrdersDetailModel od : ordersDetailModelList) {
                    OrderDetailItem oi = new OrderDetailItem();
                    ProductModel pm = productService.findOne(od.getProduct_id());
                    oi.setImages(pm.getImages());
                    oi.setProduct_name(od.getProduct_name());
                    oi.setQuantity(String.valueOf(od.getQuantity()));
                    oi.setPrice_quotation(StringUtil.formatCurrency(od.getPrice_quotation()));

                    orderDetailItems.add(oi);
                }
            }
            mapper.writeValue(response.getOutputStream(), orderDetailItems);
        } catch (Exception exception) {
            mapper.writeValue(response.getOutputStream(), exception);
        }

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set the character encoding and content type
        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // Read the JSON data from the request body
        boolean checkQuantity = false;
        try {
             // Read JSON data from the request
             StringBuilder sb = new StringBuilder();
             BufferedReader reader = request.getReader();
             String line;
             while ((line = reader.readLine()) != null) {
                 sb.append(line);
             }

             // Parse JSON data as JSONArray
             JSONArray ordersArray = new JSONArray(sb.toString());
             OrdersDetailModel ordersDetailModel;

             OrdersModel ordersModel = new OrdersModel();
             UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
             ordersModel.setUser_id(model.getId());
             ordersModel = orderService.save(ordersModel);

             // Process each order
             for (int i = 0; i < ordersArray.length(); i++) {
                 JSONObject order = ordersArray.getJSONObject(i);

                if (i == ordersArray.length() - 1) {
                    ordersModel.setSummary_order(Double.valueOf(order.getInt("totalBill")));
                    ordersModel = orderService.update(ordersModel, ordersModel.getId());
                } else {
                    ordersDetailModel = new OrdersDetailModel();
                    ordersDetailModel.setOrder_id(ordersModel.getId());
                    ordersDetailModel.setProduct_id(order.getInt("id"));
                    ordersDetailModel.setProduct_name(order.getString("product_name"));
                    ordersDetailModel.setQuantity(order.getInt("amount"));
                    ordersDetailModel.setPrice_quotation(order.getInt("product_price") * order.getInt("amount"));

                    ProductModel p = productService.findOne(order.getInt("id"));

                    int orderQuantity = order.getInt("amount");
                    int productQuantity = p.getProduct_quantity();

                    // neu so luong dat mua > so luong trong kho thi nem ra loi
                    if (orderQuantity > productQuantity) {
                        checkQuantity = true;
                        throw new IllegalArgumentException(resourceBundle.getString("product_quantity_out_of_stock"));
                    }
                    orderDetailService.save(ordersDetailModel);
                }
             }

             // Send a success response
             mapper.writeValue(response.getOutputStream(), ordersModel);

        } catch (IllegalArgumentException err) {
            if (checkQuantity) {
                throw new InvalidProductQuantityException(resourceBundle.getString("product_quantity_out_of_stock"), err);
            }
            mapper.writeValue(response.getOutputStream(), err.getMessage());
        } catch (Exception e) {
            // If an error occurs, send an error response
            mapper.writeValue(response.getOutputStream(), e.getMessage());
        }
    }

}
