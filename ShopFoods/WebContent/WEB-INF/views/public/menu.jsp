<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="home-slider owl-carousel">
	<c:forEach items="${listSlide}" var="slide">
		<div class="slider-item"
			style="background-image: url(${pageContext.request.contextPath }/slides/${slide.s_picture});"
			data-stellar-background-ratio="0.5">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row slider-text justify-content-center align-items-center">

					<div class="col-md-7 col-sm-12 text-center ftco-animate">
						<h1 class="mb-3 mt-5 bread">Our Menu</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="${pageContext.request.contextPath}/public/index">Home</a></span> <span>Menu</span>
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
				<h3>Book a Table</h3>
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
						<div class="form-group ml-md-4">
							<input type="text" class="form-control" placeholder="Phone">
						</div>
					</div>
					<div class="d-md-flex">
						<div class="form-group">
							<textarea name="" id="" cols="30" rows="2" class="form-control"
								placeholder="Message"></textarea>
						</div>
						<div class="form-group ml-md-4">
							<input type="submit" value="Appointment"
								class="btn btn-white py-3 px-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<c:forEach items="${listCats}" var="cats">
				<div class="col-md-6 mb-5 pb-3">
					<h3 class="mb-5 heading-pricing ftco-animate">${cats.category_name}</h3>
					<c:forEach items="${listNews}" var="news">
						<c:if test="${cats.id_cat == news.id_category}">
							<div class="pricing-entry d-flex ftco-animate">
								<a href="${pageContext.request.contextPath}/public/product-single/${news.product_code}"><div class="img"
									style="background-image: url(${pageContext.request.contextPath }/uploads/${news.image});"></div></a>
								<div class="desc pl-3">
									<div class="d-flex text align-items-center">
										<h3>
											<a href="${pageContext.request.contextPath}/public/product-single/${news.product_code}"><span>${news.name}</span></a>
										</h3>
										<span style="color: #F8B500;">${defines.formatNumber(news.price)} <u>đ</u> </span>
									</div>
									<div class="d-block">
										<p>${news.previews}</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<section class="ftco-menu mb-5 pb-5">
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
														<span>$<span>${news.price}</span></span>
													</p>
													<p>
														<a href="#" class="btn btn-primary btn-outline-primary">Add
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
	</div>
</section>

