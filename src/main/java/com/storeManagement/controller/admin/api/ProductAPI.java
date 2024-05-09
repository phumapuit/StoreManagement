package com.storeManagement.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.storeManagement.model.ProductModel;
import com.storeManagement.service.IProductService;
import com.storeManagement.utils.HttpUtil;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(urlPatterns = {"/api-product"})
public class ProductAPI extends HttpServlet {

    @Inject
    private IProductService productService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String productId = request.getParameter("productId");

        ProductModel productModel =  HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        productModel = productService.findOne(Long.valueOf(productId));

        mapper.writeValue(response.getOutputStream(), productModel);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String productName = request.getParameter("productName");

        List<ProductModel> productModels  = productService.searchProductByName(productName);
        mapper.writeValue(response.getOutputStream(), productModels);

    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        boolean checkDelete = false;

        List<ProductModel> productListBeforeDelete = productService.findAll();
        int countElementBeforeDelete = productListBeforeDelete.size();

        ProductModel productModel =  HttpUtil.of(request.getReader()).toModel(ProductModel.class);
        productService.delete(Arrays.stream(productModel.getIds()).asLongStream().toArray());

        List<ProductModel> productListAfterDelete = productService.findAll();
        int countElementAfterDelete = productListAfterDelete.size();

        if (countElementBeforeDelete != countElementAfterDelete) {
            checkDelete = true;
        }
        mapper.writeValue(response.getOutputStream(), checkDelete);
    }
}
