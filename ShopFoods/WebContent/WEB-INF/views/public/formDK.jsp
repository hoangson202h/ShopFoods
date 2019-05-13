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
				<form action="${pageContext.request.contextPath}/public/formDK"
					method="post" class="billing-form ftco-bg-dark p-3 p-md-5"
					style="text-align: center;" id="formDK">
					<h3 class="mb-4 billing-heading" style="text-align: center;">FORM
						ĐĂNG KÍ</h3>
					<div class="row align-items-end" style="text-align: center;">
						<div class="">
						<div class="">
								<label for="firstname" style="margin-left: 330px;">Fullname
									*</label> <input value="${user1.fullname}" type="text"
									class="form-control" placeholder="fullname"
									style="width: 400px; text-align: center; margin-left: 330px;"
									name="fullname" required="required" >
							</div>
							<div class="">
								<label for="firstname" style="margin-left: 330px;">Username
									*</label> <input value="${user1.username}" type="text"
									class="form-control" placeholder="username"
									style="width: 400px; text-align: center; margin-left: 330px;"
									name="username" required="required">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="">
							<div class="">
								<label for="password" style="margin-left: 330px;">Password
									*</label> <input value="${user1.password}" type="password"
									class="form-control" placeholder="password"
									style="width: 400px; text-align: center; margin-left: 330px;"
									name="password" required="required">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="">
							<div class="">
								<label for="repassword" style="margin-left: 330px;">Repassword
									*</label> <input value="${repassword}" type="password"
									class="form-control" placeholder="nhập lại password"
									style="width: 400px; text-align: center; margin-left: 330px;"
									onchange="repass();" name="repassword" required="required" />
							</div>
						</div>
						<div class="w-100"></div>
						<c:if test="${not empty msg }">
							<strong style="color: red;margin-left: 420px;margin-top: 20px;">${msg }</strong>
						</c:if>
						<div class="w-100"></div>
						<p>
							<input value="ĐĂNG KÍ" type="submit"
								class="btn btn-primary py-3 px-4"
								style="margin-left: 480px; margin-top: 30px; border-radius: 5px; float: left;" />
						</p>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- .section -->
