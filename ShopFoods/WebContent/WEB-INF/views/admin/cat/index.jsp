<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 90px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px; text-align: center;">Quản
					lý danh mục</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath}/admin/cats/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>
			</div>
			<form action="${pageContext.request.contextPath}/admin/cats/search"
				method="post">
				<div class="col-md-4">
					<div class="input-group form">
						<input type="text" class="form-control" name="name"
							placeholder="Tên danh mục..."> <span
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
								<th>id_cats</th>
								<th>name category</th>
								<th style="text-align: center;">Sửa / Xóa tạm thời</th>
								<th style="text-align: center; width: 100px;">Chọn tất cả

								<c:if test="${page == 1 }"><input
									type="checkbox" name="checkAll" name="checkAll"
									onclick="Check(document.fcheck.chk)">
									</c:if></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="cat" items="${listCats}">
								<c:set var="editUrl"
									value="${pageContext.request.contextPath }/admin/cats/edit/${cat.id_cat }"></c:set>
								<c:set var="delUrl"
									value="${pageContext.request.contextPath }/admin/cats/del/${cat.id_cat }"></c:set>
								<tr class="odd gradeX">
									<td>${cat.id_cat }</td>
									<td>${cat.category_name }</td>
									<td class="center text-center"><a href="${editUrl}"
										title="" class="btn btn-primary"><span
											class="glyphicon glyphicon-pencil "></span> Sửa</a> <a
										href="${delUrl }" title="" class="btn btn-danger"><span
											class="glyphicon glyphicon-trash"></span> Xóa</a></td>
									<td style="text-align: center;"><input type="checkbox"
										value="${cat.id_cat}" name="id_cat" id="chk"></td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="3"></td>
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
						var checkbox = document.getElementsByName('id_cat');
						var list_idcat = "";

						// Lặp qua từng checkbox để lấy giá trị
						for (var i = 0; i < checkbox.length; i++) {
							if (checkbox[i].checked === true) {
								list_idcat = list_idcat + "," + checkbox[i].value;
							}
						} 
						if(list_idcat === ""){
							alert('Vui lòng chọn.');
						}else{
							window.location='${pageContext.request.contextPath}/admin/cats/delTam/'+ list_idcat;
						}
					};
					function xoamai() {
						// Khai báo tham số
						var checkbox = document.getElementsByName('id_cat');
						var list_idcat = "";

						// Lặp qua từng checkbox để lấy giá trị
						for (var i = 0; i < checkbox.length; i++) {
							if (checkbox[i].checked === true) {
								list_idcat = list_idcat + "," + checkbox[i].value;
							}
						}
						if(list_idcat === ""){
							alert('Vui lòng chọn.');
						}else{
							window.location='${pageContext.request.contextPath}/admin/cats/delAllMM/'+ list_idcat;
						}
					};
				</script>
				<form action="${pageContext.request.contextPath}/admin/cats/giorac"
					style="float: right; margin-right: 50px;">
					<div>
						<a href="${pageContext.request.contextPath}/admin/cats/giorac"
							style=""><image Style="border-radius: 5px;"
								src="${defines.urlAdmin}/images/gr.jpg" width="50" height="50"></image></a><br />
						<span style="margin-left: 4px;"><a
							href="${pageContext.request.contextPath}/admin/cats/giorac">Giỏ
								rác</a> </span>
					</div>
				</form>
				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li>
                        	<a href="${pageContext.request.contextPath }/admin/cats/index/1"> << </a>
                        </li>
						<c:forEach var="i" begin="1" end="${sumPage }">
								<li <c:if test="${page == i }">class="active"</c:if>><a href="${pageContext.request.contextPath }/admin/cats/index/${i}">${i } <span class="sr-only">(current)</span></a></li>
						</c:forEach>
						 <li><a href="${pageContext.request.contextPath }/admin/cats/index/${sumPage}"> >> </a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>