<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!DOCTYPE html>
<html lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="${defines.urlAdmin}/images/favicon.ico" type="image/ico" />

    <title>Foods Store | </title>
	<script type="text/javascript" src="${defines.urlAdmin}/ckeditor/ckeditor.js"></script>
    <!-- Bootstrap -->
    <link href="${defines.urlAdmin}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${defines.urlAdmin}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${defines.urlAdmin}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${defines.urlAdmin}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${defines.urlAdmin}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${defines.urlAdmin}/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${defines.urlAdmin}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${defines.urlAdmin}/build/css/custom.min.css" rel="stylesheet">
     <style type="text/css">
    	.avatar{
    		margin-left: 30px;
    		   margin-top: 25px;
    	}
    </style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="${pageContext.request.contextPath}/admin/index" class="site_title"><i class="fa fa-paw"></i> <span>Foods Store!</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <c:choose>
					<c:when test="${not empty user.avatar }">
						 <a class="vitri" href="${pageContext.request.contextPath }/account/edit">
	           	  			 <img style="border-radius: 50%;width: 50px;height: 50px;" alt="thay đổi avatar" class="avatar" src="${pageContext.request.contextPath }/avatar/${user.avatar}">
	           	 		 </a>
					</c:when>
						<c:otherwise>
						 <a class="vitri" href="${pageContext.request.contextPath }/account/edit">
	           	  			 <img style="border-radius: 50%;width: 50px;height: 50px;" alt="thay đổi avatar" class="avatar" src="${defines.urlAdmin}/images/avatar.png">
	           	 		 </a>
					</c:otherwise>
				</c:choose>
					
					
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>${user.fullname}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="${pageContext.request.contextPath}/admin/cats/index">Danh Mục</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/news/index">Sản phẩm</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/user/index">Người Dùng</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/customer/index">Khách Hàng</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/slide/index">Slide</a></li>
                      <li><a href="${pageContext.request.contextPath}/account/edit">My Account</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="${pageContext.request.contextPath}/admin/comment/index">Bình luận</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/order/myorder">Lịch sử mua hàng</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/table/history">Lịch sử order table</a></li>
                      <li><a href="${pageContext.request.contextPath}/admin/news/thongke">Thống Kê</a></li>
                    </ul>
                  </li>
                 
             
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
           <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>
 