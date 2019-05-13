<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<form action="${pageContext.request.contextPath }/admin/user/edit/${user.id_user}"
	method="post" style=" margin-left:10px; background-color: #EDEDED; border-radius: 8px; padding: 15px 0px;">
	<div class="col-md-10">

		<div class="row">
			<div class="col-md-12 panel-info">
				<div class="">
					<div class="panel-title " style="color: #64738E; border-bottom: 1px solid #5A738E;font-size: 30px;">Sửa người dùng</div>
				</div>
				<div class="content-box-large box-with-header">
					<div>
						<div class="row mb-10"></div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="name" style="margin: 10px 0px;">Tên đăng nhập</label> 
									<input type="text" value="${user.username }" readonly="readonly" class="form-control" name="username" placeholder="Nhập tên người dùng">
									<form:errors path="user.username" style="color:red;"></form:errors>
								</div>
								<div class="form-group">
									<label for="name">Password</label> 
									<input type="password" value="" class="form-control" name="password" placeholder="Nhập password">
								</div>
								<div class="form-group">
									<label for="name">Tên đầy đủ</label> 
									<input type="text" value="${user.fullname }" class="form-control" name="fullname" placeholder="Nhập tên đầy đủ">
									<form:errors path="user.fullname" style="color:red;"></form:errors>
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