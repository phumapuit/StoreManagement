    $(function (){
        let product=[];
        let listItem  = $("#usernamecart").text() ? $("#usernamecart").text() + $("#usernamecart").attr('data-id') : "";
        let arrItem = []
        //const maxValue = 999999999
        if (JSON.parse(getCookie(listItem)) !== null){
            arrItem = JSON.parse(getCookie(listItem))
        }
        ShowItemInCart(arrItem)
        TinhTienThanhToan()

        $("#showCart, #showCartResponsive").click(function(){
            if ($("#usernamecart").text()) {
                $('#staticBackdrop').modal('show');
            } else {
                alert("Bạn cần đăng nhập để đặt hàng");
                $('#staticBackdrop').modal("hide");
                window.location.href = "/dang-nhap?action=login";

            }
        });

        $('.product-item').each(function(index, item) {
            let object={}
            object.id = $(item).attr('data-id')
            object.product_name = $(item).attr('data-product-name')
            object.images = "/uploads/" + $(item).attr('data-images')
            object.cpu = $(item).attr('data-cpu')
            object.ram = $(item).attr('data-ram')
            object.rom = $(item).attr('data-rom')
            object.monitor = $(item).attr('data-monitor')
            object.product_price = $(item).attr('data-product-price')
            object.product_quantity = $(item).attr('data-stock')
            product.push(object);
        });

        $(document).on('click', '.addToCart', function (){

            if ($("#usernamecart").text()) {
                let itemAdd = product.filter(item => item.id.indexOf($(this).parents('.product-item').attr('data-id')) > -1)[0]
                let sameItem = arrItem.filter(item => item.id.indexOf(itemAdd.id) > -1)[0]

                if(sameItem?.id !== itemAdd.id){
                    itemAdd.amount = "1"
                    arrItem.push(itemAdd)
                }
                else {
                    arrItem[arrItem.indexOf(sameItem)].amount = (parseInt(arrItem[arrItem.indexOf(sameItem)].amount) + 1).toString()
                }
                document.cookie = listItem + "=" + JSON.stringify(arrItem) + "; Path=/; Expires=Fri, 01 July 2025 00:00:01 GMT;';"
                ShowItemInCart(arrItem)
                TinhTienThanhToan()
            } else {
                alert("Bạn cần đăng nhập để đặt hàng");
                window.location.href = "/dang-nhap?action=login";
            }

        })
        $(document).on('click','.delete-item',function (){
            // lọc ra item cần xóa trong mảng value cookie
            let itemRemove = arrItem.filter(item => item.id.indexOf($(this).parents('.row').find('div:eq(1)').attr('data-id')) > -1)[0]

            // gán lại mảng cookie với các giá trị khác với giá trị xóa, xong rồi đẩy xuống cookie lại
            arrItem = arrItem.filter(item =>item.id.indexOf(itemRemove.id) === -1)
            document.cookie = listItem + "=" + JSON.stringify(arrItem) + "; Path=/; Expires=Fri, 01 July 2025 00:00:01 GMT;';"

            $(this).parents('.row').remove()

            TinhTienThanhToan()
        })
        $(document).on('input','.amount',function (){
            let amount = parseInt($(this).val().replace(/\./g,''))
            let maxValue = $(this).parents('.product-line').find('div:eq(1)').attr('data-stock')
            console.log("max value: "+ maxValue);
            if(amount.toString()==="NaN"){
                amount = 0
                $(this).val(amount)
            }
            if(amount >= maxValue){
                amount = maxValue
                $(this).val(amount)
            }

            // Tính tiền một item
            let itemOriginalPrice = parseInt($(this).parents('.product-line').find('div:eq(3)').attr("data-original-price").replace(/\./g,''))
            let itemMoney = amount * itemOriginalPrice;
            $(this).parents('.product-line').find('.thanhtien').text(itemMoney.toString().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".")+"đ")

            // Thêm số lượng vào COOKIE
            let idItem = $(this).parents('.product-line').find('div:eq(1)').attr('data-id')
            arrItem[arrItem.indexOf(arrItem.filter(item=>item.id.indexOf(idItem) > -1)[0])].amount = amount.toString()
            document.cookie = listItem + "=" + JSON.stringify(arrItem) + "; Path=/; Expires=Fri, 01 July 2025 00:00:01 GMT;';"

            TinhTienThanhToan()

            $(this).val(function (index, value) {
                return parseInt(value.replace(/\./g,'')).toString().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            });
        })
        $('.confirm').on('click',function(){
            let tienThanhToan = parseInt($('.modal-total').find('span').text().replace(/\./g,''))
            console.log(tienThanhToan)
            if (tienThanhToan > 0){
                arrItem.push({"totalBill":tienThanhToan});
                console.log(JSON.stringify(arrItem));
                $.ajax({
                    url: "/api-order",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    type: "POST",
                    data: JSON.stringify(arrItem),
                    success: function (response) {

                        $.ajax({
                            url: "/api-create-order-payment",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            type: "POST",
                            data: {
                                "orderId": response["id"]
                            },
                            success: function (res) {
                                console.log(res.data);

                                // xu ly xoa cookie gio hang
                                $('.product-line').remove()
                                console.log('vô xoá')
                                DeleteCookie(listItem)
                                TinhTienThanhToan()
                                arrItem=[];

                                if (res.code === '00') {
                                    location.href = res.data;
                                    return false;
                                }
                            },
                            error: function (res) {
                                console.log(res.data);
                                if (res.code != '00') {
                                    location.href = 'payment-result?action=payment';
                                    return false;
                                }
                            }
                        });
                        return false;
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                    },
                });
            }
            else{
                alert('Nhập số lượng hoặc thêm sản phẩm vào giỏ hàng')
            }
        })
    })

    function TinhTienThanhToan(){
        let tienThanhToan = 0;
        $('.thanhtien').each(function(){
            let tienSanPham = $(this).text().replace(/\./g,'');
            tienThanhToan += parseInt(tienSanPham);
        })
        $('.modal-total').find('span').text(tienThanhToan.toString().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, "."))
    }
    function ShowItemInCart(listItem){
        $('.modal-item').text(null)
        listItem.map(item =>{
            $('.modal-item').append(`
                <div class="row w-100 mx-0 my-2 align-items-center justify-content-between product-line"  style="border-bottom: 1px solid #dee2e6;">
                    <div class="col-2">
                        <img class="w-100" src=${item.images} alt="img">
                    </div>
                    <div class="col-2" data-id=${item.id} data-stock=${item.product_quantity}>
                        ${item.product_name}
                    </div>
                    <div class="col-2">
                        <input type="text" class="amount w-100" value=${item.amount.replace(/\B(?=(\d{3})+(?!\d))/g, ".")} placeholder="0" >
                    </div>
                    <div class="col-2 thanhtien" data-original-price=${item.product_price}>${((parseInt(item.product_price.replace(/\./g,'')))*(parseInt(item.amount.replace(/\./g,'')))).toString().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ".")}đ</div>
                    <div class="col-2 delete-item"><i class="fa fa-trash "></i></div>
                </div>
            `)
        })
    }

    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
        }
        return null;
    }

    function DeleteCookie(name){
        document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }