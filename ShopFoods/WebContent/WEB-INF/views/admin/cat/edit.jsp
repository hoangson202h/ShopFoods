<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form action="${pageContext.request.contextPath }/admin/cats/edit/${cat.id_cat}"
	method="post" enctype="multipart/form-data" id="form1"
	style="margin-left: 10px; background-color: #EDEDED; border-radius: 8px; padding: 15px 0px;">
	<div class="col-md-10">

		<div class="row">
			<div class="col-md-12 panel-info">
				<div class="">
					<div class="panel-title "
						style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px; text-align: center;">Sửa
						danh mục</div>
				</div>
				<div class="content-box-large box-with-header">
					<div>
						<div class="row mb-10"></div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="name" style="margin: 10px 0px; color: #4267B2;">Tên
										Danh mục</label> <input type="text" class="form-control" name="category_name"
										placeholder="Nhập danh mục" value="${cat.category_name}">
									<form:errors path="" style="color:red;"></form:errors>

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
				$("#form1").validate({
					rules:{
						cname:{
							required:true,
							minlength:3,
						},
					},
					messages:{
						cname:{
							required:"Vui lòng nhập tên danh mục!",
							minlength:"Username phải trên 3 kí tự!",
						},
					}
				});
			});
		
	</script> -->