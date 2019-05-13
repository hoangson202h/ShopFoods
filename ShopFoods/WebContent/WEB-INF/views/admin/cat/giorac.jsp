<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 90px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px; text-align: center;">Giỏ rác danh mục</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<form action="${pageContext.request.contextPath}/admin/cats/giorac/search"
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
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>id_cats</th>
							<th>name category</th>
							<th style="text-align: center;">chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cat" items="${listCats}">
							<c:set var="restoretUrl"
								value="${pageContext.request.contextPath }/admin/cats/restore/${cat.id_cat }"></c:set>
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/cats/delete/${cat.id_cat }"></c:set>
							<tr class="odd gradeX">
								<td>${cat.id_cat }</td>
								<td>${cat.category_name }</td>
								<td class="center text-center">
								<a href="${restoretUrl }"
									title="" class="btn btn-primary" style="background-color: #26B99A;padding: 3px 5px;"><span
										class=""></span> Restore</a>
								<a
									onclick="return confirm('Bạn có chắc muốn xóa')"
									href="${delUrl }" title="" class="btn btn-danger"><span
										class="glyphicon glyphicon-trash"></span> Xóa</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%-- <nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li>
                        	<a href="${pageContext.request.contextPath }/admin/cats/1"> << </a>
                        </li>
						<c:forEach var="i" begin="1" end="${sumPage }">
								<li <c:if test="${page == i }">class="active"</c:if>><a href="${pageContext.request.contextPath }/admin/cats/${i}">${i } <span class="sr-only">(current)</span></a></li>
						</c:forEach>
						 <li><a href="${pageContext.request.contextPath }/admin/cats/${sumPage}"> >> </a></li>
					</ul>
				</nav> --%>
			</div>
		</div>
	</div>
</div>