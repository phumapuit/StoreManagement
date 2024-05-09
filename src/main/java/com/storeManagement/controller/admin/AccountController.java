package com.storeManagement.controller.admin;

import com.storeManagement.constant.SystemConstant;
import com.storeManagement.model.UserModel;
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

@WebServlet(urlPatterns = {"/admin-account"})
public class AccountController extends HttpServlet {
    @Inject
    private IUserService userService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel model = FormUtil.toModel(UserModel.class, request);

        if (model.getType().equals(SystemConstant.LIST)) {
            model = null;
        } else if (model.getType().equals(SystemConstant.EDIT)) {
            model = userService.findOne(model.getId());
        }
        MessageUtil.showMessage(request);

        request.setAttribute(SystemConstant.MODEL, model);
        request.setAttribute("users", userService.findAll());
        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/account/list.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accountId = request.getParameter("accountId");

        // gets values of text fields
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserModel userModel = new UserModel();
        if (!username.isEmpty()) {
            userModel.setUsername(username);
        }

        if (!password.isEmpty()) {
            userModel.setPassword(password);
        }

        if(!accountId.isEmpty()){
            userModel =  userService.update(userModel, accountId);
        } else {
            userModel =  userService.save(userModel);
        }

        if (String.valueOf(userModel.getId()).isEmpty()){
            response.sendRedirect(request.getContextPath()+"/admin-account?type=list&message=error_system&alert=danger");

        } else {
            if(!accountId.isEmpty()){
                response.sendRedirect(request.getContextPath()+"/admin-account?type=list&message=update_success&alert=success");
            } else {
                response.sendRedirect(request.getContextPath()+"/admin-account?type=list&message=insert_success&alert=success");
            }
        }
    }
}
