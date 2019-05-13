<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 30px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px; width: 1200px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px;text-align: center;">Quản
					Lý ShopFoods</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8" style="width: 200px;">
				<a href="${pageContext.request.contextPath }/admin/news/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>

			</div>
			<form action="${pageContext.request.contextPath }/admin/news/views"
				method="post" style="float: left; width: 400px;">
				<div class="col-md-4" style="float: right;width: 280px;"> 
					<div class="input-group form">
						<select onchange="viewsFoods();"
						style="float: left; margin-left: 10px; padding-top: 5px; width: 130px;padding-bottom: 11px;border-radius: 5px;"
						name="id_cat"  id="views">
						<option value="${0}">-- Tất Cả --</option>
						<c:forEach items="${listCats}" var="tem">
							<option
								<c:if test="${cid == tem.id_cat}">selected="selected"</c:if>
								value="${tem.id_cat}">${tem.category_name}</option>
						</c:forEach>
					</select>
							
					</div>
				</div>
			</form>
			<script type="text/javascript">
				function viewsFoods() {
					var views = $('#views').val();
					window.location='${pageContext.request.contextPath }/admin/news/views/'+ views;
				}
			</script>
			<form action="${pageContext.request.contextPath }/admin/news/search"
				method="post" style="float: right; width: 400px;">
				<div style="float: left;">
					<select
						style="float: left; margin-left: 10px; padding-top: 5px; width: 100px;padding-bottom: 10px;border-radius: 3px;"
						name="id_cat">
						<option value="${0}">-- Tất Cả --</option>
						<c:forEach items="${listCats}" var="tem">
							<option
								<c:if test="${cid == tem.id_cat}">selected="selected"</c:if>
								value="${tem.id_cat}">${tem.category_name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-md-4" style="float: right;width: 280px;"> 
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
							<th style="text-align: center; width: 100px;">Chọn tất cả
							<c:if test="${page == 1 }"><input
									type="checkbox" name="checkAll" name="checkAll"
									onclick="Check(document.fcheck.chk)">
									</c:if></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listNews}" var="news">
							<c:set var="editUrl"
								value="${pageContext.request.contextPath }/admin/news/edit/${news.product_code}/${page}"></c:set>
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/news/delTam/${news.product_code}"></c:set>
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
								<td>
								<c:if test="${news.status == 1}"><span>còn hàng</span></c:if>
								<c:if test="${news.status == 0}"><span>hết hàng</span></c:if>
								</td>
								<td class="center text-center"><a href="${editUrl }"
									title="" class="btn btn-primary"><span
										class="glyphicon glyphicon-pencil "></span> Sửa</a> <a
									 href="${delUrl}"
									title="" class="btn btn-danger"> <span
										class="glyphicon glyphicon-trash"></span> Xóa 
								</a></td>
								<td style="text-align: center;"><input type="checkbox"
										value="${news.product_code}" name="id_news" id="chk"></td>
							</tr>
						</c:forEach>
						<tr>
								<td colspan="10"></td>
								<td style="text-align: center;">
								<a
									href="#"
									onclick="xoatam();"><b>Xóa Tạm</b></a><br />
								 <a
									href="#"
									onclick="xoamai();"><b>Xóa ngay</b></a>
								</td>
							</tr>
					</tbody>
				</table>
				</form>
		<script type="text/javascript">
					$(document).ready(
							function() {
								// Sự kiện khi ô checkAll được check
								$("input[name='checkAll']").click(
										function() {

											// Thêm thuộc tính checked cho ô checkAll
											var checked = $(this).attr(
													"checked");

											// Thêm thuộc tính checked cho ô checkbox khác
											$("#myTable tr td input:checkbox")
													.attr("checked", checked);
										});
							});
				</script>

				<script type="text/javascript">
					function Check(chk) {
						if (document.fcheck.checkAll.checked == true) {
							for (i = 0; i < chk.length; i++)
								chk[i].checked = true;
						} else {
							for (i = 0; i < chk.length; i++)
								chk[i].checked = false;
						}
					}
					function xoatam() {
						// Khai báo tham số
						var checkbox = document.getElementsByName('id_news');
						var list_idnews = "";

						// Lặp qua từng checkbox để lấy giá trị
						for (var i = 0; i < checkbox.length; i++) {
							if (checkbox[i].checked === true) {
								list_idnews = list_idnews + "," + checkbox[i].value;
							}
						} 
						if(list_idnews === ""){
							alert('Vui lòng chọn.');
						}else{
							window.location='${pageContext.request.contextPath}/admin/news/delAllTam/'+ list_idnews;
						}
					};
					function xoamai() {
						// Khai báo tham số
						var checkbox = document.getElementsByName('id_news');
						var list_idnews = "";

						// Lặp qua từng checkbox để lấy giá trị
						for (var i = 0; i < checkbox.length; i++) {
							if (checkbox[i].checked === true) {
								list_idnews = list_idnews + "," + checkbox[i].value;
							}
						}
						if(list_idnews === ""){
							alert('Vui lòng chọn.');
						}else{
							window.location='${pageContext.request.contextPath}/admin/news/delAllTam/'+ list_idnews;
						}
					};
				</script>
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
							href="${pageContext.request.contextPath }/admin/news/index/1"> << </a>
						</li>
						<c:forEach var="i" begin="1" end="${sumPage }">
							<li <c:if test="${page == i }">class="active"</c:if>><a
								href="${pageContext.request.contextPath }/admin/news/index/${i}">${i }
									<span class="sr-only">(current)</span>
							</a></li>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath }/admin/news/index/${sumPage}">
								>> </a></li>
					</ul>
				</nav> 

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->
</div>