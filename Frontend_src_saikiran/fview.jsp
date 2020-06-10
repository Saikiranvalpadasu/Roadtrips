<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<style type="text/css">
th, td {
	text-align: center;
}

#divleft {
	background-color: white;
	float: left;
	width: 45%;
	height: 100%;
	border-radius: 10px;
}

#divright {
	background-color: white;
	float: right;
	width: 50%;
	height: 100%;
	border-radius: 10px;
}

thead, td {
	text-align: center;
}
</style>
<link href="${contextPath}/resources/css/rating.css" rel="stylesheet">
<script src="${contextPath}/resources/js/rating.js"></script>

</head>
<body>
<div class="container-fluid" style="height: 75px;">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<div class="nav-container">
				<nav class="navbar navbar-expand-lg my-nav fixed-top bg bg-secondary">
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
	<input type="hidden" id="status" value="${status}">
	
		<div id="body">
		<div id="divleft" class="leftDiv">
			<img alt="" src="${contextPath}/images/${route.path}" id="image"
				height="700" width="600">
		</div>
		<div id="divright" class="rightDiv">
			<div id="right">
				<h3>Route Details:</h3>
				<Label><b>Name:</b></Label>&nbsp;${route.routename}<br> <Label><b>Category
						:&nbsp;</b></Label>${route.category}<br> <label><i
					class="fa fa-map-pin" style="color: blue;"></i>&nbsp;${route.fromaddress}</label>&nbsp;
				to &nbsp;<label><i class="fa fa-map-pin" style="color: red;"></i>&nbsp;${route.toaddress}</label><br>
				<Label><b>Description:</b>&nbsp;</Label>${route.rdescription}<br>
				<Label><b>Created By:</b>&nbsp;</Label>${route.user}<br> <br>
				<label><b>Rating:&nbsp;</b></label><input type="hidden" id="rating"
					value="${route.rating}">
				<section class='rating-widget'>
					<!-- Rating Stars Box -->
					<div class='rating-stars text-center'>
						<ul id='stars'>
							<li class='star' title='Poor' data-value='1'><i
								class='fa fa-star fa-fw'></i></li>
							<li class='star' title='Fair' data-value='2'><i
								class='fa fa-star fa-fw'></i></li>
							<li class='star' title='Good' data-value='3'><i
								class='fa fa-star fa-fw'></i></li>
							<li class='star' title='Excellent' data-value='4'><i
								class='fa fa-star fa-fw'></i></li>
							<li class='star' title='WOW!!!' data-value='5'><i
								class='fa fa-star fa-fw'></i></li>
						</ul>
					</div>
					<div class='success-box'>
						<div class='clearfix'></div>
						<img alt='tick image' width='32'
							src='data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0MjYuNjY3IDQyNi42NjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQyNi42NjcgNDI2LjY2NzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxwYXRoIHN0eWxlPSJmaWxsOiM2QUMyNTk7IiBkPSJNMjEzLjMzMywwQzk1LjUxOCwwLDAsOTUuNTE0LDAsMjEzLjMzM3M5NS41MTgsMjEzLjMzMywyMTMuMzMzLDIxMy4zMzMgIGMxMTcuODI4LDAsMjEzLjMzMy05NS41MTQsMjEzLjMzMy0yMTMuMzMzUzMzMS4xNTcsMCwyMTMuMzMzLDB6IE0xNzQuMTk5LDMyMi45MThsLTkzLjkzNS05My45MzFsMzEuMzA5LTMxLjMwOWw2Mi42MjYsNjIuNjIyICBsMTQwLjg5NC0xNDAuODk4bDMxLjMwOSwzMS4zMDlMMTc0LjE5OSwzMjIuOTE4eiIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K' />
						<div class='text-message'></div>
						<div class='clearfix'></div>
					</div>
				</section>
		

							
			</div>
		</div>
		
		<br>
		<br>
		<br>
				<h3>Interesting Place:</h3>
				<table class="table table-dark table-hover" >
					<thead>
						<tr>
							<th>Image</th>
							<th class="text-center">Place</th>
							<th class="text-center">Location</th>
							<th class="text-center">Description</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ilist}" var="ilist">
							<tr>
								<td><img alt="image notFound" height="150" width="150"
									src="${contextPath}/images/${ilist.path}" /></td>
								<td>${ilist.iname}</td>
								<td><i class='fa fa-map-marker' style="color: lime;"></i>&nbsp;${ilist.ilocation}</td>
								<td>${ilist.idescription}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
	</div>
</body>
</html>