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
							href="${pageContext.request.contextPath}/public/index">Home</a>
					</p>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<span style="color: red;font-size: 30px;margin-left: 600px;">Đặt hàng thành công.</span>
</section>
<!-- .section -->
<script>
	function formDK() {
		window.location='${pageContext.request.contextPath}/public/formDK';
	}
</script>
