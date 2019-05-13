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

<section class="ftco-intro">
	<div class="container-wrap">
		<div class="wrap d-md-flex align-items-xl-end">
			<div class="info">
				<div class="row no-gutters">
					<div class="col-md-4 d-flex ftco-animate">
						<div class="icon">
							<span class="icon-phone"></span>
						</div>
						<div class="text">
							<h3>000 (123) 456 7890</h3>
							<p>A small river named Duden flows by their place and
								supplies.</p>
						</div>
					</div>
					<div class="col-md-4 d-flex ftco-animate">
						<div class="icon">
							<span class="icon-my_location"></span>
						</div>
						<div class="text">
							<h3>198 West 21th Street</h3>
							<p>203 Fake St. Mountain View, San Francisco, California, USA</p>
						</div>
					</div>
					<div class="col-md-4 d-flex ftco-animate">
						<div class="icon">
							<span class="icon-clock-o"></span>
						</div>
						<div class="text">
							<h3>Open Monday-Friday</h3>
							<p>8:00am - 9:00pm</p>
						</div>
					</div>
				</div>
			</div>
			<div class="book p-4">
				<c:if test="${not empty msgbook}">
					<p style="color: red;">${msgbook}</p>
				</c:if>
				<h3>Book a Table</h3>
				<form action="${pageContext.request.contextPath}/public/booktable" class="appointment-form">
					<div class="d-md-flex">
						<div class="form-group">
							<input value="${book.fname}" type="text" class="form-control" placeholder="First Name" name="fname" required="required">
						</div>
						<div class="form-group ml-md-4">
							<input value="${book.lname}" type="text" class="form-control" placeholder="Last Name" name="lname" required="required">
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<div class="input-wrap">
								<div class="icon">
									<span class="ion-md-calendar"></span>
								</div>
								<input value="${book.date}" type="text" class="form-control appointment_date"
									placeholder="Date" name="date" required="required">
							</div>
						</div>
						<div class="form-group ml-md-4">
							<div class="input-wrap">
								<div class="icon">
									<span class="ion-ios-clock"></span>
								</div>
								<input value="" type="text" class="form-control appointment_time"
									placeholder="Time" name="time" required="required" >
							</div>
						</div>
						<div class="form-group ml-md-4">
							<input value="${book.number}" type="text" class="form-control" placeholder="table" name="number" required="required">
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group" style="margin-top: 12px;">
							<input value="${book.phone}" type="text" class="form-control" placeholder="Phone" name="phone" required="required">
						</div>
						<div class="form-group" style="margin-left: 5px;">
							<textarea   cols="30" rows="3" class="form-control"
								placeholder="Message" name="message"></textarea>
						</div>
						<div class="form-group ml-md-4" style="margin-top: 20px">
							<input type="submit" value="Appointment"
								class="btn btn-white py-3 px-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<section class="ftco-about d-md-flex">
	<div class="one-half img"
		style="background-image: url(${pageContext.request.contextPath}/slides/${picture.s_picture});"></div>
	<div class="one-half ftco-animate">
		<div class="overlap">
			<div class="heading-section ftco-animate ">
				<span class="subheading">Discover</span>
				<h2 class="mb-4">Our Story</h2>
			</div>
			<div>
				<p>On her way she met a copy. The copy warned the Little Blind
					Text, that where it came from it would have been rewritten a
					thousand times and everything that was left from its origin would
					be the word "and" and the Little Blind Text should turn around and
					return to its own, safe country. But nothing the copy said could
					convince her and so it didn’t take long until a few insidious Copy
					Writers ambushed her, made her drunk with Longe and Parole and
					dragged her into their agency, where they abused her for their.</p>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-services">
	<div class="container">
		<div class="row">
			<div class="col-md-4 ftco-animate">
				<div class="media d-block text-center block-6 services">
					<div
						class="icon d-flex justify-content-center align-items-center mb-5">
						<span class="flaticon-choices"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Easy to Order</h3>
						<p>Even the all-powerful Pointing has no control about the
							blind texts it is an almost unorthographic.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ftco-animate">
				<div class="media d-block text-center block-6 services">
					<div
						class="icon d-flex justify-content-center align-items-center mb-5">
						<span class="flaticon-delivery-truck"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Fastest Delivery</h3>
						<p>Even the all-powerful Pointing has no control about the
							blind texts it is an almost unorthographic.</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 ftco-animate">
				<div class="media d-block text-center block-6 services">
					<div
						class="icon d-flex justify-content-center align-items-center mb-5">
						<span class="flaticon-coffee-bean"></span>
					</div>
					<div class="media-body">
						<h3 class="heading">Quality Coffee</h3>
						<p>Even the all-powerful Pointing has no control about the
							blind texts it is an almost unorthographic.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-6 pr-md-5">
				<div class="heading-section text-md-right ftco-animate">
					<span class="subheading">Discover</span>
					<h2 class="mb-4">Our Menu</h2>
					<p class="mb-4">Far far away, behind the word mountains, far
						from the countries Vokalia and Consonantia, there live the blind
						texts. Separated they live in Bookmarksgrove right at the coast of
						the Semantics, a large language ocean.</p>
					<p>
						<a href="${pageContext.request.contextPath}/public/news/menu"
							class="btn btn-primary btn-outline-primary px-4 py-3">View
							Full Menu</a>
					</p>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row">
					<c:forEach var="food" items="${listPicture}">
						<div class="col-md-6" style="border-radius: 5px;">
							<div class="menu-entry">
								<a
									href="${pageContext.request.contextPath}/public/product-single/${food.product_code}"
									class="img"
									style="background-image: url(${pageContext.request.contextPath }/uploads/${food.image});"></a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="ftco-counter ftco-bg-dark img" id="section-counter"
	style="background-image: url(${defines.urlPublic}/images/bg_2.jpg);"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="row">
					<div
						class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon">
									<span class="flaticon-coffee-cup"></span>
								</div>
								<strong class="number" data-number="100">0</strong> <span>Coffee
									Branches</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon">
									<span class="flaticon-coffee-cup"></span>
								</div>
								<strong class="number" data-number="85">0</strong> <span>Number
									of Awards</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon">
									<span class="flaticon-coffee-cup"></span>
								</div>
								<strong class="number" data-number="10567">0</strong> <span>Happy
									Customer</span>
							</div>
						</div>
					</div>
					<div
						class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
						<div class="block-18 text-center">
							<div class="text">
								<div class="icon">
									<span class="flaticon-coffee-cup"></span>
								</div>
								<strong class="number" data-number="900">0</strong> <span>Staff</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
								<span style="color: #F8B500;">${defines.formatNumber(news.price)} <u>đ</u> </span>
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

