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
					<h1 class="mb-3 mt-5 bread">Product Detail</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/public/index">Home</a></span> <span>Product
							Detail</span>
					</p>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 mb-5 ftco-animate">
				<a href="${defines.urlPublic}/images/menu-2.jpg" class="image-popup"><img
					src="${pageContext.request.contextPath }/uploads/${food.image}"
					class="img-fluid" alt="Colorlib Template"></a>
			</div>
			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
				<h3>${food.name}</h3>
				<p class="price">
					<span style="color: #F8B500;">${defines.formatNumber(food.price)} <u>đ</u> </span>
				</p>
				<p>${food.previews}</p>
				<p>${food.detail}</p>
				<form action="${pageContext.request.contextPath}/public/news/addcart-product/${food.stt}">
					<div class="row mt-4">
						<div class="col-md-6">
							<div class="form-group d-flex">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="">
									<i class="icon-minus"></i>
								</button>
							</span> <input type="text" id="quantity" name="quantity"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="">
									<i class="icon-plus"></i>
								</button>
							</span>
						</div>
					</div>
					<p>
						<input type="submit" value="Add to Cart" onclick="TB();"
							class="btn btn-primary py-3 px-5">
					</p>
				</form>
			</div>
		</div>
	</div>
</section>
<<script type="text/javascript">
 function TB() {
	alert('Đã thêm vào giỏ hàng.');
}
</script>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<span class="subheading">Discover</span>
				<h2 class="mb-4">Related products</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
		<div class="row">
			<c:forEach var="news" items="${listCats}">
				<div class="col-md-3">
					<div class="menu-entry">
						<a
							href="${pageContext.request.contextPath}/public/product-single/${news.product_code}"
							class="img"
							style="background-image: url(${pageContext.request.contextPath }/uploads/${news.image});"></a>
						<div class="text text-center pt-4">
							<h3>
								<a href="#">${news.name}</a>
							</h3>
							<p>${news.previews}</p>
							<p class="price">
								<span><span>${news.price}</span>$</span>
							</p>
							<p>
								<a href="#" class="btn btn-primary btn-outline-primary">Add
									to Cart</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
