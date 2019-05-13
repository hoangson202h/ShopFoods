<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="home-slider owl-carousel">

	<div class="slider-item"
		style="background-image: url(${defines.urlPublic}/images/bg_3.jpg);"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row slider-text justify-content-center align-items-center">

				<div class="col-md-7 col-sm-12 text-center ftco-animate">
					<h1 class="mb-3 mt-5 bread">FORM LOGIN</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/public/index">Home</a></span> <span
							class="mr-2"><span>Login</span>
					</p>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row" style="">
			<!-- END comment-list -->
			<div class="">
				<c:if test="${not empty msg }">
					<strong style="color: red;">${msg }</strong>
				</c:if>
				<form action="${pageContext.request.contextPath}/public/login"
					method="post" class="billing-form ftco-bg-dark p-3 p-md-5"
					style="text-align: center;" id="formDK">
					<h3 class="mb-4 billing-heading" style="text-align: center;">FORM
						LOGIN</h3>
					<div class="row align-items-end" style="text-align: center;">
						<div class="">
							<div class="">
								<label for="firstname" style="margin-left: 330px;">Username
									*</label> <input type="text" class="form-control"
									placeholder="username"
									style="width: 400px; text-align: center; margin-left: 330px;"
									name="username">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="">
							<div class="">
								<label for="password" style="margin-left: 330px;">Password
									*</label> <input type="password" class="form-control"
									placeholder="password" id="password"
									style="width: 400px; text-align: center; margin-left: 330px;"
									name="password">
							</div>
						</div>
						<div class="w-100"></div>
						<p>
							<input type="submit" class="btn btn-primary py-3 px-4"
								value="Đăng nhập"
								style="margin-left: 400px; border-radius: 5px; float: left; margin-top: 30px;" />
						</p>
						<p>
							<a class="btn btn-primary py-3 px-4" href="javascript:;"
								onclick="formDK();"
								style="margin-left: 28px; border-radius: 5px; float: left;">Đăng
								kí</a>
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- .section -->
<script>
	function formDK() {
		window.location='${pageContext.request.contextPath}/public/formDK';
	}
</script>
