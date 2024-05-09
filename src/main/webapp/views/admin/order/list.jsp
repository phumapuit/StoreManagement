<%@include file="../../../common/taglib.jsp"%>
<c:url var="APIurl" value="/api-order"/>
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
                            <h1>Danh sách đơn đặt hàng hiện tại</h1>
                        </div>
                        <div class="col-sm-6">
                            <!-- /.modal-dialog them nha cung cap-->
                            <form class="breadcrumb float-sm-right" >
                                <div class="modal fade" id="modal-show-orderdetail">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width: 800px;position: absolute;left: 50%;top: 50%;transform: translate(-50%);">
                                            <div class="modal-header">
                                                <h4 class="modal-title" id= "titlename">Danh sách sản phẩm đã đặt</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body" style="overflow-y: scroll;">
                                                <table class="table table-bordered table-striped">
                                                    <thead>
                                                    <tr>
                                                        <th>STT</th>
                                                        <th>Logo</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Số lượng</th>
                                                        <th>Trị giá</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody id="orderDetailsBody">
                                                    <!-- This will be populated dynamically with JavaScript -->
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
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
                                    <table id="example4" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Tên tài khoản</th>
                                            <th>Đơn hàng</th>
                                            <th>Trị giá</th>
                                            <th>Tình trạng thanh toán</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${orders}" varStatus="order">
                                            <tr>
                                                <td>${order.count}</td>
                                                <td>${item.username}</td>
                                                <td>${item.orderId}</td>
                                                <td>${item.totalBill}</td>
                                                <td>${item.status_payment}</td>
                                                <td>
                                                    <button type="button" id="btnUpdate" class="btn btn-default mr-2" onclick="viewOrderDetail(${item.orderId})">
                                                        Xem chi tiết đơn hàng
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
