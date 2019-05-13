<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 90px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px;">Quản
					lý Slide</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath }/admin/slide/add"
					class="btn btn-success"><span class="glyphicon glyphicon-plus"
					aria-hidden="true"></span>&nbsp;Thêm</a>
			</div>
		</div>
		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<strong>${msg }</strong>
			</div>
		</c:if>
		<div class="row">
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>picture</th>
							<th>Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="slide" items="${listSlide }">
							<c:set var="editUrl"
								value="${pageContext.request.contextPath }/admin/slide/edit/${slide.s_id }"></c:set>
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/slide/del/${slide.s_id }"></c:set>
							<tr class="odd gradeX">
								<td>${slide.s_id }</td>
								<td style="text-align: center;"><img
									style="width: 400px; height: 200px; border-radius: 5px;text-align: center;"
									src="${pageContext.request.contextPath }/slides/${slide.s_picture}" />
								</td>
								<td class="center text-center"><a href="${editUrl }"
									title="" class="btn btn-primary"><span
										class="glyphicon glyphicon-pencil "></span> Sửa</a> <a
									onclick="return confirm('Bạn có chắc muốn xóa')"
									href="${delUrl }" title="" class="btn btn-danger"><span
										class="glyphicon glyphicon-trash"></span> Xóa</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>