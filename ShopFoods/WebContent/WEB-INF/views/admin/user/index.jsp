<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10" style="margin-left:90px; background-color: #EDEDED; border-radius: 8px;margin-bottom: 80px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title " style="color: #64738E; border-bottom: 1px solid #5A738E;font-size: 30px;text-align: center;">Quản lý USER</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath }/admin/user/add" class="btn btn-success"><span
					class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>
			</div>
			<form action="${pageContext.request.contextPath }/admin/user/search" method="post">
				<div class="col-md-4">
					<div class="input-group form">
						<input type="text" class="form-control" name="fullname" placeholder="fullname...">
						<span class="input-group-btn">
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
				<strong style="color: red;">${msg0 }</strong>
			</div>
		</c:if>
		<div class="row">
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>Username</th>
							<th>Fullname</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${listUser}">
						<c:set var="editUrl" value="${pageContext.request.contextPath }/admin/user/edit/${user.id_user }"></c:set>
						<c:set var="delUrl" value="${pageContext.request.contextPath }/admin/user/del/${user.id_user }"></c:set>	
							<tr class="odd gradeX">
								<td>${user.id_user }</td>
								<td>${user.username }</td>
								<td>${user.fullname }</td>
								<td class="center text-center"><a href="${editUrl }" title=""
									class="btn btn-primary"><span
										class="glyphicon glyphicon-pencil "></span> Sửa</a> <a onclick="return confirm('Bạn có chắc muốn xóa')" href="${delUrl }"
									title="" class="btn btn-danger"><span
										class="glyphicon glyphicon-trash"></span> Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li><a
							href="${pageContext.request.contextPath }/admin/user/index/1"> << </a>
						</li>
						<c:forEach var="i" begin="1" end="${sumPage }">
							<li <c:if test="${page == i }">class="active"</c:if>><a
								href="${pageContext.request.contextPath }/admin/user/index/${i}">${i }
									<span class="sr-only">(current)</span>
							</a></li>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath }/admin/user/index/${sumPage}">
								>> </a></li>
					</ul>
				</nav> 
	</div>
</div>