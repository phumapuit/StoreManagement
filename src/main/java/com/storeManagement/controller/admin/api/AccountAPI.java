package com.storeManagement.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.storeManagement.model.UserModel;
import com.storeManagement.service.IUserService;
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

@WebServlet(urlPatterns = {"/api-account"})
public class AccountAPI extends HttpServlet {

    @Inject
    private IUserService userService;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String accountId = request.getParameter("accountId");

        UserModel userModel =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
        userModel = userService.findOne(Integer.valueOf(accountId));
        mapper.writeValue(response.getOutputStream(), userModel);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        UserModel userModel =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
        userModel = userService.save(userModel);
        mapper.writeValue(response.getOutputStream(), userModel);
    }

    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        UserModel updateUser =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
        //updateUser = userService.update(updateUser);
        mapper.writeValue(response.getOutputStream(), updateUser);
    }

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ObjectMapper mapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        boolean checkDelete = false;

        List<UserModel> userListBeforeDelete = userService.findAll();
        int countElementBeforeDelete = userListBeforeDelete.size();

        UserModel userModel =  HttpUtil.of(request.getReader()).toModel(UserModel.class);
        userService.delete(Arrays.stream(userModel.getIds()).asLongStream().toArray());

        List<UserModel> userListAfterDelete = userService.findAll();
        int countElementAfterDelete = userListAfterDelete.size();

        if (countElementBeforeDelete > countElementAfterDelete) {
            checkDelete = true;
        } else {
            checkDelete = false;
        }

        mapper.writeValue(response.getOutputStream(), checkDelete);

    }
}
