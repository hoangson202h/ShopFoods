<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>LOGIN</title>


<link rel='stylesheet prefetch'
	href='https://fonts.googleapis.com/css?family=Open+Sans:600'>

<link rel="stylesheet" href="${defines.urlAdmin}/stylelogin.css">


</head>

<body>
	<form action="" method="post" class="form">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
					for="tab-1" class="tab">Sign In</label> <input id="tab-2"
					type="radio" name="tab" class="sign-up"><label for="tab-2"
					class="tab" onclick="signup();"></label>
				<div class="login-form">
					<div class="sign-in-htm">
						<c:if test="${not empty param['error']}">
							<p style="color: red;">Sai tên hoặc mật khẩu</p>
						</c:if>
						<div class="group">
							<label for="user" class="label">Username</label> <input id="user"
								type="text" name="username" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">Password</label> <input id="pass"
								type="password" name="password" class="input"
								data-type="password">
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span> Keep me
								Signed in</label>
						</div>
						<div class="group">
							<input type="submit" class="button" value="Sign In">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="#forgot">Forgot Password?</a>
						</div>
					</div>
					<div class="sign-up-htm"></div>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		function signup() {
			window.location='${pageContext.request.contextPath }/auth/sign-up';
		}
	</script>
</body>
</html>
