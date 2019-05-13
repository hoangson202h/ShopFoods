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
					<h1 class="mb-3 mt-5 bread">My Order</h1>
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
								<th>image</th>
								<th>Product</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>status</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:set value="${0}" var="tongtien"></c:set>
							<c:forEach var="order" items="${listOrder}">
								<c:set value="${order.quantity * order.product_price}"
									var="thanhtien"></c:set>
								<c:set value="${tongtien + thanhtien}" var="tongtien"></c:set>
								<tr class="text-center">
									<td class="image-prod"><div class="img"
											style="background-image:url(${pageContext.request.contextPath }/uploads/${order.picture});"></div></td>

									<td class="product-name">
										<h3>${order.product_name}</h3>
									</td>
									<td class="price"><span style="color: #F8B500;">${defines.formatNumber(order.product_price)}
											<u>đ</u>
									</span></td>
									<td class="quantity">
										<div class="input-group mb-3">
											<input type="text" readonly="readonly" name="quantity"
												class="quantity form-control input-number"
												value="${order.quantity}" min="1" max="100">
										</div>
									</td>
									<td><c:if test="${cus.check_st==0}">đang tiến hành.</c:if>
										<c:if test="${cus.check_st==1}">đang giao.</c:if> <c:if
											test="${cus.check_st==2}">đã giao.</c:if></td>
									<td class="total"><span style="color: #F8B500;">${defines.formatNumber(tongtien)}
											<u>đ</u></td>
								</tr>
								<!-- END TR-->
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row justify-content-end">
			<div class="col col-lg-3 col-md-6 mt-5 cart-wrap ftco-animate">
				<c:if test="${tongtien !=0}">
					<div class="cart-total mb-3">
						<c:if test="${cus.county==1 || cus.county==3}">
							<c:set value="6000" var="delivery"></c:set>
						</c:if>
						<c:if test="${cus.county==2 || cus.county==4}">
							<c:set value="5000" var="delivery"></c:set>
						</c:if>
						<c:if test="${cus.county==5 || cus.county==7}">
							<c:set value="7000" var="delivery"></c:set>
						</c:if>
						<c:if test="${cus.county==6}">
							<c:set value="8000" var="delivery"></c:set>
						</c:if>
						<h3>Cart Totals</h3>
						<p class="d-flex">
							<span>Subtotal</span> <span style="color: #F8B500;">${defines.formatNumber(tongtien)}
								<u>đ</u>
						</p>
						<p class="d-flex">
							<span>Delivery</span> <span> <span style="color: #F8B500;">${defines.formatNumber(delivery)}
									<u>đ</u>
							</span>
							</span>
						</p>
						<hr>
						<p class="d-flex total-price">
							<span>Total</span><span style="color: #F8B500;">${defines.formatNumber(tongtien-delivery)}
								<u>đ</u>
						</p>
					</div>
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


