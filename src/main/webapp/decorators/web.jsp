<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
        <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet"
              type="text/css"/>
        <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
        <link href="<c:url value='/template/web/css/productinfo.css' />" rel="stylesheet" type="text/css" media="all"/>
        <title><dec:title default="Trang chủ" /></title>
    </head>
    <body>
        <!-- header -->
        <%@ include file="/common/web/header.jsp" %>
        <!-- header -->

        <!-- start slider -->
        <%@ include file="/common/web/slider.jsp" %>
        <!-- end slider -->

        <%--chi trang chu duoc hien thi--%>
        <%
            String url1 = request.getRequestURI(); // Get the request URL
            if (url1.startsWith("/trang-chu")) { // Check if URL starts with "/trang-chu"
        %>
            <!--category -->
            <%@ include file="/common/web/category.jsp" %>
            <!--category -->
        <%
            }
        %>
        <%--chi trang chu duoc hie thi--%>

        <%--chi trang product list hien thi--%>
            <%
                String url = request.getRequestURI(); // Get the request URL
                String queryString = request.getQueryString(); // Get the query string
                boolean includeFilter = url.startsWith("/san-pham") && (queryString == null || !queryString.contains("type=one"));
                if (includeFilter) { // Check if URL starts with "/trang-chu"
            %>
            <!-- filter product -->
            <%@ include file="/common/web/filterproduct.jsp" %>
            <!-- filter product -->
            <%
                }
            %>
        <%--chi trang product list hien thi--%>

        <div style="background-color: whitesmoke">
            <dec:body/>
        </div>

        <!-- footer -->
        <%@ include file="/common/web/footer.jsp" %>
        <!-- footer -->

        <!-- js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
                integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
                crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
                integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
                crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>

        <script type="text/javascript">
            $('.categoryoption').slick({
                arrows:false,
                slidesToShow: 8,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                responsive: [
                    {
                        breakpoint: 769,
                        settings: {
                            slidesToShow: 6
                        }
                    },
                    {
                        breakpoint: 577,
                        settings: {
                            slidesToShow: 4
                        }
                    },
                    {
                        breakpoint: 426,
                        settings: {
                            slidesToShow: 3
                        }
                    }
                ]
            });

        </script>

        <script type="text/javascript">
            const specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|<>\/?]/;

            $(document).on('input', '#productNameInput', function(e) {
                let currentValue = $(this).val();
                const newValue = currentValue.replace(specialChars, "");
                $(this).val(newValue);
            });

            var searchButton = document.getElementById('search-button');
            searchButton.addEventListener('click', function() {
                var searchInput = document.getElementById('productNameInput').value.trim();
                var searchURL = '/san-pham?type=list&page=1&maxPageItem=20&sortName=product_name&sortBy=asc';
                if (searchInput == '') return;

                searchURL += '&searchName=' + encodeURIComponent(searchInput);
                window.location.href = searchURL;
            });

            $(document).on('click', '.filter-price', function (){
                $('.filter-price').removeClass('activefilter');
                $(this).addClass('activefilter');
            });

            $('.filter-sort').on('click', function (){
                $('.filter-sort').removeClass('activefilter');
                $(this).addClass('activefilter');
            });

            document.querySelectorAll('.paging a').forEach(item => {
                item.addEventListener('click', event => {
                    event.preventDefault();
                    window.location.href = event.target.getAttribute('href');
                });
            });

            function formatCurrency(a) {
                var b = parseFloat(a).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
                var len = b.length;
                b = b.substring(0, len - 3);
                return b;
            }

            window.addEventListener('DOMContentLoaded', function() {
                var priceElements = document.querySelectorAll('.item-price'); // Select all elements with class 'item-price'
                priceElements.forEach(function(priceElement) {
                    var priceValue = priceElement.textContent.trim(); // Get the raw price value
                    var formattedPrice = formatCurrency(priceValue); // Format the price
                    priceElement.textContent = formattedPrice + 'đ'; // Update the displayed price
                });
            });

            $('.question-page').on('click', 'h4', function(){
                $('.question-page h4').removeClass('active');
                $('.question-page p').removeClass('show');
                $(this).toggleClass('active').next('p').toggleClass('show');
            })
            function autoMoveCarousel() {
                setInterval(function() {
                    $('#carouselExampleIndicators').carousel('next');
                }, 2000); // Change the interval time as needed
            }

            autoMoveCarousel();

            setTimeout(function() {
                var alertElement = document.getElementById('alert-result');
                if (alertElement) {
                    alertElement.style.display = 'none';
                }
            }, 3000);

        </script>
        <script type="text/javascript" src='<c:url value='/template/web/js/product-info.js' />'></script>
        <script type="text/javascript" src='<c:url value='/template/web/js/cookieProduct.js' />'></script>
    </body>
</html>