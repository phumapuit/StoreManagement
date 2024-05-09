<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <body>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1>Danh sách sản phẩm đã tạo</h1>
                        </div>
                        <div class="col-sm-6">
                            <form class="breadcrumb float-sm-right">
                                <button id="btnAddProduct"
                                        type="button"
                                        class="btn btn-white btn-bold"
                                        style="background-color: lightgray; margin-right: 5px">
                                    Thêm sản phẩm <span><i class="fa fa-trash-o bigger-110 pink"></i></span>
                                </button>

                                <button id="btnDelete"
                                        type="button"
                                        class="btn btn-white btn-bold"
                                        style="background-color: red;">
                                    Xóa sản phẩm <span><i class="fa fa-trash-o bigger-110 pink"></i></span>
                                </button>
                            </form>
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
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Ảnh đại diện</th>
                                            <th>Số lượng</th>
                                            <th>Đơn Giá</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${productDtos}">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.product_name}</td>
                                                <td><img src="<c:url value='/template/web/images/${item.images}'/>"></td>
                                                <td>${item.product_quantity}</td>
                                                <td>${item.product_price}</td>
                                                <td>X</td>
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