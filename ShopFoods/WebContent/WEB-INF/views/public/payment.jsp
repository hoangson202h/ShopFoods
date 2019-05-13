<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
		<div>
			<h3 style="text-align: center;">order details</h3>
		</div>
		<div class="row">
			<div class="col-xl-8 ftco-animate">
				<div class="row" style="width: 1200px;">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table" id="delFood">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>image</th>
										<th>Product</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="${0}" var="tongtien"></c:set>
									<c:forEach var="food" items="${listFoods}">
										<c:set value="${food.quantity * food.price}" var="thanhtien"></c:set>
										<c:set value="${tongtien + thanhtien}" var="tongtien"></c:set>
										<tr class="text-center">

											<td class="image-prod"><div class="img"
													style="background-image:url(${pageContext.request.contextPath }/uploads/${food.image});"></div></td>

											<td class="product-name">
												<h3>${food.name}</h3>
												<p>${food.previews}</p>
											</td>
											<td class="price"><span style="color: #F8B500;">${defines.formatNumber(food.price)}
													<u>đ</u>
											</span></td>
											<td class="quantity">
												<div class="input-group mb-3">
													<input onchange="update(${food.stt},this.value);"
														type="text" name="quantity"
														class="quantity form-control input-number"
														value="${food.quantity}" min="1" max="100"
														readonly="readonly">
												</div>
											</td>

											<td class="total"><span style="color: #F8B500;">${defines.formatNumber(food.price*food.quantity)}
													<u>đ</u>
											</span></td>
										</tr>
										<!-- END TR-->
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br />
				<br />
				<h3 style="text-align: center; margin-left: 450px;">Customer
					details</h3>

				<div class="row" style="width: 1200px;">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table" id="delFood">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>name</th>
										<th>email</th>
										<th>address</th>
										<th>phone</th>
										<th>message</th>
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<td class="product-name">
											<h3>${customer.name}</h3>
										</td>
										<td class="email"><span>${customer.email}</span></td>
										<td class="address"><span>${customer.address}<span>,</span>
												<c:if test="${customer.county==1}">Quận Hải Châu</c:if> <c:if
													test="${customer.county==2}">Quận Cẩm Lệ</c:if> <c:if
													test="${customer.county==3}">Quận Thanh Khê</c:if> <c:if
													test="${customer.county==4}">Quận Liên Chiểu</c:if> <c:if
													test="${customer.county==5}">Quận Ngũ Hành Sơn</c:if> <c:if
													test="${customer.county==6}">Quận Sơn Trà</c:if> <c:if
													test="${customer.county==7}">Huyện Hòa Vang</c:if></td>
										<td class="phone"><span>${customer.phone}<span></td>
										<td class="message"><span>${customer.message}<span></td>
									</tr>
									<!-- END TR-->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row mt-5 pt-3 d-flex">
					<div class="col-md-6 d-flex">
						<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
							<h3 class="billing-heading mb-4">Cart Total</h3>
							<p class="d-flex">
								<span>Subtotal</span> <span style="color: #F8B500;">${defines.formatNumber(tongtien)}
									<u>đ</u>
								</span>
							</p>

							<c:if test="${customer.county==1 || customer.county==3}">
								<c:set value="6000" var="delivery"></c:set>
							</c:if>
							<c:if test="${customer.county==2 || customer.county==4}">
								<c:set value="5000" var="delivery"></c:set>
							</c:if>
							<c:if test="${customer.county==5 || customer.county==7}">
								<c:set value="7000" var="delivery"></c:set>
							</c:if>
							<c:if test="${customer.county==6}">
								<c:set value="8000" var="delivery"></c:set>
							</c:if>

							<p class="d-flex">
								<span>Delivery</span> <span> <span
									style="color: #F8B500;">${defines.formatNumber(delivery)}
										<u>đ</u>
								</span>
								</span>
							</p>
							<hr>
							<c:set value="${tongtien-delivery}" var="payment"></c:set>
							<p class="d-flex total-price">
								<span>Total</span> <span>${defines.formatNumber(payment)}
									<u>đ</u>
								</span>
							</p>
						</div>
					</div>
					<div class="col-md-6" style="width: 300px; float: right;">
						<form
							action="${pageContext.request.contextPath }/public/news/payment/1">
							<div class="cart-detail ftco-bg-dark p-3 p-md-4">
								<h3 class="billing-heading mb-4">Payment Method</h3>
								<div class="form-group">
									<div class="col-md-12">
										<span style="margin-bottom: 10px;">. Thanh toán qua
											paypal</span><br />
										<div class="radio" style="border-radius: 5px;">
											<input type="submit" value="Payment on delivery" class="mr-2"
												style="background-color: #F8B500; color: white; padding: 3px 15px; border-radius: 5px;" />
										</div>
									</div>
								</div>
								<span style="margin-left: 10px;">. Thanh toán qua paypal</span><br />
								<div style="margin-right: 10px; margin-left: 15px;"
									id="paypal-button-container"></div>
							</div>
						</form>
					</div>
				</div>

				<!-- .col-md-8 -->
				<c:set value="${payment/23200 + payment%23200}" var="payment"></c:set>
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
				<script src="https://www.paypalobjects.com/api/checkout.js"></script>
				<script>
			paypal.Button
					.render(
							{

								env : 'sandbox', // sandbox | production

								// PayPal Client IDs - replace with your own
								// Create a PayPal app: https://developer.paypal.com/developer/applications/create
								client : {
									sandbox : 'AW1q-4bdOWJScF7k8d246gGA80H57ru18n_z98ynxHNv8IWkcZl97bqWFHneQOVEquZggwQWhneFDppW',
									production : '<insert production client id>'
								},

								// Show the buyer a 'Pay Now' button in the checkout flow
								commit : true,

								// payment() is called when the button is clicked
								payment : function(data, actions) {

									// Make a call to the REST api to create the payment
									return actions.payment.create({
										payment : {
											transactions : [ {
												amount : {
													total : '${payment}',
													currency : 'USD'
												}
											} ]
										}
									});
								},

								// onAuthorize() is called when the buyer approves the payment
								onAuthorize : function(data, actions) {

									// Make a call to the REST api to execute the payment
									return actions.payment
											.execute()
											.then(
													function() {
														/* window
																.alert('Payment Complete!'); */
														window.location.href = "${pageContext.request.contextPath }/public/news/payment/2"
													});
								}

							}, '#paypal-button-container');
		</script>
			</div>
		</div>
	</div>
</section>
<!-- .section -->

