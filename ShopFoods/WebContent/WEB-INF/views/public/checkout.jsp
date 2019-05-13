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
					<h1 class="mb-3 mt-5 bread">Checkout</h1>
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/public/index">Home</a></span> <span>Checout</span>
					</p>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-section">
	<div class="container">
		<div class="row">
			<div class="col-xl-8 ftco-animate">
				<form action="${pageContext.request.contextPath}/public/news/payment" class="billing-form ftco-bg-dark p-3 p-md-5" id="infuser">
					<h3 class="mb-4 billing-heading">Billing Details</h3>
					<div class="row align-items-end">
						<div class="col-md-6">
							<div class="form-group">
								<label for="firstname">Fullname *</label> <input type="text"
									class="form-control" name="name" placeholder=""
									required="required"  value="${user.fullname}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="lastname">Phone *</label> <input type="text"
									name="phone" class="form-control" placeholder="phone"
									required="required" value="${infuser.phone}">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="streetaddress">County *</label>
								<select name="county" class="form-control" style="background-color: black;">
									<option value="1" <c:if test="${infuser.county == 1}"></c:if> style="background-color: black;">Quận Hải Châu</option>
									<option value="2" <c:if test="${infuser.county == 2}">selected="selected"</c:if> style="background-color: black;">Quận Cẩm Lệ</option>
									<option value="3" <c:if test="${infuser.county == 3}">selected="selected"</c:if> style="background-color: black;">Quận Thanh Khê</option>
									<option value="4" <c:if test="${infuser.county == 4}">selected="selected"</c:if> style="background-color: black;">Quận Liên Chiểu</option>
									<option value="5" <c:if test="${infuser.county == 5}">selected="selected"</c:if> style="background-color: black;">Quận Ngũ Hành Sơn</option>
									<option value="6" <c:if test="${infuser.county == 6}">selected="selected"</c:if> style="background-color: black;">Quận Sơn Trà</option>
									<option value="7" <c:if test="${infuser.county == 7}">selected="selected"</c:if> style="background-color: black;">Huyện Hòa Vang</option>
								</select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="streetaddress">Address *</label> <input type="text"
									class="form-control" placeholder="House number and street name"
									required="required" value="${infuser.address}" name="address">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">Email *</label> <input type="email"
									class="form-control" placeholder="email" required="required"
									value="${infuser.email}" name="email">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="message">Message </label>
								<textarea rows="5" cols="85"
									style="background-color: black; color: white;" name="message"></textarea>
							</div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-6" id="password"></div>

						<div class="w-100"></div>

					</div>
					<div class="w-100"></div>

					<!-- END -->
					<div class="col-md-6">

					<p>
						<input type="submit" class="btn btn-primary py-3 px-4"
							value="Next >>" style="margin-left: 28px;border-radius: 5px;"/>
					</p>
				</div>
				</form>
			</div>
			<!-- .col-md-8 -->

			<script type="text/javascript">
				function password() {
					$
							.ajax({
								url : '${pageContext.request.contextPath}/public/news/pass',
								type : 'GET',
								cache : false,
								data : {
								//Dữ liệu gửi đi
								},
								success : function(data) {
									// Xử lý thành công
									$('#password').html(data);
								},
								error : function() {
									alert('lỗi!');
								}
							});
				}
				function delpassword() {
					$
							.ajax({
								url : '${pageContext.request.contextPath}/public/news/del-pass',
								type : 'GET',
								cache : false,
								data : {
								//Dữ liệu gửi đi
								},
								success : function(data) {
									// Xử lý thành công
									$('#password').html(data);
								},
								error : function() {
									alert('lỗi!');
								}
							});
				}
			</script>

			<div class="col-xl-4 sidebar ftco-animate">
				<!-- <div class="sidebar-box">
					<form action="#" class="search-form">
						<div class="form-group">
							<div class="icon">
								<span class="icon-search"></span>
							</div>
							<input type="text" class="form-control" placeholder="Search...">
						</div>
					</form>
				</div> -->
				<div class="sidebar-box ftco-animate">
					<div class="categories">
						<h3>Categories</h3>
						<c:forEach var="food" items="${listFoods}">
							<li><a href="#">${food.category_name}<span>(${food.count})</span></a></li>
						</c:forEach>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Recent Blog</h3>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(${defines.urlPublic}/images/image_1.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(${defines.urlPublic}/images/image_2.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
					<div class="block-21 mb-4 d-flex">
						<a class="blog-img mr-4"
							style="background-image: url(${defines.urlPublic}/images/image_3.jpg);"></a>
						<div class="text">
							<h3 class="heading">
								<a href="#">Even the all-powerful Pointing has no control
									about the blind texts</a>
							</h3>
							<div class="meta">
								<div>
									<a href="#"><span class="icon-calendar"></span> July 12,
										2018</a>
								</div>
								<div>
									<a href="#"><span class="icon-person"></span> Admin</a>
								</div>
								<div>
									<a href="#"><span class="icon-chat"></span> 19</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Tag Cloud</h3>
					<div class="tagcloud">
						<a href="#" class="tag-cloud-link">dish</a> <a href="#"
							class="tag-cloud-link">menu</a> <a href="#"
							class="tag-cloud-link">food</a> <a href="#"
							class="tag-cloud-link">sweet</a> <a href="#"
							class="tag-cloud-link">tasty</a> <a href="#"
							class="tag-cloud-link">delicious</a> <a href="#"
							class="tag-cloud-link">desserts</a> <a href="#"
							class="tag-cloud-link">drinks</a>
					</div>
				</div>

				<div class="sidebar-box ftco-animate">
					<h3>Paragraph</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Ducimus itaque, autem necessitatibus voluptate quod mollitia
						delectus aut, sunt placeat nam vero culpa sapiente consectetur
						similique, inventore eos fugit cupiditate numquam!</p>
				</div>
			</div>

		</div>
	</div>
</section>
<!-- .section -->

