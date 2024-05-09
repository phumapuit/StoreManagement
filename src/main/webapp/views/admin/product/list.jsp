<%@include file="../../../common/taglib.jsp"%>
<c:set var="category_id" value="${category_id}" />
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
                            <h1>Danh sách sản phẩm đã tạo</h1>
                        </div>
                        <div class="col-sm-6">
                            <div class="breadcrumb float-sm-right">
                                <button type="button" class="btn btn-default mr-2" onclick="OpenAtProductForm()">
                                    Thêm sản phẩm
                                </button>

                                <button id="btnDelete" type="button" disabled class="btn btn-white btn-bold" style="background-color: red;">
                                    Xóa sản phẩm
                                </button>
                            </div>
                            <!-- /.modal-dialog them san pham-->
                            <form class="breadcrumb float-sm-right" action="<c:url value='/admin-product'/>" enctype="multipart/form-data" id="formSubmitProduct" method="post">
                                <div class="modal fade" id="modal-add-product">
                                    <div class="modal-dialog">
                                        <div class="modal-content" style="width: 800px;position: absolute;left: 50%;top: 50%;transform: translate(-50%);">
                                            <div class="modal-header">
                                                    <h4 class="modal-title" id="titleProductForm">Thêm sản phẩn</h4>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="category_id"><span class="text-red">(*)</span> Tên nhà cung cấp</label>
                                                            <select name="category_id" id="category_id" class="form-control">
                                                                <c:forEach var="item" items="${categories}">
                                                                    <option value="${item.key}">${item.value}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="cpu"><span class="text-red">(*)</span> CPU</label>
                                                            <input type="text" placeholder="Vd: Apple M1" class="form-control" id="cpu" name="cpu">
                                                            <p id="cpu-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="product_name"><span class="text-red">(*)</span> Tên sản phẩm</label>
                                                            <input type="text" placeholder="Vd: MacBook Air M1 2020" class="form-control" id="product_name" name="product_name">
                                                            <p id="product-name-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="monitor"><span class="text-red">(*)</span> Kích thước màn hình</label>
                                                            <input type="text" placeholder="Vd: 13.3'(2560 x 1600) Retina" class="form-control" id="monitor" name="monitor">
                                                            <p id="monitor-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label><span class="text-red">(*)</span> Ảnh đại diện <span class="font-italic" style="font-size: 12px">(Tối đa 10MB)</span>  </label>
                                                            <div class="input-group">
                                                                <div class="custom-file">
                                                                    <input type="file" class="custom-file-input" id="logo" name="logo">
                                                                    <label class="custom-file-label" id="logo-label">Choose file</label>
                                                                </div>
                                                            </div>
                                                            <p id="img-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="ram"><span class="text-red">(*)</span> RAM</label>
                                                            <select name="ram" id="ram" class="form-control">
                                                                <c:forEach var="item" items="${RAM}">
                                                                    <option value="${item}">${item} DDR5-5600 SO-DIMM *2</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="product_price"><span class="text-red">(*)</span> Giá bán</label>
                                                            <input type="text" placeholder="Vd: 10,000,000" class="form-control" id="product_price" name="product_price">
                                                            <p id="product-price-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="rom"><span class="text-red">(*)</span> ROM</label>
                                                            <select name="rom" id="rom" class="form-control">
                                                                <c:forEach var="item" items="${ROM}">
                                                                    <option value="${item}">${item} PCIe® 4.0 NVMe™ M.2 Performance SSD</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="product_quantity"><span class="text-red">(*)</span> Số lượng trong kho</label>
                                                            <input type="text" placeholder="Vd: 100" class="form-control" id="product_quantity" name="product_quantity">
                                                            <p id="product-quantity-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="weight"><span class="text-red">(*)</span> Khối lượng</label>
                                                            <input type="text" placeholder="Vd: 1.5kg" class="form-control" id="weight" name="weight">
                                                            <p id="weight-error" class="text-red validation-text"></p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="rate_point"><span class="text-red">(*)</span> Điểm đánh giá</label>
                                                            <select name="rate_point" id="rate_point" class="form-control">
                                                                <option value="1">1</option>
                                                                <option value="2">2</option>
                                                                <option value="3">3</option>
                                                                <option value="4">4</option>
                                                                <option value="5">5</option>
                                                                <option value="6">6</option>
                                                                <option value="7">7</option>
                                                                <option value="8">8</option>
                                                                <option value="9">9</option>
                                                                <option value="10">10</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="form-group">
                                                            <label for="color"><span class="text-red">(*)</span> Màu sắc</label>
                                                            <select name="color" id="color" class="form-control">
                                                                <c:forEach var="item" items="${COLOR}">
                                                                    <option value="${item}">${item}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer justify-content-between">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                <button type="submit" class="btn btn-primary" id="btnSubmitProductForm">Lưu thay đổi</button>
                                                <input type="hidden" id="productId" name="productId" />
                                            </div>
                                        </div>
                                <!-- /.modal-content -->
                                    </div>
                                </div>
                            </form>
                    <!-- /.modal-dialog them san pham moi-->
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
                                            <th></th>
                                            <th>Tên sản phẩm</th>
                                            <th>Ảnh đại diện</th>
                                            <th>Số lượng</th>
                                            <th>Đơn Giá</th>
                                            <th>Thao tác</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${products}">
                                            <tr>
                                                <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                                <td>${item.product_name}</td>
                                                <td><img style="height: 20%;width: 20%;" src="<c:url value='/uploads/${item.images}'/>"></td>
                                                <td>${item.product_quantity}</td>
                                                <td>${item.product_price}</td>
                                                <td>
                                                    <button type="button" id="btnUpdate" class="btn btn-default mr-2" onclick="getProductById(${item.id})">
                                                        Cập nhật sản phẩm
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
