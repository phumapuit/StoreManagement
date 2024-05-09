package com.storeManagement.controller.admin;
import com.storeManagement.constant.SystemConstant;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.service.ICategoryService;
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

@WebServlet(urlPatterns = {"/admin-category"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class CategoryController extends HttpServlet {
    @Inject
    private ICategoryService categoryService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryModel model = FormUtil.toModel(CategoryModel.class, request);

        if (model.getType().equals(SystemConstant.LIST)) {
            model = null;
        }
        MessageUtil.showMessage(request);

        List<CategoryModel> categoryModelList = categoryService.findAll();

        request.setAttribute(SystemConstant.MODEL, model);
        request.setAttribute("categories", categoryModelList);
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/category/list.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("categoryId");

        // gets values of text fields
        String category_name = request.getParameter("category_name");

        CategoryModel categoryModel = new CategoryModel();

        // save image with server
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        FileUtil.getUploadDirectoryPath(applicationPath);
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + FileUtil.UPLOAD_DIR;
        // creates the save directory if it does not exists
        FileUtil.getUploadDirectoryPath(uploadFilePath);
        String fileName = null;

        // neu la chinh sua, nguoi dung quen up anh thi lay anh cu
        //Get all the parts from request and write it to the file on server
        Part filePart = request.getPart("logo");

        // truong hop tao moi
        if (null == categoryId) {
            fileName = FileUtil.getFileName(filePart);
            filePart.write(uploadFilePath + File.separator + fileName);
        }

        // truong hop cap nhat co id va nguoi dung chon anh
        if (null != categoryId && filePart.getSize() > 0) {
            fileName = FileUtil.getFileName(filePart);
            filePart.write(uploadFilePath + File.separator + fileName);
        }

        // truong hop cap nhat co id va nguoi dung khong chon anh
        if (null != categoryId && filePart.getSize() <= 0) {
            CategoryModel md = categoryService.findOne(Long.valueOf(categoryId));
            fileName = md.getLogo();
        }

        if (!category_name.isEmpty()) {
            categoryModel.setCategory_name(category_name);
        }

        if (!fileName.isEmpty()) {
            categoryModel.setLogo(fileName);
        }

        if(!categoryId.isEmpty()){
            categoryModel =  categoryService.update(categoryModel, categoryId);
        } else {
            categoryModel =  categoryService.save(categoryModel);
        }

        if (String.valueOf(categoryModel.getId()).isEmpty()){
            response.sendRedirect(request.getContextPath()+"/admin-category?type=list&message=error_system&alert=danger");
        } else {
            if(!categoryId.isEmpty()){
                response.sendRedirect(request.getContextPath()+"/admin-category?type=list&message=update_success&alert=success");
            } else {
                response.sendRedirect(request.getContextPath()+"/admin-category?type=list&message=insert_success&alert=success");
            }
        }
    }
}
