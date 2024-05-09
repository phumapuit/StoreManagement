<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%--header--%>
<section class="myheader" style="background-color: whitesmoke;">
    <div class="container py-3">
        <div class="row align-items-center">
            <div class="col-lg-3 col-md-3 col-sm-4 col-12 p-0">
                <a href='<c:url value="/"/>'>
                    <img src="<c:url value='/template/web/images/Logo.png'/>" alt="Logo" class="img-fluid" />
                </a>
            </div>
            <div class="col-lg-7 col-md-6 col-sm-8 d-none d-sm-block">
                <div class="row align-items-center">
                    <div class="col-lg-8 col-md-12">
                        <div class="input-group mb-2">
                            <input type="text" class="form-control" placeholder="Nhập từ khóa tìm kiếm" id="productNameInput" />
                            <button class="btn btn-outline-secondary" type="button" id="search-button">
                                <i class="fa fa-search" aria-hidden="true"></i>
                            </button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12" style="font-size: 17px;">
                        <div class="row">
                            <div class="col-lg-12 col-sm-6 d-none d-sm-block">
                                <span class="text-danger"><i class="fa-solid fa-phone"></i></span>
                                <a href="tel:(+84) 356111918" class="text-danger text-decoration-none">0356111918</a>
                            </div>
                            <div class="col-lg-12 col-sm-6 d-none d-sm-block pr-0">
                                <span class="text-danger"><i class="fa-solid fa-user"></i></span>
                                <c:if test="${not empty USERMODEL}">
                                    <a id="usernamecart" data-id ="${USERMODEL.id}" class="text-danger text-decoration-none mr-1 font-weight-bold" href='<c:url value="#"/>'>${USERMODEL.username}</a>
                                    <br>
                                    <span class="text-danger"><i class="fa-solid fa-arrow-right-from-bracket"></i></span>
                                    <a class="text-danger text-decoration-none" href='<c:url value="/thoat?action=logout"/>'>Đăng xuất</a>
                                </c:if>
                                <c:if test="${empty USERMODEL}">
                                    <a class="text-danger text-decoration-none" href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập</a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-3 d-xs-none d-none d-md-block">
                <div class="row">
                    <div class="col-4">
                        <a href="#" class="position-relative">
                            <span class="fs-2 text-danger"><i class="fa-solid fa-message" style="font-size: 29px"></i></span>
                        </a>
                    </div>
                    <div class="col-4">
                        <button type="button" id="showCart" class="btn p-0" data-toggle="modal">
                            <i class="fa fa-shopping-cart text-danger" style="font-size: 29px"></i>
                        </button>
                    </div>
                    <div class="col-4">
                        <a href="#" class="position-relative">
                            <span class="fs-2 text-danger"><i class="fa-solid fa-globe" style="font-size: 29px"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="mymainmenu bg-danger text-danger">
    <nav class="navbar navbar-expand-lg justify-content-end container">
        <button type="button" id="showCartResponsive" class="btn p-0 d-md-none mr-2" data-toggle="modal">
            <i class="fa fa-shopping-cart text-white" style="font-size: 29px"></i>
        </button>
        <button class="navbar-toggler bg-white" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon" style="background-color: #dc3545"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarTogglerDemo01">
            <a class="navbar-brand active text-white menu-item-hover" href='<c:url value="/"/>'>Trang chủ</a>
            <ul class="navbar-nav mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link text-white menu-item-hover" href='<c:url value="/gioi-thieu?action=introduce"/>'>Giới thiệu</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white menu-item-hover" href="#" role="button" aria-expanded="false">
                        Sản phẩm
                    </a>
                    <ul class="dropdown-menu">
                        <c:forEach var="item" items="${categories}" varStatus="counter">
                            <li><a class="dropdown-item" href="<c:url value='/san-pham?type=list&category_id=${item.id}&page=1&maxPageItem=20&optionPrice=1&sortName=product_price&sortBy=asc'/>">Laptop ${item.category_name}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white menu-item-hover" aria-disabled="true" href='<c:url value="/cau-hoi-thuong-gap?action=question"/>'>Câu hỏi thường gặp</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white menu-item-hover pr-0" aria-disabled="true" href='<c:url value="/tuyen-dung?action=hiring"/>'>Tuyển dụng</a>
                </li>
            </ul>
        </div>
    </nav>
</section>


<%--navbar--%>
<%--cart--%>
<section class="Cart">
    <!-- Modal -->
    <div style="overflow-x: scroll" class="modal fade pr-0" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-0">
                    <div class="modal-header row w-100 m-0 text-center" style="font-size: 15px; font-weight: 700;">
                        <div class="col-2">Hình Ảnh</div>
                        <div class="col-2">Tên Sản Phẩm</div>
                        <div class="col-2">Số Lượng</div>
                        <div class="col-2">Thành Tiền</div>
                        <div class="col-2">Hành Động</div>
                    </div>
                    <div class="modal-item text-center" style="max-height: 230px; overflow-y: scroll "></div>
                </div>
                <div class="modal-footer justify-content-between">
                    <div class="modal-total">Tổng cộng: <span></span> đ</div>
                    <div>
                        <button type="button" class="btn btn-danger m-0" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-success m-0 confirm">Thanh Toán</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>