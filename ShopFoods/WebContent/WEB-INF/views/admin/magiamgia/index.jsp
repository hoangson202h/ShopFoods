<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10" style="margin-left:30px; background-color: #EDEDED; border-radius: 8px;margin-bottom: 80px; width: 1200px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title " style="color: #64738E; border-bottom: 1px solid #5A738E;font-size: 30px;">Quản Lý Mã Giảm Giá</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath }/admin/magiamgia/add" class="btn btn-success"><span
					class="glyphicon glyphicon-plus" aria-hidden="true"></span>&nbsp;Thêm</a>

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
							<th>mã giảm giá </th>
							<th>giá trị </th>
							<th>chức năng</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${listGG}" var="giamgia">
						<c:set var="editUrl" value="${pageContext.request.contextPath }/admin/magiamgia/edit/${giamgia.id}"></c:set>
						<c:set var="delUrl" value="${pageContext.request.contextPath }/admin/magiamgia/del/${giamgia.id}"></c:set>
						<tr class="odd gradeX">
							<td>${giamgia.id }</td>
							<td style="width:12%">${giamgia.ma}</td>
							<td>${giamgia.giam} <span></span></td>
							<td class="center text-center"><a href="${editUrl }" title=""
								class="btn btn-primary"><span
									class="glyphicon glyphicon-pencil "></span> Sửa</a> 
									<a onclick="return confirm('Ban co muon xoa?')" href="${delUrl }" title="" class="btn btn-danger">
										<span class="glyphicon glyphicon-trash"></span> Xóa
									</a>
							</td>
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