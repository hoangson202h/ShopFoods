<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
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
		<c:forEach var="food" items="${listFoods}">
			<tr class="text-center">
				<td class="product-remove"><a href="javascript:;"
					onclick="del(${food.stt});"><span class="icon-close"></span></a></td>

				<td class="image-prod"><div class="img"
						style="background-image:url(${pageContext.request.contextPath }/uploads/${food.image});"></div></td>

				<td class="product-name">
					<h3>${food.name}</h3>
					<p>${food.previews}</p>
				</td>
				<td class="price">$<span>${food.price}</span></td>
				<td class="quantity">
					<div class="input-group mb-3">
						<input type="text" name="quantity"
							class="quantity form-control input-number"
							value="${food.quantity}" min="1" max="100">
					</div>
				</td>

				<td class="total">$<span>${food.price*food.quantity}</span></td>
			</tr>
			<!-- END TR-->
		</c:forEach>
	</tbody>
</table>