<section class="ftco-menu">
	<div class="container">
		<div class="row justify-content-center mb-5">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span class="subheading">Discover</span>
				<h2 class="mb-4">Our Products</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
		<div class="row d-md-flex">
			<div class="col-lg-12 ftco-animate p-md-5">
				<div class="row">
					<div class="col-md-12 nav-link-wrap mb-5">
						<div class="nav ftco-animate nav-pills justify-content-center"
							id="v-pills-tab" role="tablist" aria-orientation="vertical">
							<c:forEach items="${listCats}" var="cats">
								<a class="nav-link" id="v-pills-2-tab" data-toggle="pill"
									href="javascript:;" onclick="handle(${cats.id_cat});"
									role="tab" aria-controls="v-pills-2" aria-selected="false">${cats.category_name}</a>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-12 d-flex align-items-center">
						<div class="tab-content ftco-animate" id="v-pills-tabContent">
							<div class="tab-pane fade show active" id="v-pills-1"
								role="tabpanel" aria-labelledby="v-pills-1-tab">
								<div class="row" id="listNewsID">
									<c:forEach var="news" items="${listNewsID}">
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a
													href="${pageContext.request.contextPath}/public/product-single/${news.product_code}"
													class="menu-img img mb-4"
													style="background-image: url(${pageContext.request.contextPath }/uploads/${news.image});"></a>
												<div class="text">
													<h3>
														<a
															href="${pageContext.request.contextPath}/public/product-single/${news.product_code}">${news.name}</a>
													</h3>
													<p>${news.previews}</p>
													<p class="price">
														<span style="color: #F8B500;">${defines.formatNumber(news.price)} <u>đ</u> </span>
													</p>
													<p>
														<a href="javascript:;" class="btn btn-primary btn-outline-primary" onclick="addcart(${news.stt});">Add
															to cart</a>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
						function handle(id_cat) {
							$
									.ajax({
										url : '${pageContext.request.contextPath}/public/cats/'
												+ id_cat,
										type : 'GET',
										cache : false,
										data : {
										//Dữ liệu gửi đi
										},
										success : function(data) {
											// Xử lý thành công
											$('#listNewsID').html(data);
										},
										error : function() {
											alert('lỗi!');
										}
									});
						}
					</script>
			</div>
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

<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<h2 class="mb-4">Recent from blog</h2>
				<p>Far far away, behind the word mountains, far from the
					countries Vokalia and Consonantia, there live the blind texts.</p>
			</div>
		</div>
		<div class="row d-flex">
			<c:forEach items="${listNewsNews}" var="news">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch">
						<a
							href="${pageContext.request.contextPath}/public/product-single/${news.product_code}"
							class="block-20"
							style="background-image: url('${pageContext.request.contextPath }/uploads/${news.image}');">
						</a>
						<div class="text py-4 d-block">
							<div class="meta">
								<div>
									<a>Sept 4, 2019</a>
								</div>
								<div>
									<a>Admin</a>
								</div>
								<div>
									<a class="meta-chat"><span class="icon-chat"></span> 7</a>
								</div>
							</div>
							<h3 class="heading mt-2">
								<a
									href="${pageContext.request.contextPath}/public/product-single/${news.product_code}">${news.name}</a>
							</h3>
							<p>{news.previews} đ.</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>


<section class="ftco-appointment">
	<div class="overlay"></div>
	<div class="container-wrap">
		<div class="row no-gutters d-md-flex align-items-center">
			<div class="col-md-6 d-flex align-self-stretch">
				<div id="map"></div>
			</div>
			<div class="col-md-6 appointment ftco-animate">
				<h3 class="mb-3">Book a Table</h3>
				<form action="#" class="appointment-form">
					<div class="d-md-flex">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="First Name">
						</div>
						<div class="form-group ml-md-4">
							<input type="text" class="form-control" placeholder="Last Name">
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<div class="input-wrap">
								<div class="icon">
									<span class="ion-md-calendar"></span>
								</div>
								<input type="text" class="form-control appointment_date"
									placeholder="Date">
							</div>
						</div>
						<div class="form-group ml-md-4">
							<div class="input-wrap">
								<div class="icon">
									<span class="ion-ios-clock"></span>
								</div>
								<input type="text" class="form-control appointment_time"
									placeholder="Time">
							</div>
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<textarea name="" id="" cols="30" rows="2" class="form-control"
								placeholder="Message"></textarea>
						</div>
						<div class="form-group ml-md-4">
							<input type="submit" value="Appointment"
								class="btn btn-primary py-3 px-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

