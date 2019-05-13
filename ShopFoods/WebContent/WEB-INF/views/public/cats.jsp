<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="row" id="listNewsID">
	<c:forEach var="news" items="${listNewsID}">
		<div class="col-md-4 text-center">
			<div class="menu-wrap">
				<a href="${pageContext.request.contextPath}/public/product-single/${news.product_code}" class="menu-img img mb-4"
					style="background-image: url(${pageContext.request.contextPath }/uploads/${news.image});"></a>
				<div class="text">
					<h3>
						<a href="${pageContext.request.contextPath}/public/product-single/${news.product_code}">${news.name}</a>
					</h3>
					<p>${news.previews}</p>
					<p class="price">
						<span style="color: #F8B500;">${defines.formatNumber(news.price)} <u>đ</u> </span>
					</p>
					<p>
						<a href="#" class="btn btn-primary btn-outline-primary">Add to
							cart</a>
					</p>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
