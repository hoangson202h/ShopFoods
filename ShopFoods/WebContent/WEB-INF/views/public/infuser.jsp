<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<div class="row align-items-end">
						<div class="col-md-6">
							<div class="form-group">
								<label for="firstname">Fullname *</label> <input type="text"
									class="form-control" name="name" placeholder=""
									required="required"  value="${user.fullname}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="lastname">Phone *</label> <input type="text"
									name="email" class="form-control" placeholder="phone"
									required="required" value="${infuser.phone}">
							</div>
						</div>
						<div class="w-100"></div>
						<div class="w-100"></div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="streetaddress">Address *</label> <input type="text"
									class="form-control" placeholder="House number and street name"
									required="required" value="${infuser.address}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">Email *</label> <input type="email"
									class="form-control" placeholder="email" required="required"
									value="${infuser.email}">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="message">Message </label>
								<textarea rows="5" cols="85"
									style="background-color: black; color: white;" name="message"></textarea>
							</div>
						</div>

						<div class="w-100"></div>
						<div class="col-md-6" id="password"></div>

						<div class="w-100"></div>

					</div>