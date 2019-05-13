<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 30px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px; width: 1200px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px; text-align: center;">Quản
					Lý ShopFoods</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<form action="${pageContext.request.contextPath }/admin/news/giorac/search"
				method="post" style="float: right; width: 400px;">
				<div class="col-md-4" style="float: right; width: 280px;">
					<div class="input-group form">
						<input type="text" class="form-control" name="name"
							placeholder="tên sản phẩm..."> <span
							class="input-group-btn">
							<button class="btn btn-primary" type="submit">Search</button>
						</span>
					</div>
				</div>
			</form>
		</div>
		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<strong>${msg }</strong>
			</div>
		</c:if>
		<c:if test="${not empty msg0 }">
			<div class="alert alert-success">
				<strong Style="color: red;">${msg0 }</strong>
			</div>
		</c:if>
		<div class="row">
			<div class="panel-body">
				<form action="" name="fcheck">
					<table cellpadding="0" cellspacing="0" border="0"
						class="table table-striped table-bordered" id="example">
						<thead>
							<tr>
								<th>stt</th>
								<th>product code</th>
								<th>name food</th>
								<th>Danh mục</th>
								<th>price</th>
								<th>previews</th>
								<th>detail</th>
								<th>image</th>
								<th>status</th>
								<th>Sửa/Xóa tạm thời</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listNewsGR}" var="news">
								<c:set var="restoretUrl"
									value="${pageContext.request.contextPath }/admin/news/restore/${news.product_code}"></c:set>
								<c:set var="delUrl"
									value="${pageContext.request.contextPath }/admin/news/del/${news.product_code}"></c:set>
								<tr class="odd gradeX">
									<td>${news.stt}</td>
									<td style="width: 12%">${news.product_code}</td>
									<td>${news.name}</td>
									<td>${news.category_name}</td>
									<td>${news.price}</td>
									<td>${news.previews}</td>
									<td>${news.detail}</td>
									<td class="center text-center"><c:choose>
											<c:when test="${not empty news.image }">
												<img Style="border-radius: 5px;" width="120px" height="90px"
													src="${pageContext.request.contextPath }/uploads/${news.image}" />
											</c:when>
											<c:otherwise>
												<p>không có hình ảnh</p>
											</c:otherwise>
										</c:choose></td>
									<td><c:if test="${news.status == 1}">
											<span>còn hàng</span>
										</c:if> <c:if test="${news.status == 0}">
											<span>hết hàng</span>
										</c:if></td>
									<td class="center text-center"><a href="${restoretUrl }"
										title="" class="btn btn-primary"
										style="background-color: #26B99A; padding: 3px 5px;"><span
											class=""></span> Restore</a> <a
										onclick="return confirm('Ban co muon xoa?')" href="${delUrl}"
										title="" class="btn btn-danger"> <span
											class="glyphicon glyphicon-trash"></span> Xóa
									</a></td>
								</tr>
							</c:forEach>
					</table>
				</form>
				<form action="${pageContext.request.contextPath}/admin/news/giorac"
					style="float: right; margin-right: 50px;">
					<div>
						<a href="${pageContext.request.contextPath}/admin/news/giorac"
							style=""><image Style="border-radius: 5px;"
								src="${defines.urlAdmin}/images/gr.jpg" width="50" height="50"></image></a><br />
						<span style="margin-left: 4px;"><a
							href="${pageContext.request.contextPath}/admin/cats/giorac">Giỏ
								rác</a> </span>
					</div>
				</form>
				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li><a
							href="${pageContext.request.contextPath }/admin/news/giorac/1">
								<< </a></li>
						<c:forEach var="i" begin="1" end="${sumPage }">
							<li <c:if test="${page == i }">class="active"</c:if>><a
								href="${pageContext.request.contextPath }/admin/news/giorac/${i}">${i }
									<span class="sr-only">(current)</span>
							</a></li>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath }/admin/news/giorac/${sumPage}">
								>> </a></li>
					</ul>
				</nav>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->
</div>