<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="product-list container py-3">
    <h2>Laptop - Máy tính xách tay</h2>
    <div class="row categoryoption ml-1">

        <c:forEach var="item" items="${categories}">
            <div class="mt-3">
                <a class="css-1h3fn00" href="<c:url value='/san-pham?type=list&category_id=${item.id}&page=1&maxPageItem=20&optionPrice=1&sortName=product_price&sortBy=asc'/>">
                    <button height="2.5rem" class="css-uros0k" type="button" width="110">
                        <div height="100%" width="100" class="css-y1mw1c">
                            <img src="<c:url value='/uploads/${item.logo}'/>" class="imageCategory" />
                        </div>
                        <span style="margin-left: 0px;"><div class="css-157jl91"></div></span>
                    </button>
                </a>
            </div>
        </c:forEach>

    </div>
</div>