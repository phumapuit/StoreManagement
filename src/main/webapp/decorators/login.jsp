<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Đăng nhập / Đăng ký</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"  />
                <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
        </head>
        <body class="bodylogin">
                <dec:body/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
                <script type="text/javascript">
                        const regexUsername = /^[0-9A-Za-z]{6,16}$/;
                        const regexPassword = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

                        let username = $("#username");
                        let password = $("#password");

                        $('button[type="submit"]').on('click', function(e) {
                                if(!regexUsername.test(username.val())){
                                        $("#username-error").text("Tên tài khoản không hợp lệ");
                                } else {
                                        $("#username-error").text('');
                                }
                                if (!regexPassword.test(password.val())){
                                        $("#password-error").text("Mật khẩu không hợp lệ");
                                } else {
                                        $("#password-error").text('');
                                }

                                if (!regexUsername.test(username.val()) || !regexPassword.test(password.val())){
                                        e.preventDefault();
                                } else {
                                        $(this).submit();
                                }
                        });
                </script>
        </body>
</html>