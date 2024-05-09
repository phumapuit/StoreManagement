package com.storeManagement.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.storeManagement.model.CategoryModel;
import com.storeManagement.service.ICategoryService;
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

@WebServlet(urlPatterns = {"/api-category"})
public class CategoryAPI extends HttpServlet {

    @Inject
    private ICategoryService categoryService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String categoryId = request.getParameter("categoryId");

        CategoryModel categoryModel =  HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
        categoryModel = categoryService.findOne(Long.valueOf(categoryId));
        mapper.writeValue(response.getOutputStream(), categoryModel);
    }

//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        ObjectMapper mapper = new ObjectMapper();
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json");
//
//        String category_name = request.getParameter("category_name");
//
//        CategoryModel categoryModel =  HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
//        categoryModel.setCategory_name(category_name);
//
//        try {
//            // save image with server
//            // gets absolute path of the web application
//            String applicationPath = request.getServletContext().getRealPath("");
//            FileUtil.getUploadDirectoryPath(applicationPath);
//            // constructs path of the directory to save uploaded file
//            String uploadFilePath = applicationPath + File.separator + FileUtil.UPLOAD_DIR;
//            // creates the save directory if it does not exists
//            FileUtil.getUploadDirectoryPath(uploadFilePath);
//            String fileName = null;
//            //Get all the parts from request and write it to the file on server
//            Part filePart = request.getPart("logo");
//            fileName = FileUtil.getFileName(filePart);
//            filePart.write(uploadFilePath + File.separator + fileName);
//            categoryModel.setLogo(fileName);
//
//        }   catch (Exception ex) {
//
//           ex.printStackTrace();
//        }
//
//        categoryModel = categoryService.save(categoryModel);
//        mapper.writeValue(response.getOutputStream(), categoryModel);
//    }

//    protected void doPut(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        ObjectMapper mapper = new ObjectMapper();
//        request.setCharacterEncoding("UTF-8");
//        response.setContentType("application/json");
//
//        String categoryId = request.getParameter("categoryId");
//
//        CategoryModel updateCategory =  HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
//        updateCategory = categoryService.update(updateCategory, categoryId);
//        mapper.writeValue(response.getOutputStream(), updateCategory);
//    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        boolean checkDelete = false;

        List<CategoryModel> categoryListBeforeDelete = categoryService.findAll();
        int countElementBeforeDelete = categoryListBeforeDelete.size();

        CategoryModel categoryModel =  HttpUtil.of(request.getReader()).toModel(CategoryModel.class);
        categoryService.delete(Arrays.stream(categoryModel.getIds()).asLongStream().toArray());

        List<CategoryModel> categoryListAfterDelete = categoryService.findAll();
        int countElementAfterDelete = categoryListAfterDelete.size();

        if (countElementBeforeDelete != countElementAfterDelete) {
            checkDelete = true;
        }

        mapper.writeValue(response.getOutputStream(), checkDelete);
    }
}
