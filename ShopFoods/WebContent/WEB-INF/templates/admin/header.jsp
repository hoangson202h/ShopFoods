<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="top_nav">
	<div class="nav_menu">
		<nav>
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>

			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="javascript:;"
					class="user-profile dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <c:choose>
							<c:when test="${not empty user.avatar }">
								<img style="width: 30px; height: 30px;"
									src="${pageContext.request.contextPath}/avatar/${user.avatar}"
									alt="">${user.fullname}
						</c:when>
							<c:otherwise>
								<img style="width: 30px; height: 30px;"
									src="${pageContext.request.contextPath}/images/avatar.png"
									alt="">${user.fullname}
						</c:otherwise>
						</c:choose> <span class=" fa fa-angle-down"></span>
				</a>
					<ul class="dropdown-menu dropdown-usermenu pull-right">
						<li><a href="javascript:;"> Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath }/account/edit"> <span
								class="badge bg-red pull-right"></span> <span>Settings</span>
						</a></li>
						<li><a href="javascript:;">Help</a></li>
						<li><a href="${pageContext.request.contextPath}/auth/logout"><i
								class="fa fa-sign-out pull-right"></i> Log Out</a></li>
					</ul></li>

				<li role="presentation" class="dropdown"><a href="javascript:;"
					class="dropdown-toggle info-number" data-toggle="dropdown"
					aria-expanded="false"> <i class="fa fa-envelope-o"></i> <span
						class="badge bg-green">${comment}</span>
				</a>
					<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
						role="menu">
						<c:forEach items="${listComment}" var="comment">
							<li><a> <span class="image"><img
										src="${defines.urlAdmin}/images/img.jpg" alt="Profile Image" /></span>
									<span> <span>${comment.name}</span>
								</span> <span class="message"> ${comment.message} </span>
							</a></li>
						</c:forEach>


						<li>
							<div class="text-center">
								<a href="${pageContext.request.contextPath}/admin/comment">
									<strong>See All Alerts</strong> <i class="fa fa-angle-right"></i>
								</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</nav>
	</div>
</div>
<!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">
	<!-- top tiles -->
	<div class="row tile_count">
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"
			style="text-align: center;">
			<span class="count_top"><i class="fa fa-user"></i> Quản Lý</span>
			<div class="count" style="font-size: 20px;">
				<a href="${pageContext.request.contextPath}/admin/cats/index">Danh
					Mục</a>
			</div>
			<span class="count_bottom"><i class="green">${countCat} </i>
				Danh Mục</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"
			style="text-align: center;">
			<span class="count_top"><i class="fa fa-user"></i> Quản Lý</span>
			<div class="count" style="font-size: 20px;">
				<a href="${pageContext.request.contextPath}/admin/news/index">Sản
					phẩm</a>
			</div>
			<span class="count_bottom"><i class="green">${countNews}</i>
				sản phẩm</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"
			style="text-align: center;">
			<span class="count_top"><i class="fa fa-user"></i> Quản Lý</span>
			<div class="count" style="font-size: 20px;">
				<a href="${pageContext.request.contextPath}/admin/user/index">Người
					dùng</a>
			</div>
			<span class="count_bottom"><i class="green">${countUser} </i>
				User</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"
			style="text-align: center;">
			<span class="count_top"><i class="fa fa-user"></i> Quản Lý</span>
			<div class="count" style="font-size: 20px;">
				<a href="${pageContext.request.contextPath}/admin/customer/index">Khách
					Hàng</a>
			</div>
			<span class="count_bottom"><i class="green">${countKH} </i>
				Khách Hàng</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"
			style="text-align: center;">
			<span class="count_top"><i class="fa fa-user"></i> Quản Lý</span>
			<div class="count" style="font-size: 20px;">
				<a href="${pageContext.request.contextPath}/admin/table/index">Order Table</a>
			</div>
			<span class="count_bottom"><i class="green"></i> Table</span>
		</div>
		<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count"
			style="text-align: center;">
			<span class="count_top"><i class="fa fa-user"></i> Quản Lý</span>
			<div class="count" style="font-size: 20px;">
				<a href="${pageContext.request.contextPath}/admin/slide/index">Slide</a>
			</div>
			<span class="count_bottom"><i class="green">${countSlide}
			</i> Slide</span>
		</div>
	</div>
	</ul>