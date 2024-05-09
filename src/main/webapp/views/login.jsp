<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
		<div class="container-fluid login">
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">${message}</div>
			</c:if>
			<%-- neu la trang dang ky--%>
			<c:if test="${not empty flag}">
				<form action="<c:url value='/dang-ky?action=register'/>" class="mx-auto" method="post">
			</c:if>
			<%--neu la trang dang nhap--%>
			<c:if test="${empty flag}">
				<form action="<c:url value='/dang-nhap?action=login'/>" class="mx-auto" method="post">
			</c:if>
			<%--Form dang nhap--%>
					<h3 class="text-center">Chào mừng bạn đến với <br>Laptop Store<br> Thế giới của laptop chính hãng</h3>
					<div class="mb-3 mt-5">
						<label class="form-label">Tên tài khoản (*)</label>
						<div class="d-flex align-items-center">
							<input class="form-control mt-1" type="text" id="username" name="username" placeholder="Chứa 6 - 16 ký tự và không chứa ký tự đặc biệt" maxlength="255" required="required">
							<i class="fa-solid fa-user ms-2"></i>
						</div>
						<p id="username-error" class="text-danger"></p>
					</div>
					<div class="mb-3">
						<label class="form-label">Mật khẩu (*)</label>
						<div class="d-flex align-items-center">
							<input class="form-control mt-1" type="password" id="password" name="password" placeholder="Tối thiểu 8 ký tự, ít nhất một chữ cái và một số"  maxlength="255" required="required">
							<i class="fa-solid fa-lock ms-2"></i>
						</div>
						<p id="password-error" class="text-danger"></p>
					</div>
			<%--Form dang ky--%>
			<c:if test="${not empty flag}">
					<button type="submit" class="btn btn-primary mt-4">Đăng ký</button>
			</c:if>
			<%--Form dang nhap--%>
			<c:if test="${empty flag}">
					<button type="submit" class="btn btn-primary mt-4">Đăng nhập</button>
			</c:if>
				</form>
			<div class="login-question">
				<%--Form dang ky--%>
				<c:if test="${not empty flag}">
					<p class="login-question__text">Bạn đã có tài khoản?</p>
					<a class="link button__go-login nuxt-link-active" href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập ngay</a>
				</c:if>
				<%--Form dang nhap--%>
				<c:if test="${empty flag}">
					<p class="login-question__text">Bạn chưa có tài khoản?</p>
					<a class="link button__go-login nuxt-link-active" href='<c:url value="/dang-ky?action=register"/>'>Đăng ký ngay</a>
				</c:if>
			</div>
		</div>
	</body>
</html>