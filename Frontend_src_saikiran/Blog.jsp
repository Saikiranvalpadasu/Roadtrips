<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<body data-gr-c-s-loaded="true">
	<div class="container-fluid" style="height: 75px;">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<div class="nav-container">
				<nav
					class="navbar navbar-expand-lg my-nav fixed-top  bg bg-secondary">
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

	<div class="bgimg-1">
		<div class="caption">
			<span class="border">Charminar</span>
		</div>
	</div>

	<div
		style="color: #777; background-color: white; text-align: center; padding: 50px 80px; text-align: justify;">
		<h3 style="text-align: center;">Charminar</h3>
		<p style="width: 1000px;" align="justify">The Charminar,
			constructed in 1591, is a monument and mosque located in Hyderabad,
			Telangana, India. The landmark has become known globally as a symbol
			of Hyderabad and is listed among the most recognized structures in
			India. The Charminar's long history includes the existence of a
			mosque on its top floor for more than 400 years. While both
			historically and religiously significant, it is also known for its
			popular and busy local markets surrounding the structure, and has
			become one of the most frequented tourist attractions in
			Hyderabad.Charminar is also a site of numerous festival celebrations,
			such as Eid-ul-adha and Eid-ul-fitr.</p>
	</div>

	<div class="bgimg-2">
		<div class="caption">
			<span class="border"
				style="background-color: transparent; font-size: 25px; color: #f7f7f7;">Golconda</span>
		</div>
	</div>

	<div style="position: relative;">
		<div
			style="color: #ddd; background-color: #282E34; text-align: center; padding: 50px 80px; text-align: justify;">
			<p style="width: 1000px;" align="justify">Cubbon Park, officially
				called Sri Chamarajendra Park is a landmark 'lung' area of Bengaluru
				city, located (12.97°N 77.6°E) within the heart of the city in the
				Central Administrative Area. Originally created in 1870, when Major
				General Richard Sankey was the then British Chief Engineer of Mysore
				state, it covered an area of 100 acres (0.40 km2) and subsequent
				expansion has taken place and the area reported now is about 300
				acres (1.2 km2).It has a rich recorded history of abundant flora and
				fauna plantations coupled with numerous impressive and aesthetically
				located buildings and statues of famous personages, in its
				precincts.</p>
		</div>
	</div>

	<div class="bgimg-3">
		<div class="caption">
			<span class="border"
				style="background-color: transparent; font-size: 25px; color: #f7f7f7;">Assembly</span>
		</div>
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

	<div style="position: relative;">
		<div
			style="color: #ddd; background-color: #282E34; text-align: center; padding: 50px 80px; text-align: justify;">
			<p style="width: 1000px;" align="justify">Arignar Anna Zoological
				Park (abbreviated AAZP), also known as the Vandalur Zoo, is a
				zoological garden located in Vandalur, is in the southwestern part
				of Chennai, Tamil Nadu, about 31 kilometres (19 mi) from the Chennai
				Central and 15 kilometres (9.3 mi) from Chennai Airport. Established
				in 1855, it is the first public zoo in India. It is affiliated with
				the Central Zoo Authority of India. Spread over an area of 602
				hectares (1,490 acres), including a 92.45-hectare (228.4-acre)
				rescue and rehabilitation centre, the park is the largest zoological
				park in India. The zoo houses 2,553 species of flora and fauna
				across 1,265 acres (512 ha). As of 2012 the park houses around 1,500
				wild species, including 46 endangered species, in its 160
				enclosures. As of 2010, there were about 47 species of mammals, 63
				species of birds, 31 species of reptiles, 5 species of amphibians,
				28 species of fishes, and 10 species of insects in the park. The
				park, with an objective to be a repository of the state's fauna, is
				credited with being the second wildlife sanctuary in Tamil Nadu
				after Mudumalai National Park.</p>
		</div>
	</div>

	<div class="bgimg-1">
		<div class="caption">
			<span class="border">Keep Travelling !!</span>
		</div>
	</div>

</body>
</html>
