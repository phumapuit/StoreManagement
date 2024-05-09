package com.storeManagement.controller.web;

import com.google.gson.Gson;
import com.storeManagement.constant.SystemConstant;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.model.ProductModel;
import com.storeManagement.paging.PageRequest;
import com.storeManagement.paging.Pageble;
import com.storeManagement.service.ICategoryService;
import com.storeManagement.service.IProductService;
import com.storeManagement.sort.Sorter;
import com.storeManagement.utils.FileUtil;
import com.storeManagement.utils.FormUtil;
import com.storeManagement.utils.MessageUtil;
import com.storeManagement.utils.StringUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/san-pham"})
public class ProductController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Inject
    private ICategoryService categoryService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            ProductModel model = FormUtil.toModel(ProductModel.class, request);
            String view = "";

            if (model.getType().equals(SystemConstant.LIST)) {
                String categoryId = request.getParameter("category_id");
                String optionPrice = request.getParameter("optionPrice");
                String searchName = request.getParameter("searchName");

                Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
                        new Sorter(model.getSortName(), model.getSortBy()));
                try {
                    List<ProductModel> productModels = productService.findAll(pageble, categoryId, optionPrice, searchName);
                    if (productModels.isEmpty() || productModels == null){
                        view = "/views/web/404.jsp";
                    } else {
                        model.setListResult(productModels);
                        model.setTotalItem(productService.getTotalItem(categoryId, optionPrice, searchName));
                        model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getMaxPageItem()));

                        request.setAttribute("currentPage", request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page")));
                        request.setAttribute("currentOptionPrice", request.getParameter("optionPrice") == null ? 0 : Integer.parseInt(request.getParameter("optionPrice")));
                        request.setAttribute("searchName", request.getParameter("searchName") == null ? "" : request.getParameter("searchName"));

                        request.setAttribute("sortName", request.getParameter("sortName") == null ? "product_name" : request.getParameter("sortName"));
                        request.setAttribute("sortBy", request.getParameter("sortBy") == null ? "asc" : request.getParameter("sortBy"));

                        view = "/views/web/listproduct.jsp";

                    }
                } catch(Exception e) {
                    view = "/views/web/404.jsp";
                }

            }

            if (model.getType().equals(SystemConstant.ONE)) {
                String productId = request.getParameter("productId");
                try {
                    model = productService.findOne(Long.valueOf(productId));
                    request.setAttribute("productId", productId);
                    request.setAttribute("price", String.valueOf(model.getProduct_price()));

                    List<ProductModel> productList = productService.get4ProductByCategoryId(model.getCategory_id());

                    request.setAttribute("productList", productList);

                    CategoryModel category = categoryService.findOne(model.getCategory_id());
                    request.setAttribute("category_name", category.getCategory_name());

                    view = "/views/web/product.jsp";
                }
                catch(Exception e) {
                    view = "/views/web/404.jsp";
                }

            }

            request.setAttribute(SystemConstant.MODEL, model);

            List<CategoryModel> categories = categoryService.findAll();
            request.setAttribute("categories", categories);
            request.setAttribute("category_id", request.getParameter("category_id") == null ? 1 : request.getParameter("category_id"));

            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
        }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("productId");
        ProductModel productModel = new ProductModel();

        // Retrieve form parameters
        String category_id = request.getParameter("category_id");
        String product_name = request.getParameter("product_name");
        String product_price = request.getParameter("product_price");
        String rate_point = request.getParameter("rate_point");
        String product_quantity = request.getParameter("product_quantity");
        String cpu = request.getParameter("cpu");
        String monitor = request.getParameter("monitor");
        String ram = request.getParameter("ram");
        String rom = request.getParameter("rom");
        String weight = request.getParameter("weight");
        String color = request.getParameter("color");

        // Handle file upload
        String fileName = null;
        Part filePart = request.getPart("logo");
        if (filePart != null && filePart.getSize() > 0) {
            fileName = FileUtil.getFileName(filePart);
            if (fileName != null && !fileName.isEmpty()) {
                try {
                    String applicationPath = request.getServletContext().getRealPath("");
                    String uploadFilePath = applicationPath + File.separator + FileUtil.UPLOAD_DIR;
                    // creates the save directory if it does not exists
                    FileUtil.getUploadDirectoryPath(uploadFilePath);
                    filePart.write(uploadFilePath  + File.separator + fileName);
                    productModel.setImages(fileName);
                } catch (IOException e) {
                    // Handle IOException
                    e.printStackTrace();
                }
            }
        }  else {
            if (!productId.isEmpty()) productModel = productService.findOne(Long.valueOf(productId));
            productModel.setImages(productModel.getImages());
        }

        // Set product details
        if (!category_id.isEmpty()) {
            productModel.setCategory_id(Integer.valueOf(category_id));
        }
        productModel.setProduct_name(product_name);
        if (!product_price.isEmpty()) {
            productModel.setProduct_price(Double.valueOf(product_price));
        }
        if (!rate_point.isEmpty()) {
            productModel.setRate_point(Integer.valueOf(rate_point));
        }
        if (!product_quantity.isEmpty()) {
            productModel.setProduct_quantity(Integer.valueOf(product_quantity));
        }
        productModel.setCpu(cpu);
        productModel.setMonitor(monitor);
        productModel.setRam(ram);
        productModel.setRom(rom);
        productModel.setWeight(weight);
        productModel.setColor(color);

        // Invoke product service method
        if (!productId.isEmpty()) {
            productModel = productService.update(productModel, productId);
        } else {
            productModel = productService.save(productModel);
        }

        // Set response attributes
        if (String.valueOf(productModel.getId()) == null) {
            response.sendRedirect(request.getContextPath()+"/admin-product?type=list&message=error_system&alert=danger");

        } else {
            if (!productId.isEmpty()) {
                response.sendRedirect(request.getContextPath()+"/admin-product?type=list&message=update_success&alert=success");
            } else {
                response.sendRedirect(request.getContextPath()+"/admin-product?type=list&message=insert_success&alert=success");
            }
        }
    }
}
