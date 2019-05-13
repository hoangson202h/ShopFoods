<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Great+Vibes"
	rel="stylesheet">

<link rel="stylesheet"
	href="${defines.urlPublic}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${defines.urlPublic}/css/animate.css">

<link rel="stylesheet"
	href="${defines.urlPublic}/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${defines.urlPublic}/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${defines.urlPublic}/css/magnific-popup.css">

<link rel="stylesheet" href="${defines.urlPublic}/css/aos.css">

<link rel="stylesheet" href="${defines.urlPublic}/css/ionicons.min.css">

<link rel="stylesheet"
	href="${defines.urlPublic}/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${defines.urlPublic}/css/jquery.timepicker.css">


<link rel="stylesheet" href="${defines.urlPublic}/css/flaticon.css">
<link rel="stylesheet" href="${defines.urlPublic}/css/icomoon.css">
<link rel="stylesheet" href="${defines.urlPublic}/css/style.css">
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container" style="padding-left: 50px;">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/public/index">Food <small>ordering</small></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/public/index"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/public/news/menu"
						class="nav-link">Menu</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/public/blog"
						class="nav-link">Blog</a></li>
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/public/contact"
						class="nav-link">Contact</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle"
						href="${pageContext.request.contextPath}/public/room"
						id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Shop</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/public/about">About</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/public/services">Services</a>
						</div></li>
					<li class="nav-item">
						<form
							action="${pageContext.request.contextPath}/public/news/search"
							class="search-form" style="margin-left: 50px;">
							<div class="form-group">
								<div class="icon">
									<span class="icon-search"></span>
								</div>
								<input type="text" name="name" class="form-control"
									placeholder="Search...">
							</div>
						</form>
					</li>
					<li class="nav-item cart"><a
						href="${pageContext.request.contextPath}/public/news/cart"
						class="nav-link"><span class="icon icon-shopping_cart"></span><span
							class="bag d-flex justify-content-center align-items-center"><small
								id="addcart"> <c:choose>
										<c:when test="${not empty soluong}">${soluong}</c:when>
										<c:otherwise>0</c:otherwise>
									</c:choose>
							</small></span></a></li>
					<c:choose>
						<c:when test="${not empty user }">
							<li class="nav-item" style="margin-left: 20px; width: 100px;"><a
								href="${pageContext.request.contextPath}/public/logout"
								class="nav-link">LOG OUT</a></li>
							<li class="nav-item"><a
								href="${pageContext.request.contextPath}/public/news/myorder"
								class="nav-link">My order</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item" style="margin-left: 20px; width: 100px;"><a
								href="${pageContext.request.contextPath}/public/login"
								class="nav-link">LOG IN</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->