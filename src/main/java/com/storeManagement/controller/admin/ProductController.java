package com.storeManagement.controller.admin;

import com.storeManagement.constant.SystemConstant;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.model.ProductModel;
import com.storeManagement.service.ICategoryService;
import com.storeManagement.service.IProductService;
import com.storeManagement.utils.FileUtil;
import com.storeManagement.utils.FormUtil;
import com.storeManagement.utils.MessageUtil;

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
import java.util.List;
import java.util.ResourceBundle;
import java.util.SortedMap;
import java.util.TreeMap;

@WebServlet(urlPatterns = {"/admin-product"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class ProductController extends HttpServlet {

    @Inject
    private IProductService productService;

    private ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

    @Inject
    private ICategoryService categoryService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductModel model = FormUtil.toModel(ProductModel.class, request);

        String alert = request.getParameter("alert");
        String message = request.getParameter("message");
        if (message != null && alert != null) {
            request.setAttribute("message", resourceBundle.getString(message));
            request.setAttribute("alert", alert);
        }

        if (model.getType().equals(SystemConstant.LIST)) {
            MessageUtil.showMessage(request);

            List<CategoryModel> categoryList = categoryService.findAll();

            SortedMap<String, String> categories = new TreeMap<>();

            for (CategoryModel category : categoryList) {
                categories.put(String.valueOf(category.getId()), category.getCategory_name());
            }

            request.setAttribute("categories", categories);
            request.setAttribute("products", productService.findAll());

            request.setAttribute("COLOR", SystemConstant.COLOR);
            request.setAttribute("RAM", SystemConstant.RAM);
            request.setAttribute("ROM", SystemConstant.ROM);

            RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product/list.jsp");
            rd.forward(request, response);
        }
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
