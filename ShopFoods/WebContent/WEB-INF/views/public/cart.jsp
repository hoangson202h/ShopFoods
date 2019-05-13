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
					<h1 class="mb-3 mt-5 bread">Cart</h1>
				</div>

			</div>
		</div>
	</div>
</section>

<section class="ftco-section ftco-cart">
	<div class="container">
		<div class="row">
			<div class="col-md-12 ftco-animate">
				<div class="cart-list">
					<table class="table" id="delFood">
						<thead class="thead-primary">
							<tr class="text-center">
								<th>delete</th>
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
									<td class="product-remove"><a href="javascript:;"
										onclick="del(${food.stt});"><span class="icon-close"></span></a></td>

									<td class="image-prod"><div class="img"
											style="background-image:url(${pageContext.request.contextPath }/uploads/${food.image});"></div></td>

									<td class="product-name">
										<h3>${food.name}</h3>
										<p>${food.previews}</p>
									</td>
									<td class="price"><span>${defines.formatNumber(food.price)} <u>đ</u></span></td>
									<td class="quantity">
										<div class="input-group mb-3">
											<input onchange="update(${food.stt},this.value);" type="text"
												name="quantity" class="quantity form-control input-number"
												value="${food.quantity}" min="1" max="100">
										</div>
									</td>

									<td class="total"><span> ${defines.formatNumber(food.price*food.quantity)} <u>đ</u></span></td>
								</tr>
								<!-- END TR-->
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script>
						function update(stt,val) {
							window.location='${pageContext.request.contextPath}/public/news/update/'+stt+"/"+val;
						}
						function del(stt) {
							 $
									.ajax({
										url : '${pageContext.request.contextPath}/public/news/del/'
												+ stt,
										type : 'GET',
										cache : false,
										data : {
										//Dữ liệu gửi đi
										},
										success : function(data) {
											// Xử lý thành công
											$('#delFood').html(data);
										},
										error : function() {
											alert('lỗi!');
										}
									});
							 $
								.ajax({
									url : '${pageContext.request.contextPath}/public/news/delcart',
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

		<div class="row justify-content-end">
			<div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
				<c:if test="${tongtien !=0}">
					<div class="cart-total mb-3">
						<h3>Cart Totals</h3>
						<p class="d-flex">
							<span>Subtotal</span> <span>${defines.formatNumber(tongtien)} <u>đ</u></span>
						</p>
						<hr>
						<p class="d-flex total-price">
							<span>Total</span> <span>${defines.formatNumber(tongtien)} <u>đ</u></span>
						</p>
					</div>
					<p class="text-center">
						<a
							href="${pageContext.request.contextPath}/public/news/checkout/${tongtien}"
							class="btn btn-primary py-3 px-4">Next >></a>
					</p>
				</c:if>
			</div>
		</div>
		<c:if test="${tongtien ==0}">
			<div style="text-align: center;">
				<span style="color: red; font-size: 30px">Chưa có sản phẩm
					nào.</span>
			</div>
		</c:if>
	</div>
</section>

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
			<c:forEach var="food" items="${listFoodRand}">
				<div class="col-md-3">
					<div class="menu-entry">
						<a href="${pageContext.request.contextPath}/public/product-single/${food.product_code}" class="img"
							style="background-image: url(${pageContext.request.contextPath }/uploads/${food.image});"></a>
						<div class="text text-center pt-4">
							<h3>
								<a href="${pageContext.request.contextPath}/public/product-single/${food.product_code}">${food.name}</a>
							</h3>
							<p>${food.previews}</p>
							<p class="price">
								<span>${defines.formatNumber(food.price)} <u>đ</u></span>
							</p>
							<p>
								<a href="javascript:;" onclick="addcart(${food.stt});"
									class="btn btn-primary btn-outline-primary">Add to Cart</a>
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
