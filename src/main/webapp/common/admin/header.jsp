<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='<c:url value="/admin-product?type=list"/>' class="nav-link">Trang chủ</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='/' class="nav-link">Trang khách hàng</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='<c:url value="/admin-product?type=list"/>' class="nav-link">Sản phẩm</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='<c:url value="/admin-account?type=list"/>' class="nav-link">Tài khoản</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='<c:url value="/admin-category?type=list"/>' class="nav-link">Nhà cung cấp</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='<c:url value="/admin-order?type=list"/>' class="nav-link">Đơn hàng</a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href='<c:url value="/thoat?action=logout"/>' class="nav-link">${USERMODEL.username}. Hôm nay, bạn khỏe không ? Thoát</a>
        </li>
    </ul>
</nav>
<!-- /.navbar -->

