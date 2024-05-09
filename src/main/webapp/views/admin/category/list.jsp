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
                            <h1>Danh sách nhà cung cấp đã tạo</h1>
                        </div>
                        <div class="col-sm-6">
                            <div class="breadcrumb float-sm-right">
                                <button type="button" class="btn btn-default mr-2" onclick="OpenAtCategoryForm()">
                                    Thêm nhà cung cấp
                                </button>

                                <button id="btnDelete" type="button" disabled class="btn btn-white btn-bold" style="background-color: red;">
                                    Xóa nhà cung cấp
                                </button>
                            </div>

                            <!-- /.modal-dialog them nha cung cap-->
                            <form class="breadcrumb float-sm-right" action="<c:url value='/admin-category'/>" id="formSubmitCategory" enctype="multipart/form-data" method="post">
                                <div class="modal fade" id="modal-add-category">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width: 800px;position: absolute;left: 50%;top: 50%;transform: translate(-50%);">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id="titleCategoryName">Thêm nhà cung cấp</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="form-group">
                                                    <label for="category_name"><span class="text-red">(*)</span> Tên nhà cung cấp</label>
                                                    <input type="text" placeholder="Tên nhà cung cấp không được để trống" class="form-control" id="category_name" name="category_name">
                                                    <p id="category-error" class="text-red validation-text"></p>
                                                </div>
                                                <div class="form-group">
                                                    <label for="logo"><span class="text-red">(*)</span> Ảnh đại diện <span class="font-italic">(tối đa 10MB)</span></label>
                                                    <div class="input-group">
                                                        <div class="custom-file">
                                                            <input type="file" class="custom-file-input" id="logo" name="logo">
                                                            <label class="custom-file-label" id="logo-label">Choose file</label>
                                                        </div>
                                                    </div>
                                                    <p id="img-error" class="text-red validation-text"></p>
                                                </div>
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                <button type="button" class="btn btn-primary" id="btnSubmitCategoryForm">Lưu thay đổi</button>
                                                <input type="hidden" id="categoryId" name="categoryId"/>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                </div>
                            </form>
                            <!-- /.modal-dialog them nha cung cap-->
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
                                    <table id="example3" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th></th>
                                            <th>Tên nhà cung cấp</th>
                                            <th>Ảnh đại diện</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${categories}">
                                            <tr>
                                                <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                                <td>${item.category_name}</td>
                                                <td><img style="height: 31px; width: 101px" src="<c:url value='/uploads/${item.logo}'/>"></td>
                                                <td>
                                                    <button type="button" id="btnUpdate" class="btn btn-default mr-2" onclick="openUpdateFormCategory(${item.id})">
                                                        Cập nhật thông tin nhà cung cấp
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
        <!-- /.content-wrapper -->
    </body>
</html>