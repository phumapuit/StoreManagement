<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<c:url var ="AccountURL" value="/admin-account"/>
<c:url var ="CategoryURL" value="/admin-category"/>
<c:url var ="ProductURL" value="/admin-product"/>
<!DOCTYPE html>
<html>
	<head>
		<title>Phú Đức Store</title>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Google Font: Source Sans Pro -->
		<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

		<!-- Font Awesome Icons -->
		<link href="<c:url value='/template/admin/plugins/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css" media="all"/>

		<!-- overlayScrollbars -->
		<link href="<c:url value='/template/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css' />" rel="stylesheet" type="text/css" media="all"/>

		<!-- DataTables danhsachsanpham-->
		<link href="<c:url value='/template/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/template/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/template/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css' />" rel="stylesheet" type="text/css" media="all"/>

		<!-- AdminLTE Styles -->
		<link href="<c:url value='/template/admin/dist/css/adminlte.min.css' />" rel="stylesheet" type="text/css" media="all"/>

	</head>
	<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
		<div class="wrapper">
			<!-- header -->
			<%@ include file="../common/admin/header.jsp" %>
			<!-- header -->

			<!-- menu ben trai -->
			<%@ include file="../common/admin/menu.jsp" %>
			<!-- menu ben trai -->

			<dec:body/>

			<!-- footer -->
			<%@ include file="../common/admin/footer.jsp" %>
			<!-- footer -->

			<!-- ./wrapper -->

		</div>

		<!-- REQUIRED SCRIPTS -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/jquery/jquery.min.js' />"></script>
		<!-- Bootstrap -->
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
		<!-- bs-custom-file-input -->
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/bs-custom-file-input/bs-custom-file-input.min.js' />"></script>
		<!-- overlayScrollbars -->
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js' />"></script>
		<!-- DataTables  & Plugins -->
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/datatables/jquery.dataTables.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js' />"></script>
		<script type="text/javascript" src="<c:url value='/template/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js' />"></script>
		<!-- AdminLTE App -->
		<script type="text/javascript" src="<c:url value='/template/admin/dist/js/adminlte.js' />"></script>

		<script type="text/javascript">
				const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/;
				const maxLengthAllow = 50;
				const validExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
				const regexUsername = /^[0-9A-Za-z]{6,16}$/;
				const regexPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

				// admin product page
				$("#example1").DataTable({
					"responsive": true,
					"lengthChange": true,
					"autoWidth": true,
					"columnDefs": [
						{
							orderable:false,
							targets: 0,

						},
						{
							targets: 2,
							orderable:false,
						},
						{
							targets: 5,
							orderable:false,
						},
						{
							targets: 3,
							render: $.fn.dataTable.render.number('.', 3, '')
						},
						{
							targets: 4,
							render: $.fn.dataTable.render.number('.', 3, '')
						}
					],
				}).buttons().container().appendTo('#example1_wrapper .col-lg-6:eq(0)');

				// admin account page
				$("#example2").DataTable({
					"responsive": true,
					"lengthChange": true,
					"autoWidth": true,
					"columnDefs": [
						{
							orderable:false,
							targets: 0,

						},
						{
							orderable:false,
							targets: 3,
						},
					],
				}).buttons().container().appendTo('#example2_wrapper .col-lg-4:eq(0)');

				// admin category page
				$("#example3").DataTable({
					"responsive": true,
					"lengthChange": true,
					"autoWidth": true,
					"columnDefs": [
						{
							orderable:false,
							targets: 0,

						},
						{
							orderable:false,
							targets: 3,
						},

					],
				}).buttons().container().appendTo('#example3_wrapper .col-lg-4:eq(0)');

				// admin order page
				$("#example4").DataTable({
					"responsive": true,
					"lengthChange": true,
					"autoWidth": true,
					"columnDefs": [
						{
							orderable:false,
							targets: 0,

						},
						{
							orderable:false,
							targets: 5,

						},
						{
							targets: 3,
							render: $.fn.dataTable.render.number('.', 3, '')
						}
					],
				}).buttons().container().appendTo('#example4_wrapper .col-lg-4:eq(0)');

				// ghi ten file upload
				bsCustomFileInput.init();

				var checkboxStates = {}; // Object to store checkbox states

				// Function to update checkbox state
				function updateCheckboxState(id, isChecked) {
					checkboxStates[id] = isChecked;
				}

				// Function to apply checkbox state on page load
				function applyCheckboxState() {
					$('tbody input[type=checkbox]').each(function() {
						var id = $(this).val();
						$(this).prop('checked', checkboxStates[id]);
					});
				}

				// Listen for changes in checkbox state
				$(document).on('change', 'tbody input[type=checkbox]', function() {
					var id = $(this).val();
					var isChecked = $(this).is(':checked');
					updateCheckboxState(id, isChecked);
					updateDeleteButtonState();
				});

				// Update the delete button state based on checkbox states
				function updateDeleteButtonState() {
					var checkedCheckboxes = $('tbody input[type=checkbox]:checked');
					if (checkedCheckboxes.length > 0) {
						$("#btnDelete").prop("disabled", false);
					} else {
						$("#btnDelete").prop("disabled", true);
					}
				}

				// Click event handler for the "Delete" button
				$("#btnDelete").click(function() {
					var data = {};
					var ids = $('tbody input[type=checkbox]:checked').map(function() {
						return $(this).val();
					}).get();

					data['ids'] = ids;

					var url = window.location.href;

					if (url.includes("admin-product")) {
						deleteProduct(data);
					} else if (url.includes("admin-account")) {
						deleteAccount(data);
					} else if (url.includes("admin-category")) {
						deleteCategory(data);
					} else {
						console.log("No matching URL found for deletion.");
					}
				});

				function formatCurrency(a) {
					var b = parseFloat(a).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
					var len = b.length;
					b = b.substring(0, len - 3);
					return b;
				}

				// Call formatCurrency function and update the displayed price
					var priceElements = document.querySelectorAll('.item-price'); // Select all elements with class 'item-price'
					priceElements.forEach(function(priceElement) {
						var priceValue = priceElement.textContent.trim(); // Get the raw price value
						var formattedPrice = formatCurrency(priceValue); // Format the price
						priceElement.textContent = formattedPrice + 'đ'; // Update the displayed price
					});

				//set timeout show result add, edit, delete action
				setTimeout(function() {
					var alertElement = document.getElementById('alert-result');
					if (alertElement) {
						alertElement.style.display = 'none';
					}
				}, 3000);

		</script>

		<%--START script admin product--%>
		<script type="text/javascript">
			var isErrorCPU = false;
			var isErrorProductName = false;
			var isErrorMonitor = false;
			var isErrorProductPrice = false;
			var isErrorProductQuantity = false;
			var isErrorProductWeight = false;
			var isErrorProductLogo = false;
			var isErrorCategoryName = false;

			function validateCPUValue(cpuValue) {
				var specialChars = /[!@#$%^&*()_+\=[\]{};':"\\|,.<>\/?]/;
				cpuValue = cpuValue.trim();
				let errorMessage = "";
				$("#cpu-error").text('');

				if (!cpuValue) {
					errorMessage = "Trường CPU không được để trống";
				} else if (cpuValue.length > maxLengthAllow) {
					errorMessage = "Trường CPU không được quá 50 ký tự";
				} else if (specialChars.test(cpuValue)) {
					errorMessage = "Trường CPU có chứa ký tự đặc biệt";
				}

				if (errorMessage) {
					isErrorCPU = true;
					$("#cpu-error").text(errorMessage);
				} else {
					isErrorCPU = false;
				}
			}

			function validateProductName(productName) {
				var specialChars = /[!@#$%^&*()_+\=[\]{};':"\\|,.<>\/?]/;
				productName = productName.trim();
				let errorMessage = "";
				$("#product-name-error").text('');

				if (!productName) {
					errorMessage = "Tên sản phẩm không được để trống";
				} else if (productName.length > 255) {
					errorMessage = "Tên sản phẩm không được quá 50 ký tự";
				} else if (specialChars.test(productName)) {
					errorMessage = "Tên sản phẩm có chứa ký tự đặc biệt";
				}

				if (errorMessage) {
					isErrorProductName = true;
					$("#product-name-error").text(errorMessage);
				} else {
					isErrorProductName = false;
				}
			}

			function validateProductScreen(productScreen) {
				var specialChars = /[!@#$%^&*_+\-=\[\]{};':\\|,<>\/?]/;
				productScreen = productScreen.trim();
				let errorMessage = "";
				$("#monitor-error").text('');

				if (!productScreen) {
					errorMessage = "Trường kích thước màn hình không được để trống";
				} else if (productScreen.length > maxLengthAllow) {
					errorMessage = "Trường kích thước màn hình không được quá 50 ký tự";
				} else if (specialChars.test(productScreen)) {
					errorMessage = "Trường kích thước màn hình có chứa ký tự đặc biệt";
				}

				if (errorMessage) {
					isErrorMonitor = true;
					$("#monitor-error").text(errorMessage);
				} else {
					isErrorMonitor = false;
				}
			}

			/*validation image*/
			function validateFile(input) {
				var fileName = $('#logo').val().split('\\').pop();

				$("#img-error").text("");

				// Check if a file is selected
				if (!fileName) {
					isErrorProductLogo = true;
					$("#img-error").text("Bạn chưa chọn ảnh");
					return;
				} else {
					isErrorProductLogo = false;
				}

				// Check if the file name has a valid extension
				var fileExtension = fileName.split('.').pop().toLowerCase();
				if ($.inArray(fileExtension, validExtensions) == -1) {
					isErrorProductLogo = true;
					$("#img-error").text("Chỉ upload ảnh có đuôi JPG, JPEG, PNG, GIF, WEBP");
					clearFileInput();
					return;
				} else {
					isErrorProductLogo = false;
				}

				// Check if the file size is within the allowed limit
				var maxSizeInBytes = 10; // 10 MB

				var sizeImgProduct = (input / (1024 * 1024)).toFixed(2);

				if (sizeImgProduct > maxSizeInBytes) {
					isErrorProductLogo = true;
					$("#img-error").text("Chỉ up ảnh tối đa 10 MB");
					clearFileInput();
				} else {
					isErrorProductLogo = false;
				}
			}

			$("#logo").change(function() {
				validateFile(this.files[0].size);
			});

			function validateProductPrice(productPrice) {
				var specialChars = /^[0-9]+$/;
				productPrice = productPrice.trim();
				let errorMessage = "";
				$("#product-price-error").text(errorMessage);

				if (!productPrice) {
					errorMessage = "Trường giá không được để trống";
				} else if (productPrice.length > 10) {
					errorMessage = "Trường giá không được quá 10 ký tự";
				} else if (!specialChars.test(productPrice)) {
					errorMessage = "Trường giá chỉ được nhập số";
				}

				if (errorMessage) {
					isErrorProductPrice = true;
					$("#product-price-error").text(errorMessage);
				} else {
					isErrorProductPrice = false;
				}
			}

			function validateProductQuantity(productQuantity) {
				var specialChars = /^[0-9]+$/;
				productQuantity = productQuantity.trim();
				let errorMessage = "";
				$("#product-quantity-error").text('');

				if (!productQuantity) {
					errorMessage = "Trường số lượng không được để trống";
				} else if (productQuantity.length > 11) {
					errorMessage = "Trường số lượng không được quá 11 ký tự";
				} else if (!specialChars.test(productQuantity)) {
					errorMessage = "Trường số lượng không được nhập ký tự đặc biệt";
				}

				if (errorMessage) {
					isErrorProductQuantity = true;
					$("#product-quantity-error").text(errorMessage);
				} else {
					isErrorProductQuantity = false;
				}
			}

			function validateProductWeight(productWeight, isError) {
				var specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]/;
				productWeight = productWeight.trim();
				let errorMessage = "";
				$("#weight-error").text('');

				if (!productWeight) {
					errorMessage = "Trường khối lượng không được để trống";
				} else if (productWeight.length > maxLengthAllow) {
					errorMessage = "Trường khối lượng không được quá 50 ký tự";
				} else if (specialChars.test(productWeight)) {
					errorMessage = "Trường khối lượnǵ không được nhập ký tự đặc biệt";
				}

				if (errorMessage) {
					isErrorProductWeight = true;
					$("#weight-error").text(errorMessage);
				} else {
					isErrorProductWeight = false;
				}
			}

			function deleteProduct(data) {
				$.ajax({
					url: '/api-product',
					type: 'DELETE',
					contentType: 'application/json',
					data: JSON.stringify(data),
					success: function (result) {
						if (result === true) {
							window.location.href = "${ProductURL}?type=list&message=delete_success";
						} else {
							window.location.href = "${ProductURL}?type=list&message=delete_error";
						}
					},
					error: function (error) {
						window.location.href = "${ProductURL}?type=list&message=delete_error";
					}
				});
			}
			function getProductById(data) {
				$.ajax({
					url: "/api-product?productId="+data,
					type: 'GET',
					contentType: 'application/json',
					success: function (result) {
						document.getElementById('titleProductForm').innerHTML = 'Chỉnh sửa thông tin sản phẩm';

						document.getElementById('product_name').value = result["product_name"];
						document.getElementById('product_price').value = result["product_price"];
						document.getElementById('rate_point').value = result["rate_point"];
						document.getElementById('product_quantity').value = result["product_quantity"];
						document.getElementById('cpu').value = result["cpu"];
						document.getElementById('monitor').value = result["monitor"];
						document.getElementById('ram').value = result["ram"];
						document.getElementById('rom').value = result["rom"];
						document.getElementById('weight').value = result["weight"];
						document.getElementById('color').value = result["color"];
						document.getElementById('productId').value = result["id"];
						$("#category_id").val(result["category_id"]);

						$('#modal-add-product').modal('show');

						$('.validation-text').text('');

						let fileName = result["images"];
						let label = document.getElementById('logo-label');
						label.innerHTML = fileName;
					},
					error: function (error) {
						console.log("error:  "+error);
					}
				});
			}

			function OpenAtProductForm() {
				document.getElementById("formSubmitProduct").reset();
				document.getElementById('titleProductForm').innerHTML = 'Thêm sản phẩm';
				$('#modal-add-product').modal('show');
				$('.validation-text').text('');
			}

			$('#btnSubmitProductForm').on('click',function(event) {

				// Prevent the default form submission
				event.preventDefault();

				let cpu = $('#cpu').val();
				validateCPUValue(cpu, isErrorCPU);

				let product_name = $('#product_name').val();
				validateProductName(product_name, isErrorProductName);

				let monitor = $('#monitor').val();
				validateProductScreen(monitor, isErrorMonitor);

				let product_price = $('#product_price').val();
				validateProductPrice(product_price, isErrorProductPrice);

				let product_quantity = $('#product_quantity').val();
				validateProductQuantity(product_quantity, isErrorProductQuantity);

				let weight = $('#weight').val();
				validateProductWeight(weight, isErrorProductWeight);

				// lan dau tien tao san pham bat buoc check file anh
				let productIdValue = $("#productId").val();
				if (null == productIdValue || "" == productIdValue) {
					validateFile($("#logo")[0].files[0].size);
				}

				// neu khong co loi tai bat ky truong nao thi cho submit form
				let checkResult = isErrorCPU == false && isErrorProductName == false && isErrorMonitor == false && isErrorProductPrice == false && isErrorProductQuantity == false && isErrorProductWeight == false && isErrorProductLogo == false;

				if (checkResult) {
					$("#formSubmitProduct").submit();
				} else {
					return;
				}
			});

		</script>
		<%--END script admin product--%>

		<%--START srcipt admin account--%>
		<script type="text/javascript">
			let username = $("#username");
			let password = $("#password");

			$('#btnSubmitAccountForm').on('click',function(e) {
				if(!regexUsername.test(username.val())){
					$("#username-error").text("Tên tài khoản không hợp lệ");
				}
				if (!regexPassword.test(password.val())){
					$("#password-error").text("Mật khẩu không hợp lệ");
				}
				if (!regexUsername.test(username.val()) || !regexPassword.test(password.val())){
					e.preventDefault();
				} else {
					$("#formSubmitAccount").submit();
				}
			});

			function deleteAccount(data) {
				$.ajax({
					url: '/api-account',
					type: 'DELETE',
					contentType: 'application/json',
					data: JSON.stringify(data),
					success: function (result) {
						if (result === true) {
							window.location.href = "${AccountURL}?type=list&message=delete_success";
						} else {
							window.location.href = "${AccountURL}?type=list&message=delete_error";
						}
					},
					error: function (error) {
						window.location.href = "${AccountURL}?type=list&message=delete_error";
					}
				});
			}

			function editAccount(data) {
				$.ajax({
					url: "/api-account?accountId="+data,
					type: 'GET',
					contentType: 'application/json',
					success: function (result) {

						document.getElementById('titleAccountName').innerHTML = 'Chỉnh sửa thông tin tài khoản';
						document.getElementById('username').value = result["username"];
						document.getElementById('password').value = result["password"];
						document.getElementById('accountId').value = result["id"];

						$('#modal-add-account').modal('show');
						$('.validation-text').text('');
					},
					error: function (error) {
						console.log("error: "+error);
					}
				});
			}
			function OpenAtAccountForm() {
				document.getElementById("formSubmitAccount").reset();
				document.getElementById('titleAccountName').innerHTML = 'Thêm tài khoản';
				$('#modal-add-account').modal('show');
				$('.validation-text').text('');
			}
		</script>
		<%--END srcipt admin account--%>

		<%--srcipt admin category--%>
		<script type="text/javascript">

			function deleteCategory(data) {
				$.ajax({
					url: '/api-category',
					type: 'DELETE',
					contentType: 'application/json',
					data: JSON.stringify(data),
					success: function (result) {
						if (result === true) {
							window.location.href = "${CategoryURL}?type=list&message=delete_success";
						} else {
							window.location.href = "${CategoryURL}?type=list&message=delete_error";
						}
					},
					error: function (error) {
						window.location.href = "${CategoryURL}?type=list&message=delete_error";
					}
				});
			}

			function openUpdateFormCategory(data) {
				$.ajax({
					url: "/api-category?categoryId="+data,
					type: 'GET',
					contentType: 'application/json',
					success: function (result) {

						document.getElementById('titleCategoryName').innerHTML = 'Chỉnh sửa thông tin nhà cung cấp';
						document.getElementById('category_name').value = result["category_name"];
						document.getElementById('categoryId').value = result["id"];

						// Update label with file name
						var fileName = result["logo"];
						var label = document.getElementById('logo-label');
						label.innerHTML = fileName;

						$('#modal-add-category').modal('show');
						$('.validation-text').text('');
					},
					error: function (error) {
						console.log("error: "+error);
					}
				});
			}

			function OpenAtCategoryForm() {
				document.getElementById("formSubmitCategory").reset();
				document.getElementById('titleCategoryName').innerHTML = 'Thêm nhà cung cấp';
				$('.validation-text').text('');
				$('#modal-add-category').modal('show');
			}

			function clearFileInput() {
				// Clear the file input field
				$('#logo').val('');
				// Reset the label
				$('#logo-label').text('Choose file');
			}

			function validateCategoryName() {
				let specialChars = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
				let categoryName = $('#category_name').val().trim();
				let errorMessage = "";
				$("#category-error").text('');

				if (!categoryName) {
					errorMessage = "Tên nhà cung cấp không được để trống";
				} else if (categoryName.length > maxLengthAllow) {
					errorMessage = "Tên nhà cung cấp không được quá 50 ký tự";
				} else if (specialChars.test(categoryName)) {
					errorMessage = "Tên nhà cung cấp không được nhập ký tự đặc biệt";
				}

				if (errorMessage) {
					isErrorCategoryName = true;
					$("#category-error").text(errorMessage);
				} else {
					isErrorCategoryName = false;
				}
			}

			$('#btnSubmitCategoryForm').on('click',function(event) {
				// Prevent the default form submission
				event.preventDefault();

				validateCategoryName();

				// lan dau tien tao nha cung cap bat buoc check file anh
				if (null == $("#categoryId").val() || "" == $("#categoryId").val()) {
					validateFile($("#logo")[0].files[0].size);
				}

				// neu khong co loi tai bat ky truong nao thi cho submit form
				let checkResult = isErrorCategoryName == false && isErrorProductLogo == false;

				if (checkResult) {
					$("#formSubmitCategory").submit();
				} else {
					return;
				}
			});
		</script>

		<%--script admin order--%>
		<script type="text/javascript">
			function viewOrderDetail(data) {
				$.ajax({
					url: "/api-order?orderId="+data,
					type: 'GET',
					contentType: 'application/json',
					success: function(data) {
						// Update the orderdetails variable
						var orderdetails = data;

						// Clear existing rows
						$('#orderDetailsBody').empty();

						// Populate the table with fetched data
						$.each(orderdetails, function(index, item) {
							var row = $('<tr>');
							row.append($('<td>').text(index + 1));
							row.append($('<td>').html('<img style="height: 80px; width: 80px" src="/uploads/' + item.images + '">'));
							row.append($('<td>').text(item.product_name));
							row.append($('<td>').text(item.quantity));
							row.append($('<td class="item-price">').text(item.price_quotation));
							$('#orderDetailsBody').append(row);
						});
						$('#modal-show-orderdetail').modal('show');
					},
					error: function(xhr, status, error) {
						alert("Không tìm thấy dữ liệu yêu cầu");
						// Handle errors
						console.error(xhr.responseText);
					}
				});
			}
		</script>
	</body>
</html>