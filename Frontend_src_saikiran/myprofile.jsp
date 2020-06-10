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
<link rel="stylesheet"
	href="${contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/mystyles.css">
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
				<nav class="navbar navbar-expand-lg my-nav fixed-top">
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
							<li class="nav-item"><a class="nav-link text-white"
								href="${contextPath}/maps">Search on map</a></li>						
							<li class="nav-item"><a class="nav-link text-white" href="">Welcome
									${pageContext.request.userPrincipal.name}</a></li>
							<li class="nav-item"><a class="nav-link text-white" class="nav-link"
								href="" onclick="document.forms['logoutForm'].submit()"><i
									class="fa fa-sign-out"></i> Logout</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</c:if>
	</div>
	<div>
		<div class="video-header wrap">
			<div class="fullscreen-video-wrap">
				<video src="${contextPath}/resources\videos\kkk.mp4" autoplay=""
					loop="" muted=""></video>
			</div>
			<div class="header-overlay">
				<div class="header-content">
					<h2 align="center">Profile</h2>
				<div id="mySidenav" class="sidenav">
					<a
						href="${contextPath}/routes/${pageContext.request.userPrincipal.name}"
						id="details">My Routes</a> <a href="/StarterKit/" id="about">Home</a>
					<a href="${contextPath}/favourite/${pageContext.request.userPrincipal.name}"
						id="blog">My favourites</a> <a
						href="${contextPath}/new-Route/${pageContext.request.userPrincipal.name}"
						id="projects">Add Route</a> <a
						href="${contextPath}/userByName/${pageContext.request.userPrincipal.name}" id="contact">My Profile</a>
				</div>
					<div align="center">

						<div>
							<form
								action="${contextPath}/updateMyProfile?${_csrf.parameterName}=${_csrf.token}"
								method="post" enctype="multipart/form-data">
								<input type="hidden" value="${user.id}" name="id">
								<div>
									<img src="${contextPath}/images/${user.path}" alt=""
										class="rounded-circle" style="height: 80px; width: 80px;" /><br>
									<input type="file" required="required" name="file">
								</div>
								<div class="form-group">
									<label>Name:</label> <input type="text"
										value="${user.username}" name="name" readonly="readonly"
										class="form-control" style="width: 50%;" />
								</div>
								<div class="form-group">
									<label>Email:</label> <input type="email" value="${user.email}"
										readonly="readonly" class="form-control" style="width: 50%;" />
								</div>
								<div class="form-group">
									<label>About Myself:</label>
									<textarea name="aboutmyself" class="form-control"
										style="width: 50%;">${user.aboutmyself}</textarea>
								</div>
								<br>
								<div>
									<input type="submit" value="update" class="btn btn-primary">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>