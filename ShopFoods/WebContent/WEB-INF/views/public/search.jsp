<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="home-slider owl-carousel">
	<c:forEach var="slide" items="${listSlide}">
		<div class="slider-item"
			style="background-image: url(${pageContext.request.contextPath }/slides/${slide.s_picture});">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center"
					data-scrollax-parent="true">

					<div class="col-md-8 col-sm-12 text-center ftco-animate">
						<span class="subheading">Welcome</span>
						<h1 class="mb-4">Food ordering</h1>
						<p class="mb-4 mb-md-5">A small river named Duden flows by
							their place and supplies it with the necessary regelialia.</p>
						<p>
							<a href="#" class="btn btn-primary p-3 px-xl-4 py-xl-3">Order
								Now</a> <a
								href="${pageContext.request.contextPath}/public/news/menu"
								class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">View
								Menu</a>
						</p>
					</div>

				</div>
			</div>
		</div>
	</c:forEach>
</section>




<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<span class="subheading">Discover</span>
				<h2 class="mb-4">Best Coffee Sellers</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${listNews}" var="news">
				<div class="col-md-3">
					<div class="menu-entry">
						<a
							href="${pageContext.request.contextPath}/public/product-single/${news.product_code}"
							class="img"
							style="background-image: url(${pageContext.request.contextPath }/uploads/${news.image});"></a>
						<div class="text text-center pt-4">
							<h3>
								<a
									href="${pageContext.request.contextPath}/public/product-single/${news.product_code}">${news.name}</a>
							</h3>
							<p>${news.previews}</p>
							<p class="price">
								<span><span>$</span>${news.price}</span>
							</p>
							<p>
								<a href="javascript:;"
									class="btn btn-primary btn-outline-primary"
									onclick="addcart(${news.stt});" >Add to Cart</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<script>
						function addcart(stt) {
							alert(' Đã thêm sản phẩm vào giỏ hàng.'),
							 $
									.ajax({
										url : '${pageContext.request.contextPath}/public/news/addcart/'
												+ stt,
										type : 'GET',
										cache : false,
										data : {
										//Dữ liệu gửi đi
										},
										success : function(data) {
											// Xử lý thành công
											$('#addcart').html(data);
										},
										error : function() {
											alert('lỗi!');
										}
									});
						}
					</script>
<section class="ftco-gallery">
	<div class="container-wrap">
		<div class="row no-gutters">
			<c:forEach items="${listSlide}" var="slide">
				<div class="col-md-3 ftco-animate">
					<a href="gallery.html"
						class="gallery img d-flex align-items-center"
						style="background-image: url(${pageContext.request.contextPath }/slides/${slide.s_picture});">
						<div
							class="icon mb-4 d-flex align-items-center justify-content-center">
							<span class="icon-search"></span>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<section class="ftco-section img" id="ftco-testimony"
	style="background-image: url(${defines.urlPublic}/images/bg_1.jpg);"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">Testimony</span>
				<h2 class="mb-4">Customers Says</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
	</div>
	<div class="container-wrap">
		<div class="row d-flex no-gutters">
			<div class="col-lg align-self-sm-end ftco-animate">
				<div class="testimony">
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however a small.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="${defines.urlPublic}/images/person_1.jpg" alt="">
						</div>
						<div class="name align-self-center">
							Louise Kelly <span class="position">Illustrator Designer</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end">
				<div class="testimony overlay">
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however a small line of blind text by the name of Lorem Ipsum
							decided to leave for the far World of Grammar.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="${defines.urlPublic}/images/person_2.jpg" alt="">
						</div>
						<div class="name align-self-center">
							Louise Kelly <span class="position">Illustrator Designer</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end ftco-animate">
				<div class="testimony">
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however a small line of blind text by the name. &rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="${defines.urlPublic}/images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">
							Louise Kelly <span class="position">Illustrator Designer</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end">
				<div class="testimony overlay">
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however.&rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="${defines.urlPublic}/images/person_2.jpg" alt="">
						</div>
						<div class="name align-self-center">
							Louise Kelly <span class="position">Illustrator Designer</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg align-self-sm-end ftco-animate">
				<div class="testimony">
					<blockquote>
						<p>&ldquo;Even the all-powerful Pointing has no control about
							the blind texts it is an almost unorthographic life One day
							however a small line of blind text by the name. &rdquo;</p>
					</blockquote>
					<div class="author d-flex mt-4">
						<div class="image mr-3 align-self-center">
							<img src="${defines.urlPublic}/images/person_3.jpg" alt="">
						</div>
						<div class="name align-self-center">
							Louise Kelly <span class="position">Illustrator Designer</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



