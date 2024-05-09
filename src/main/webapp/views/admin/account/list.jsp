<%@include file="../../../common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <body>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <c:if test="${not empty messageResponse}">
                        <div class="col-sm-2 alert alert-${alert}" id="alert-result">
                                ${messageResponse}
                        </div>
                    </c:if>
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Danh sách tài khoản đã tạo</h1>
                        </div>
                        <div class="col-sm-6">
                            <div class="breadcrumb float-sm-right">
                                <button type="button" class="btn btn-default mr-2" onclick="OpenAtAccountForm()">
                                    Thêm tài khoản
                                </button>

                                <button id="btnDelete" type="button" class="btn btn-white btn-bold" disabled style="background-color: red;">
                                    Xóa tài khoản
                                </button>
                            </div>

                            <!-- /.modal-dialog them nha cung cap-->
                            <form class="breadcrumb float-sm-right" action="<c:url value='/admin-account'/>" id="formSubmitAccount" method="post">
                                <div class="modal fade" id="modal-add-account">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width: 800px;position: absolute;left: 50%;top: 50%;transform: translate(-50%);">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id= "titleAccountName">Thêm tài khoản</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="username"><span class="text-red">(*)</span> Tên tài khoản</label>
                                                    <input type="text" placeholder="Chứa 6 - 16 ký tự và không chứa ký tự đặc biệt" class="form-control" id="username" name="username">
                                                    <p id="username-error" class="text-red validation-text"></p>
                                                </div>
                                                <div class="form-group">
                                                    <label for="password"><span class="text-red">(*)</span> Mật khẩu</label>
                                                    <input type="text" placeholder="Tối thiểu 8 ký tự, ít nhất một chữ cái và một số" class="form-control" id="password" name="password">
                                                    <p id="password-error" class="text-red validation-text"></p>
                                                </div>
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                <button type="button" class="btn btn-primary" id="btnSubmitAccountForm">Lưu thay đổi</button>
                                                <input type="hidden" id="accountId" name="accountId"/>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                </div>
                            </form>
                            <!-- /.modal-dialog them tai khoan-->
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <!-- /.card -->

                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>Tên tài khoản</th>
                                            <th>Mật khẩu</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${users}">
                                            <tr>
                                                <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                                <td>${item.username}</td>
                                                <td>${item.password}</td>
                                                <td>
                                                    <button type="button" id="btnUpdate" class="btn btn-default mr-2" onclick="editAccount(${item.id})">
                                                        Thay đổi mật khẩu cho tài khoản
                                                    </button>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.main-content -->
    </body>
</html>
