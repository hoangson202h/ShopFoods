<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 30px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px; width: 1200px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px; text-align: center;">Quản
					Lý Khách Hàng</div>
			</div>
		</div>
		<hr>
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
							<th>Tên khách hàng</th>
							<th>số điện thoại</th>
							<th>email</th>
							<th>địa chỉ</th>
							<th>Thanh toán</th>
							<th>Trạng thái</th>
							<th>chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listCustomer}" var="item">
							<c:set var="viewsUrl"
								value="${pageContext.request.contextPath }/admin/order/index/${item.id_cus}"></c:set>
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/customer/del/${item.id_cus}"></c:set>
							<tr class="odd gradeX">
								<td>${item.id_cus}</td>
								<td style="width: 12%">${item.name}</td>
								<td>${item.phone}</td>
								<td>${item.email}</td>
								<td>
								${item.address}<span>,</span>
								<c:if test="${item.county==1}">Quận Hải Châu</c:if>
								<c:if test="${item.county==2}">Quận Cẩm Lệ</c:if>
								<c:if test="${item.county==3}">Quận Thanh Khê</c:if>
								<c:if test="${item.county==4}">Quận Liên Chiểu</c:if>
								<c:if test="${item.county==5}">Quận Ngũ Hành Sơn</c:if>
								<c:if test="${item.county==6}">Quận Sơn Trà</c:if>
								<c:if test="${item.county==7}">Huyện Hòa Vang</c:if>
								</td>
								<c:if test="${item.status == 1}">
									<td>Đã thanh toán</td>
								</c:if>
								<c:if test="${item.status == 0}">
									<td>Chưa</td>
								</c:if>
								<td><select name="check_st"
									onchange="check_st(this,${item.id_cus});">
										<option value="0"
											<c:if test="${item.check_st==0}">selected="selected"</c:if>>Chưa
											giao</option>
										<option value="1"
											<c:if test="${item.check_st==1}">selected="selected"</c:if>>Đang
											giao</option>
										<option value="2"
											<c:if test="${item.check_st==2}">selected="selected"</c:if>>Đã
											giao</option>
								</select></td>
								<td class="center text-center"><a href="${viewsUrl}"
									title="" class="btn btn-primary"><span class=""></span> xem
										đơn hàng </a> <a
									onclick="return confirm('Các đơn hàng của khách hàng sẻ bị xóa theo?bạn có đồng ý?')"
									href="${delUrl}" title="" class="btn btn-danger"> <span
										class="glyphicon glyphicon-trash"></span> Xóa
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<script type="text/javascript">
					function check_st(obj,id_cus) {
						var options = obj.children;
						for (var i = 0; i < options.length; i++) {
							if (options[i].selected) {
								window.location='${pageContext.request.contextPath}/admin/customer/update-check/'+ options[i].value+'/'+id_cus;
							}
						}
					}
				</script>
				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li><a
							href="${pageContext.request.contextPath }/admin/customer/index/1"> << </a>
						</li>
						<c:forEach var="i" begin="1" end="${sumPage }">
							<li <c:if test="${page == i }">class="active"</c:if>><a
								href="${pageContext.request.contextPath }/admin/customer/index/${i}">${i}
									<span class="sr-only">(current)</span>
							</a></li>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath }/admin/customer/index/${sumPage}">
								>> </a></li>
					</ul>
				</nav>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->
</div>