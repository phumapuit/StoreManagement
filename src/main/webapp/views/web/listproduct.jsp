<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
        <body class="mymaincontent my-3" >
            <div class="container" style="margin-top: 15px;">
                <!--product -->
                <div class="product-list row flex-wrap">
                    <c:forEach var="item" items="${model.listResult}">
                        <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                            <div class="product-item mr-0" data-id ="${item.id}" data-product-name="${item.product_name}" data-images="${item.images}" data-cpu="${item.cpu}" data-ram="${item.ram}" data-rom="${item.rom}" data-monitor='${item.monitor}' data-product-price="${String.format('%.0f', item.product_price)}" data-stock='${item.product_quantity}'>
                                <div class="product-img">
                                    <a href="<c:url value='/san-pham?type=one&productId=${item.id}'/>" style="text-decoration: none;color: #000;">
                                        <img src="<c:url value='/uploads/${item.images}'/>" alt="${item.product_name}" style="height: 100%;width: 100%;" />
                                    </a>
                                </div>
                                <div class="product-info">
                                    <div class="product-title">
                                        <a style="text-decoration: none;" href="<c:url value='/san-pham?type=one&productId=${item.id}'/>">${item.product_name}</a>
                                    </div>
                                    <div class="list-icon-product d-flex flex-wrap">
                                        <img src="https://laptop88.vn/template/giaodien_2022/images/sticker-1.png" alt="saleoff" style="display: block; margin: 10px 0;" />
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
                </div>
                <!--product -->

                <div class="paging row align-items space-center">
                    <c:forEach begin="1" end="${model.totalPage}" var="pageNumber">
                        <c:set var="isActive" value="${pageNumber == currentPage ? 'active' : ''}" />
                        <a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=${pageNumber}&maxPageItem=20&optionPrice=${currentOptionPrice}&sortName=${sortName}&sortBy=${sortBy}'/>" class="${isActive}">${pageNumber}</a>
                    </c:forEach>
                </div>
                <!----paging--->
            </div>
        </body>
</html>