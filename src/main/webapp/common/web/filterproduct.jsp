<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="filter-product container py-3">
    <div class="filter-box">
        <div class="item-filter price row justify-content-around">
            <div class="p-0 col-2 filter-left">
                Chọn khoảng giá:
            </div>
            <div class="p-0 col-10 filter-right">
                <div class="filter_bar-items row">
                    <span class="col-lg-2 col-md-4 txt-filter ${param.optionPrice == 1 ? 'activefilter' : ''}"><a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=1&sortName=product_price&sortBy=asc'/>" style="text-decoration: none; color: black">Dưới 10 triệu </a> </span>
                    <span class="col-lg-2 col-md-4 txt-filter ${param.optionPrice == 2 ? 'activefilter' : ''}"><a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=2&sortName=product_price&sortBy=asc'/>" style="text-decoration: none; color: black">10 triệu - 15 triệu </a> </span>
                    <span class="col-lg-2 col-md-4 txt-filter ${param.optionPrice == 3 ? 'activefilter' : ''}"><a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=3&sortName=product_price&sortBy=asc'/>" style="text-decoration: none; color: black">15 triệu - 20 triệu </a> </span>
                    <span class="col-lg-2 col-md-4 txt-filter ${param.optionPrice == 4 ? 'activefilter' : ''}"><a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=4&sortName=product_price&sortBy=asc'/>" style="text-decoration: none; color: black">20 triệu - 30 triệu </a> </span>
                    <span class="col-lg-2 col-md-4 txt-filter ${param.optionPrice == 5 ? 'activefilter' : ''}"><a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=5&sortName=product_price&sortBy=asc'/>" style="text-decoration: none; color: black">30 triệu - 50 triệu </a> </span>
                    <span class="col-lg-2 col-md-4 txt-filter ${param.optionPrice == 6 ? 'activefilter' : ''}"><a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=6&sortName=product_price&sortBy=asc'/>" style="text-decoration: none; color: black">Trên 50 triệu </a></span>
                </div>
            </div>
        </div>
        <!----khoang gia --->

        <div class="item-filter row justify-content-around">
            <div class="p-0 col-2 filter-left">
                Sắp xếp theo:
            </div>
            <div class="p-0 col-10 filter-right">
                <div class="row">
                    <a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=${currentOptionPrice}&sortName=product_price&sortBy=asc'/>" class="col-4 col-lg-2 item-sort txt-filter ${param.sortName == 'product_price' && param.sortBy == 'asc' ? 'activefilter': ''}"><span>Giá tăng dần </span> </a>
                    <a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=${currentOptionPrice}&sortName=product_price&sortBy=desc'/>" class="col-4 col-lg-2 item-sort txt-filter ${param.sortName == 'product_price' && param.sortBy == 'desc' ? 'activefilter': ''}"><span>Giá giảm dần </span> </a>
                    <a href="<c:url value='/san-pham?type=list&category_id=${category_id}&page=1&maxPageItem=20&optionPrice=${currentOptionPrice}&sortName=product_name&sortBy=asc' />" class="col-4 col-lg-2 item-sort txt-filter ${param.sortName == 'product_name' && param.sortBy == 'asc' ? 'activefilter': ''}"><span>Tên A-&gt;Z </span> </a>
                </div>
            </div>
        </div>
    </div>
</div>