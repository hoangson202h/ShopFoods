<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 30px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px; width: 1200px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px;">Quản
					Lý Comment</div>
			</div>
		</div>
		<hr>
		<div class="row">

			<form
				action="${pageContext.request.contextPath }/admin/phukien/news/search"
				method="post">
				<div class="col-md-4"></div>
			</form>
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
							<th>Tên</th>
							<th>Avatar</th>
							<th>Thời gian bình luận</th>
							<th>Nội Dung</th>
							<th>chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listComment}" var="comment">
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/comment/del/${comment.id_comment}"></c:set>
							<tr class="odd gradeX">
								<td>${comment.id_comment}</td>
								<td style="width: 12%">${comment.name}</td>
								<td class="center text-center"><c:choose>
										<c:when test="${not empty comment.avatar }">
											<img Style="border-radius: 5px;" width="120px" height="90px"
												src="${pageContext.request.contextPath }/avatar/${comment.avatar}" />
										</c:when>
										<c:otherwise>
											<p>không có hình ảnh</p>
										</c:otherwise>
									</c:choose></td>
								<td>${comment.date_comment}</td>
								<td>${comment.message}</td>
								<td class="center text-center"><a
									onclick="return confirm('Ban co muon xoa?')" href="${delUrl}"
									title="" class="btn btn-danger"> <span
										class="glyphicon glyphicon-trash"></span> Xóa
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->
</div>