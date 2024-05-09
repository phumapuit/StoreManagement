<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href='<c:url value="/"/>' class="brand-link">
        <img src="<c:url value='/template/web/images/Logo.png'/>" alt="LaptopStore" class="brand-image elevation-3" style="opacity: .8">
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-header"><h4>Quản lý</h4></li>
                <li class="nav-item">
                    <a href="<c:url value='/admin-product?type=list'/>" class="nav-link">
                        <p>Danh sách sản phẩm</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value='/admin-account?type=list'/>" class="nav-link">
                        <p>Danh sách tài khoản</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value='/admin-category?type=list'/>" class="nav-link">
                        <p>Danh sách nhà cung cấp</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="<c:url value='/admin-order?type=list'/>" class="nav-link">
                        <p>Danh sách đơn hàng</p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>