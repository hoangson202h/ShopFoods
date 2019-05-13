<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form action="${pageContext.request.contextPath }/admin/slide/add"
	method="post" enctype="multipart/form-data" style=" margin-left:10px; background-color: #EDEDED; border-radius: 8px; padding: 15px 0px;">
	<div class="col-md-10">

		<div class="row">
			<div class="col-md-12 panel-info">
				<div class="">
					<div class="panel-title " style="color: #64738E; border-bottom: 1px solid #5A738E;font-size: 30px;">Thêm Slide</div>
				</div>
				<div class="content-box-large box-with-header">
					<div>
						<div class="row mb-10"></div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label style="margin: 10px 0px;">chọn slide *</label> 
									<input type="file" class="btn btn-default" name="hinhanh" id="exampleInputFile1" required="required">
									<p class="help-block">
										<em>Định dạng: jpg, png, jpeg,...</em>
									</p>
								</div>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-12">
								<input type="submit" value="Thêm" class="btn btn-success" /> <input
									type="reset" value="Nhập lại" class="btn btn-default" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>