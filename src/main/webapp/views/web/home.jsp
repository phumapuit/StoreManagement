    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@include file="../../common/taglib.jsp"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
        <body class="mymaincontent my-3" >
            <div class="container" style="margin-top: 15px;">

                <div class="product-list" style="margin-top: 15px; margin-bottom: 30px;">
                    <c:forEach var="category" items="${categories}">
                        <!--category name -->
                        <div class="title d-flex align-items space-between">
                            <h2 class="name">${category.category_name}</h2>
                            <div class="list-cate-con">
                                <a style="text-decoration: none" href="<c:url value='/san-pham?type=list&category_id=${category.id}&page=1&maxPageItem=20&optionPrice=1&sortName=product_price&sortBy=asc'/>">
                                    Xem thêm
                                    <i class="fa fa-caret-down"></i>
                                </a>
                            </div>
                        </div>
                        <!--category name -->

                        <!--product -->
                        <div class="product-list row flex-wrap">
                            <c:forEach var="entry" items="${productCategoryMap}">
                                <c:if test="${entry.key eq category.id}">
                                    <c:forEach var="item" items="${entry.value}">
                                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                                            <div class="product-item" data-id ='${item.id}' data-product-name='${item.product_name}' data-images='${item.images}' data-cpu='${item.cpu}' data-ram='${item.ram}' data-rom='${item.rom}' data-monitor='${item.monitor}' data-product-price='${String.format('%.0f', item.product_price)}'  data-stock='${item.product_quantity}'>
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
                                                                <td>${item.cpu}</td>
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
                                                    <div class="product-price row justify-content-between align-items-center">
                                                        <div class="col-3">
                                                            <button type="button" class="btn btn-danger addToCart"><i class="fa-solid fa-cart-shopping"></i></button>
                                                        </div>

                                                        <div class="col-9 price-bottom">
                                                            <span class="item-price mt-0"><c:out value="${String.format('%.0f', item.product_price)}" />đ</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                        <!--product -->
                    </c:forEach>
                </div>
            </div>
        </body>
    </html>
