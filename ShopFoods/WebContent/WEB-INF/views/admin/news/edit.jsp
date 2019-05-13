<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form
	action="${pageContext.request.contextPath }/admin/news/edit/${food.product_code}/${page}"
	method="post" enctype="multipart/form-data" id="form"
	style="margin-bottom: 100px; margin-left: 10px; background-color: #EDEDED; border-radius: 8px; padding: 15px 0px;">
	<div class="col-md-10">

		<div class="row">
			<div class="col-md-12 panel-info">
				<div class="">
					<div class="panel-title "
						style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px;">Sửa
						Foods</div>
				</div>
				<div class="content-box-large box-with-header">
					<div>
						<div class="row mb-10"></div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="name" style="margin: 10px 0px;">Mã Food *</label> <input
										type="text" name="product_code" class="form-control"
										placeholder="Nhập mã" value="${food.product_code}" readonly />
									<form:errors path="news.nname" style="color:red;"></form:errors>
								</div>
								<c:if test="${not empty err }">
									<strong style="color: red;">${err}</strong>
								</c:if>
								<div class="form-group">
									<label for="name" style="margin: 10px 0px;">Tên Food *</label>
									<input type="text" name="name" class="form-control"
										placeholder="Nhập tên" value="${food.name}" />
									<form:errors path="news.nname" style="color:red;"></form:errors>
								</div>
								<div class="form-group">
									<label>Danh mục *</label> <select class="form-control"
										name="id_category">
										<c:forEach items="${listCats}" var="cat">
											<option
												<c:if test="${cat.id_cat == food.id_category }">selected="selected"</c:if>
												value="${cat.id_cat }">${cat.category_name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Trạng thái *</label> <select class="form-control"
										name="status">
										<option
											<c:if test="${food.status == 1}">selected="selected"</c:if>
											value="1">còn hàng</option>
										<option
											<c:if test="${food.status == 0}">selected="selected"</c:if>
											value="0">hết hàng</option>
									</select>
								</div>
								<div class="form-group">
									<label for="name" style="margin: 10px 0px;">Giá Food *</label>
									<input type="text" name="price" class="form-control"
										placeholder="Nhập Giá " value="${food.price}" />
									<form:errors path="news.nname" style="color:red;"></form:errors>
								</div>
								<div class="form-group">
									<label>hình ảnh *</label> <input type="file"
										class="btn btn-default" name="hinhanh" id="exampleInputFile1">
									<p class="help-block">
										<em>Định dạng: jpg, png, jpeg,...</em>
									</p>
								</div>
								<div class="form-group">
									<label>Mô tả *</label><br />
									<textarea name="previews" class="ckeditor" rows="3">${food.previews}</textarea>
									<form:errors path="news.previews" style="color:red;"></form:errors>
								</div>
								<div class="form-group">
									<label>Chi tiết *</label><br />
									<textarea name="detail" class="ckeditor" rows="3">${food.detail}</textarea>
									<form:errors path="news.detail" style="color:red;"></form:errors>
								</div>

							</div>

						</div>

						<hr>

						<div class="row">
							<div class="col-sm-12">
								<input type="submit" value="Sửa" class="btn btn-success" /> <input
									type="reset" value="Nhập lại" class="btn btn-default" />
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- <script type="text/javascript">
		$(document).ready(function (){
				$("#form").validate({
					rules:{
						lname:{
							required:true,
							minlength:6,
						},
					},
					messages:{
						lname:{
							required:"Vui lòng nhập Username!",
							minlength:"Username phải trên 6 kí tự!",
						},
					},
					ignore: []
				});
			});
		
	</script> -->