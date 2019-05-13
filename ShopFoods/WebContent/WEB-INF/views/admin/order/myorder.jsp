<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="col-md-10"
	style="margin-left: 30px; background-color: #EDEDED; border-radius: 8px; margin-bottom: 80px; width: 1200px;">

	<div class="content-box-large">
		<div class="row">
			<div class="panel-heading">
				<div class="panel-title "
					style="color: #64738E; border-bottom: 1px solid #5A738E; font-size: 30px;text-align: center;">Lịch Sửa Mua Hàng</div>
			</div>
		</div>
		<hr>
		<div>
		<c:set value="${customer}" var="cus"></c:set>
			<span>Tên khách hàng :   </span><span style="color: #2A3F54;"><b>${cus.name}</b></span>
			<span style="margin-left: 50px;">Phone :   </span><span style="color: #2A3F54;"><b>${cus.phone}</b></span>
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
							<th style="text-align: center;">ID</th>
							<th style="text-align: center;">Tên Sản Phẩm</th>
							<th style="text-align: center;">Hình Ảnh</th>
							<th style="text-align: center;">Thời gian đặt hàng</th>
							<th style="text-align: center;">Số Lượng</th>
							<th style="text-align: center;">Giá Sản Phẩm</th>
							<th style="text-align: center;">Thành tiền (vnđ)</th>
							<c:if test="${not empty kt}">
								<th style="text-align: center;">chức năng</th>
							</c:if>

						</tr>
					</thead>
					<tbody>
						<c:set value="${0}" var="tongtien"></c:set>
						<c:forEach items="${listOrder}" var="item">
							<c:set value="${item.quantity * item.product_price}" var="thanhtien"></c:set>
							<c:set value="${tongtien + thanhtien}" var="tongtien"></c:set>
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/order/del/${item.id}"></c:set>
							<tr class="odd gradeX">
								<td style="text-align: center;">${item.id}</td>
								<td style="width: 12%; text-align: center;">${item.product_name}</td>
								<td style="text-align: center;"><img
									Style="border-radius: 5px;" width="120px" height="90px"
									src="${pageContext.request.contextPath }/uploads/${item.picture}" /></td>
								<td style="text-align: center;">${item.time_order}</td>
								<td style="text-align: center;">${item.quantity}</td>
								<td style="text-align: center;">${defines.formatNumber(item.product_price)} <u>đ</u></td>
								<td style="text-align: center;">${defines.formatNumber(thanhtien)} <u>đ</u></td>
								<c:if test="${not empty kt}">
									<td class="center text-center"><a
										onclick="return confirm('Ban co muon xoa?')" href="${delUrl}"
										title="" class="btn btn-danger"> <span
											class="glyphicon glyphicon-trash"></span> Xóa
									</a></td>
								</c:if>

							</tr>
						</c:forEach>
						<tr class="odd gradeX">
							<td colspan="6"
								Style="text-align: right; font-weight: bold; color: blue;">Tổng
								tiền :</td>
							<td style="text-align: center;">${defines.formatNumber(tongtien)} <u>đ</u><span
								style="color: #D9534F; font-size: 12px;"> VNĐ</span></td>
						</tr>
					</tbody>
				</table>

				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li><a
							href="${pageContext.request.contextPath }/admin/order/myorder/1"> << </a>
						</li>
						<c:forEach var="i" begin="1" end="${sumPage }">
							<li <c:if test="${page == i }">class="active"</c:if>><a
								href="${pageContext.request.contextPath }/admin/order/myorder/${i}">${i }
									<span class="sr-only">(current)</span>
							</a></li>
						</c:forEach>
						<li><a
							href="${pageContext.request.contextPath }/admin/order/myorder/${sumPage}">
								>> </a></li>
					</ul>
				</nav>

			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.content-box-large -->
</div>