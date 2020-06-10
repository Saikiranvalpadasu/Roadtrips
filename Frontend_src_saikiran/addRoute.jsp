<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mystyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/parallex.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mystyles.css">
<link rel="stylesheet" href="${contextPath}/resources/css/paracss.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container-fluid" style="height: 75px;">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<div class="nav-container">
				<nav
					class="navbar navbar-expand-lg my-nav fixed-top bg bg-secondary">
					<a class="navbar-brand" href="/StarterKit/">Road Trips</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarNav" aria-controls="navbarNav"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"><i class="fa fa-bars"
							aria-hidden="true"></i></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link text-white"
								href="${contextPath}/blog">Blog</a></li>
							<li class="nav-item"><a class="nav-link text-white"
								href="${contextPath}/feedbacks">FeedBack</a></li>
							<li class="nav-item"><a class="nav-link text-white "
								href="${contextPath}/maps">Search on map</a></li>
							<li class="nav-item"><a class="nav-link text-white" href="">Welcome
									${pageContext.request.userPrincipal.name}</a></li>
							<li class="nav-item"><a class="nav-link text-white"
								class="nav-link" href=""
								onclick="document.forms['logoutForm'].submit()"><i
									class="fa fa-sign-out"></i> Logout</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</c:if>
	</div>


	<div align="center">
		<br> <br>
		<h1>Note: It is mandatory to add Interesting Place first</h1>
		<div class="bgimg-1">
			<div class="caption"></div>
		</div>
		<div
			style="color: #777; background-color: white; text-align: center; padding: 50px 80px; text-align: justify;">
			<h3 style="text-align: center;">Add Route</h3>
			<form:form
				action="${contextPath}/add?${_csrf.parameterName}=${_csrf.token}"
				modelAttribute="route" method="post" enctype="multipart/form-data">
				<div align="center">
					<div class="form-group">
						<form:label path="routename">Route Name:</form:label>
						<form:input type="text" path="routename" name="routename"
							class="form-control" required="required" style="width: 50%; " />
						<form:errors path="routename"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="category">Category:</form:label>
						<form:select name="category" path="category" class="form-control"
							required="required" style="width: 50%;">
							<option value="All Categories">All Categories</option>
							<option value="By Car">By Car</option>
							<option value="On Foot">On Foot</option>
							<option value="Public Transport">Public Transport</option>
						</form:select>
						<form:errors path="category"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="keyword">Keywords:</form:label>
						<form:input type="text" path="keyword" name="keyword"
							class="form-control" required="required" style="width: 50%;" />
						<form:errors path="keyword"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="rdescription">Description:</form:label>
						<form:textarea id="rdescription" name="rdescription"
							path="rdescription" class="form-control" required="required"
							style="width: 50%;"></form:textarea>
						<form:errors path="rdescription"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="fromaddress">From :</form:label>
						<form:input type="text" path="fromaddress" name="fromaddress"
							class="form-control" required="required" style="width: 50%;" />
						<form:errors path="fromaddress"></form:errors>
					</div>
					<div class="form-group">
						<form:label path="toaddress">To :</form:label>
						<form:input type="text" path="toaddress" name="toaddress"
							class="form-control" required="required" style="width: 50%;" />
						<form:errors path="toaddress"></form:errors>
					</div>
					<div>
						<form:label path="user"></form:label>
						<form:input type="hidden" value="${route.user}" path="user"
							name="user" readonly="readonly" />
						<form:errors path="user"></form:errors>
					</div>
					<div>
						<input type="file" name="file" /><br />
					</div>
					<div>
						
						
						<a href="${contextPath}/addInterestingPlace/${route.user}"
							class="btn btn-primary">Add Interesting Place</a>
					</div>
				</div>
				<br>
				<div align="center">
					<div>
						<input type="submit" value="Add Route" class="btn btn-primary">
					</div>
				</div>
			</form:form>
		</div>

	<div id="mySidenav" class="sidenav">
					<a
						href="${contextPath}/routes/${pageContext.request.userPrincipal.name}"
						id="details">My Routes</a> <a href="/StarterKit/" id="about">Home</a>
					<a href="${contextPath}/favourite/${pageContext.request.userPrincipal.name}"
						id="blog">My favourites</a> <a
						href="${contextPath}/new-Route/${pageContext.request.userPrincipal.name}"
						id="projects">Add Route</a> <a
						href="${contextPath}/userByName/user" id="contact">My Profile</a>
				</div>
	</div>

</body>
</html>
