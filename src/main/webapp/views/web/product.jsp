<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../../common/taglib.jsp"%>
<c:url var="APIurl" value="/api-order"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Trang sản phẩm</title>
    </head>
    <body class="myproductinfo my-3 product-list" >
            <div class="container" >
                <div class="row product product-item" data-id ="${model.id}" data-product-name="${model.product_name}" data-images="${model.images}" data-cpu="${model.cpu}" data-ram="${model.ram}" data-rom="${model.rom}" data-monitor='${model.monitor}' data-product-price="${String.format('%.0f', model.product_price)}" data-stock='${model.product_quantity}'>
                    <div class="col-md-3 col-lg-3 main-product-left">
                        <div>
                            <img src="<c:url value='/uploads/${model.images}'/>" style="width: 100%;" alt="">
                        </div>
                    </div>
                    <div class="col-md-9 col-lg-6 main-product-mid">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3>${model.product_name}</h3>
                            </div>
                            <p>Thương hiệu: <a class="text-danger" href="/san-pham?type=list&category_id=${model.category_id}&page=1&maxPageItem=20&optionPrice=1&sortName=product_price&sortBy=asc">${category_name}</a></p>
                            <div class="col-md-12 text-black">
                                <h3><span class="item-price"><c:out value="${String.format('%.0f', model.product_price)}" />đ</span></h3>
                            </div>
                        </div>
                        <div id="config-holder">
                            <div class="d-flex align-items flex-wrap" id="attr-cpu">
                                    <span style="width: 90px;">CPU: </span>
                                    <ul>
                                        <li class="selected-attr-value">
                                            <span>${model.cpu}</span>
                                        </li>
                                    </ul>
                                    <span style="width: 90px;">RAM: </span>
                                    <ul>
                                        <li class="selected-attr-value">
                                            <span>${model.ram}</span>
                                        </li>
                                    </ul>
                                    <span style="width: 90px;">Ổ cứng: </span>
                                    <ul>
                                        <li class="selected-attr-value">
                                            <span>${model.rom}</span>
                                        </li>
                                    </ul>
                                    <span style="width: 90px;">Màn hình: </span>
                                    <ul>
                                        <li class="selected-attr-value">
                                            <span>${model.monitor}</span>
                                        </li>
                                    </ul>
                            </div>
                        </div>
                        <button class="btn btn-danger addToCart" type="button" style="width: 100%;">Thêm vào giỏ hàng</button>
                        <!---- thong tin mua hang--->
                        <div class="product-yentammuahang mt-3">
                            <h3 class="title">Yên tâm mua hàng</h3>
                            <div class="content">
                                <p>👉 Hệ thống cửa hàng toàn quốc</p>
                                <p>👉 Đại lý phân phối chính hãng</p>
                                <p>👉 Giá luôn tốt nhất</p>
                                <p>👉 Hỗ trợ trả góp lãi suất thấp</p>
                                <p>👉 Bảo hành dài, hậu mãi chu đáo</p>
                                <p>👉 Miễn phí giao hàng toàn quốc</p>
                            </div>
                        </div>
                    </div>
                    <div class="d-none d-lg-block col-lg-3 main-product-right">

                        <!---- thong tin bao hanh--->
                        <div class="product-warranty">
                            <h3 class="title">Thông tin bảo hành</h3>
                            <div class="content">
                                <p>✅Bảo hành 12 tháng Phu Duc Store</p>
                                <p>✔️Tùy chọn:</p>
                                <p>- Gói BẢO HÀNH VÀNG: gia tăng thêm 12 tháng bảo hành</p>
                                <p>- Gói BẢO HÀNH KIM CƯƠNG: gia tăng thêm 24 tháng bảo hành</p>
                                <p>✅MIỄN PHÍ GIAO HÀNG&nbsp;</p>
                                <p>- Với đơn hàng &lt; 4.000.000 đồng: Miễn phí giao hàng cho đơn hàng &lt; 5km tính từ cửa hàng Laptop88 gần nhất</p>
                                <p>- Với đơn hàng &gt; 4.000.000 đồng: Miễn phí giao hàng (khách hàng chịu phí bảo hiểm hàng hóa nếu có)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container my-5">
                <h3>Thông số kĩ thuật</h3>
                <div style="overflow-x: auto">
                    <table class="specifications">
                        <tr>
                            <th>CPU</th>
                            <th>RAM</th>
                            <th>Ổ cứng</th>
                            <th>Màn hình</th>
                            <th>Trọng lượng</th>
                            <th>Màu sắc</th>
                        </tr>
                        <tr>
                            <td>${model.cpu}</td>
                            <td>${model.ram}</td>
                            <td>${model.rom}</td>
                            <td>${model.monitor}</td>
                            <td>${model.weight}</td>
                            <td>${model.color}</td>
                        </tr>
                    </table>
                </div>

            </div>

            <div class="container my-5 table-product-info">
                <h3 style="text-align: center">Sản phẩm có liên quan khác</h3>
                <!--product -->
                <div class="product-list row flex-wrap">
                    <c:forEach var="item" items="${productList}">
                        <div class="col-md-4 col-lg-3">
                            <div class="product-item" data-id ="${item.id}" data-product-name="${item.product_name}" data-images="${item.images}" data-cpu="${item.cpu}" data-ram="${item.ram}" data-rom="${item.rom}" data-monitor='${item.monitor}' data-product-price="${String.format('%.0f', item.product_price)}" data-stock='${item.product_quantity}'>
                                <div class="product-img">
                                    <a href="<c:url value='/san-pham?type=one&productId=${item.id}'/>" style="text-decoration: none;color: #000;">
                                        <img src="<c:url value='/uploads/${item.images}'/>" alt="${item.product_name}" style="height: 100%;width: 100%;" />
                                    </a>
                                </div>
                                <div class="product-info">
                                    <div class="product-title">
                                        <a style="text-decoration: none;color: black;" href="<c:url value='/san-pham?type=one&productId=${item.id}'/>">${item.product_name}</a>
                                    </div>
                                    <div class="list-icon-product">
                                        <img src="<c:url value='/uploads/sticker-1.png'/>" alt="saleoff" style="display: block; margin: 10px 0;" />
                                    </div>

                                    <div class="product-promotion">
                                        <table class="mce-item-table">
                                            <tbody>
                                            <tr>
                                                <td>CPU</td>
                                                <td>
                                                    ${item.cpu}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>RAM</td>
                                                <td>${item.ram}</td>
                                            </tr>
                                            <tr>
                                                <td>Ổ cứng</td>
                                                <td>${item.rom}</td>
                                            </tr>
                                            <tr>
                                                <td>Màn hình</td>
                                                <td>${item.monitor}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="product-price">
                                        <div class="price-bottom">
                                            <span class="item-price"><c:out value="${String.format('%.0f', item.product_price)}" />đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--product -->
            </div>

            <div class="container">
                <div class="row pb-3">
                    <div class="mb-1 col-md-4"><img class="w-100" src="<c:url value='/uploads/bg_footer.jpg'/>" style="border-radius: 15px" alt=""></div>
                    <div class="mb-1 col-md-4"><img class="w-100" src="<c:url value='/uploads/bg_footer_2.jpg'/>" style="border-radius: 15px" alt=""></div>
                    <div class="mb-1 col-md-4"><img class="w-100" src="<c:url value='/uploads/bg_footer_3.jpg'/>" style="border-radius: 15px" alt=""></div>
                </div>
            </div>
    </body>
</html>