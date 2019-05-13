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
					Lý Order Table</div>
			</div>
		</div>
		<hr>
		<c:if test="${not empty msg }">
			<div class="alert alert-success">
				<strong>${msg }</strong>
			</div>
		</c:if>
		<form action="${pageContext.request.contextPath}/admin/table/history" style="margin-bottom: 10px;">
			<input value="tất cả" type="submit"/>
		</form>
		<div style="float: left;">
			<select onchange="tableorder();" id="year">
				<c:forEach var="i" begin="2019" end="2025">
					<option <c:if test="${i == year }">selected="selected"</c:if>
						value="${i}">${i}</option>
				</c:forEach>
			</select>
		</div>
		<div style="float: left; margin-left: 10px; margin-bottom: 20px;">
			<select onchange="tableorder();" id="month">
				<c:forEach var="i" begin="1" end="12">
					<option <c:if test="${i == month }">selected="selected"</c:if>
						value="${i}">Tháng ${i}</option>
				</c:forEach>
			</select>
		</div>
		<div style="float: left; margin-left: 10px; margin-bottom: 20px;">
			<select onchange="tableorder();" id="day">
				<c:forEach var="i" begin="1" end="31">
					<option <c:if test="${i == day }">selected="selected"</c:if>
						value="${i}">Ngày ${i}</option>
				</c:forEach>
			</select>
		</div>
		<script type="text/javascript">
			function tableorder() {
				var day = $('#day').val();
				var month = $('#month').val();
				var year = $('#year').val();
				window.location = '${pageContext.request.contextPath}/admin/table/history/'
						+ day + '/' + month + '/' + year;
			}
		</script>
		<div class="row">
			<div class="panel-body">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="example">
					<thead>
						<tr>
							<th>ID</th>
							<th>Tên khách hàng</th>
							<th>Ngày</th>
							<th>thời gian</th>
							<th>stt bàn</th>
							<th>số điện thoại</th>
							<th>message</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listtable}" var="item">
							<c:set var="delUrl"
								value="${pageContext.request.contextPath }/admin/table/del/${item.id}"></c:set>
							<tr class="odd gradeX">
								<td>${item.id}</td>
								<td style="width: 12%">${item.lname}<span> </span>${item.fname}</td>
								<td>${item.date}</td>
								<td>${item.time}</td>
								<td><span>bàn </span>${item.number}</td>
								<td>${item.phone}</td>
								<td>${item.message}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<script type="text/javascript">
					function check_st(obj, id) {
						var options = obj.children;
						for (var i = 0; i < options.length; i++) {
							if (options[i].selected) {
								window.location = '${pageContext.request.contextPath}/admin/table/update/'
										+ options[i].value + '/' + id;
							}
						}
					}
				</script>
				<nav class="text-center" aria-label="...">
					<ul class="pagination">
						<li><a
							href="${pageContext.request.contextPath }/admin/customer/index/1">
								<< </a></li>
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