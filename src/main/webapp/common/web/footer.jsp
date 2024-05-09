<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="myfooter bg-dark text-white py-4">
    <div class="container">
        <div class="row">
            <div class="d-none d-sm-block col-md-6 col-lg-3 mb-2">
                <h5>VĂN PHÒNG GIAO DỊCH</h5>
                <ul class="list-menu">
                    <li class="li_menu"><a href='<c:url value="/"/>' title="Trang chủ">- Trang chủ</a></li>

                    <li class="li_menu"><a href='<c:url value="/gioi-thieu?action=introduce"/>' title="Giới thiệu">- Giới thiệu</a></li>

                    <li class="li_menu"><a href="<c:url value='/san-pham?type=list&category_id=1&page=1&maxPageItem=20&optionPrice=0'/>" title="Sản phẩm">- Sản phẩm</a></li>

                    <li class="li_menu"><a href='<c:url value="/cau-hoi-thuong-gap?action=question"/>' title="Câu hỏi thường gặp">- Câu hỏi thường gặp</a></li>

                    <li class="li_menu"><a href='<c:url value="/tuyen-dung?action=hiring"/>' title="Tuyển dụng">- Tuyển dụng</a></li>
                </ul>
            </div>
            <div class="d-none d-sm-block col-md-6 col-lg-3 mb-2">
                <h5>CÁC NHÃN HÀNG TÀI TRỢ</h5>
                <ul class="list-menu">
                    <c:forEach var="item" items="${categories}">
                        <li class="li_menu">
                            <a href="<c:url value='/san-pham?type=list&category_id=${item.id}&page=1&maxPageItem=20&optionPrice=0'/>">- ${item.category_name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="d-none d-sm-block col-md-6 col-lg-3 mb-2">
                <h5>CHÍNH SÁCH</h5>
                <ul class="list-menu">
                    <li class="li_menu"><a href="" title="">- Chính sách trả góp</a></li>

                    <li class="li_menu"><a href="" title="">- Chính sách đặt cọc trước</a></li>

                    <li class="li_menu"><a href="" title="">- Chính sách bảo hành</a></li>

                    <li class="li_menu"><a href="" title="">- Chính sách giao nhận đổi trả</a></li>

                    <li class="li_menu"><a href="" title="">- Chính sách bảo mật thông tin</a></li>
                </ul>
            </div>
            <div class="col-md-6 col-lg-3 mb-2">
                <h5>CÁC HÌNH THỨC THANH TOÁN</h5>
                <ul class="list-menu">
                    <li class="li_menu"><a href="" title="">- Thanh toán trực tiếp tại cửa hàng</a></li>

                    <li class="li_menu"><a href="" title="">- Thanh toán trực tuyến (Internet Banking)</a></li>

                    <li class="li_menu"><a href="" title="">- Thanh toán khi nhận hàng (COD)</a></li>

                    <li class="li_menu"><a href="" title="">- Thanh toán bằng hình thức chuyển khoản</a></li>
                </ul>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-6">
                <h5>THÔNG TIN PHU DUC STORE</h5>
                <p class="m-1">Công ty cổ phần PHU DUC STORE</p>
                <p class="m-1">Địa chỉ: Trung tâm ITPlus Academy, chi nhánh Hồ Chí Minh</p>
                <p class="m-1" onclick="window.open('tel:0123456789');">SĐT: 0356111918</p>
                <p class="m-1">Email: phuducstore@yopmail.com</p>
            </div>
            <div class="col-md-6">
                <h5>ĐĂNG KÝ NHẬN TIN KHUYẾN MÃI</h5>
                <div class="input-group mb-3">
                    <input type="text" class="form-control bg-white" placeholder="Email" style="padding: 25px;" />
                    <button class="btn btn-outline-secondary" type="button" id="btnRegisterNews">
                        <span class="btn btn-danger" id="basic-addon2">ĐĂNG KÝ NGAY</span>
                    </button>
                </div>
                <div class="text-right">
                    <span class="box-icon border bg-danger">
                        <a class="text-white" href="/trang-chu"><i class="fa-brands fa-facebook-f"></i></a>
                    </span>
                    <span class="box-icon border bg-danger">
                        <a class="text-white" href="/trang-chu"><i class="fa-brands fa-x-twitter"></i></a>
                    </span>
                    <span class="box-icon border bg-danger">
                        <a class="text-white" href="/trang-chu"> <i class="fa-brands fa-google"></i></a>
                    </span>
                    <span class="box-icon border bg-danger">
                        <a class="text-white" href="/trang-chu"><i class="fa-regular fa-envelope"></i></a>
                    </span>
                </div>
            </div>
        </div>
        <hr />

        <div class="row">
            <div class="col">
                Bản quyền thuộc về CTCP PHU DUC Store
            </div>
            <div class="col text-end">
                <ul>
                    <li class="cuoitrang"><a href='<c:url value="/"/>'>Trang chủ | </a></li>
                    <li class="cuoitrang"><a href='<c:url value="/gioi-thieu?action=introduce"/>'>Giới thiệu | </a></li>
                    <li class="cuoitrang"><a href="<c:url value='/san-pham?type=list&category_id=1&page=1&maxPageItem=20&optionPrice=0'/>">Sản phẩm | </a></li>
                    <li class="cuoitrang"><a href='<c:url value="/cau-hoi-thuong-gap?action=question"/>'>Câu hỏi thường gặp</a></li>
                </ul>
            </div>
        </div>
    </div>
</footer>
