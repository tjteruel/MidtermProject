<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Quarantine Escape - ${user.username}</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/userLandingPage.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">

</head>
<body>

	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Quarantine Escape</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li>
						<div class="dropdown">
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">User Dropdown</button>
							<div class="dropdown-menu">
								<h5 class="dropdown-header">Events</h5>
								<a class="dropdown-item" href="createEventPage.do">Add Event</a>
								<a class="dropdown-item" href="listEvents.do">List Events</a>
								<h5 class="dropdown-header">Users</h5>
								<a class="dropdown-item" href="listUsers.do">List Users</a>
								<h5 class="dropdown-header">Locations</h5>
								<a class="dropdown-item" href="locationForm.do">Add Location</a>
								<h5 class="dropdown-header">Categories</h5>
								<a class="dropdown-item" href="categoryForm.do">Add Category</a>
								<a class="dropdown-item" href="listCategories.do">List
									Categories</a>
								<h5 class="dropdown-header">Tags</h5>
								<a class="dropdown-item" href="listTags.do">List Tags</a>
								<h5 class="dropdown-header">Hosts</h5>
								<a class="dropdown-item" href="listHosts.do">List Hosts</a>
								<h5 class="dropdown-header">Team</h5>
								<a class="dropdown-item" href="meetTheTeam.do">Meet the Team</a>
							</div>
						</div>
					</li>
					<li class="nav-item active"><a class="nav-link" href="findUser.do?id=<c:out value="${loggedInUser.id }"/>">${user.username}</a></li>
						
					<li class="nav-item"><a class="nav-link" href="logout.do">Log
							Out</a></li>
					<form action="findUser.do" method="GET" id="id"
						class="form-inline my-2 my-lg-0 ">
						<input class="form-control sm-2" size="12" name="id" type="search"
							placeholder="User Id" aria-label="Search">
						<!-- <button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button> -->
					</form>
					<!-- 	</li>
					<li> -->
					
					<form action="findEvent.do" method="GET" id="id"
						class="form-inline my-2 my-lg-0 ">
						<input class="form-control sm-2" size="12" name="id" type="search"
							placeholder="Event Id" aria-label="Search">
						<!-- <button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button> -->
					</form>
				</ul>
			</div>
		</div>
	</nav>

	<header class="masthead text-center text-white">
		<div class="masthead-content">
			<div class="container">
				<h1 class="masthead-heading mb-0">Quarantine Escape</h1>
				<h2 class="masthead-subheading mb-0">Events that will Help you
					Virtually Escape your Quarantine</h2>
				<a href="https://www.cdc.gov/coronavirus/2019-ncov/index.html"
					class="btn btn-primary btn-xl rounded-pill mt-5">Visit CDC</a>
			</div>
		</div>
		<div class="bg-circle-1 bg-circle"></div>
		<div class="bg-circle-2 bg-circle"></div>
		<div class="bg-circle-3 bg-circle"></div>
		<div class="bg-circle-4 bg-circle"></div>
	</header>
	
	<!-- ======= Personal User Section ======= -->
		
			<section id="portfolio" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3 class="section-title" align="center">${user.username} Events</h3>
			</header>

			<div class="row">
				<div class="col-lg-12">
					<ul id="portfolio-flters">

					</ul>
				</div>
			</div>

		</div>

		<div class="row portfolio-container">

			<c:forEach var="ae" items="${attendingEvents}">
				
					<div
						class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
						<div class="portfolio-wrap">
							<figure>

								<div class="image-fluid">
								<img src="${ae.event.eventImageUrl}">
								</div>
								<a href="${ae.event.eventLink}" data-lightbox="portfolio"
									data-title="${ae.event.title }" class="link-preview"><i
									class="ion ion-eye"></i></a>
							</figure>

							<div class="portfolio-info">
								<h4>
									<a href="findEvent.do?id=<c:out value="${ae.event.id }"/>">${ae.event.title }</a>
								</h4>

								<p></p>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>

	</section>
	
	<!-- ======= End Personal User Section ======= -->

		<!-- ======= Main Section ======= -->
	<section id="portfolio" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3 class="section-title" align="center">Quarantine Escape Events</h3>
			</header>

			<div class="row">
				<div class="col-lg-12">
					<ul id="portfolio-flters">

					</ul>
				</div>
			</div>

		</div>

		<div class="row portfolio-container">

			<c:forEach var="event" items="${events}">
				<c:if test="${event.active}">
				
					<div
						class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
						<div class="portfolio-wrap">
							<figure>

								<div class="image-fluid">
								<img src="${event.eventImageUrl}">
								</div>
								<a href="${event.eventLink}" data-lightbox="portfolio"
									data-title="${event.title }" class="link-preview"><i
									class="ion ion-eye"></i></a>
							</figure>

							<div class="portfolio-info">
								<h4>
									<a href="findEvent.do?id=<c:out value="${event.id }"/>">${event.title }</a>
								</h4>

								<p></p>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>

	</section>
	
	<!--  -->

<!-- 	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="" alt="">
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">For those about to rock...</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>


					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="" alt="">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="p-5">
						<h2 class="display-4">We salute you!</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid rounded-circle" src="" alt="">
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">Let there be rock!</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Quod aliquid, mollitia odio veniam sit iste esse assumenda amet
							aperiam exercitationem, ea animi blanditiis recusandae! Ratione
							voluptatum molestiae adipisci, beatae obcaecati.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
 -->
	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-info">
						<h3>Quarantine Escape</h3>
						<p>The world is going through an unprecedented health crisis
							that has forced many of us to be self quarantined at home. This
							quarantine does not mean that socialization should end, there
							should be a virtual escape.</p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Quarantine Escape Links</h4>
						<ul>
							<li><i class="ion-ios-arrow-right"></i> <a href="home.do">Home</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="meetTheTeam.do">Meet the Team</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listEvents.do">List Events</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listUsers.do">List Users</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listHosts.do">List Hosts</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listCategories.do">List Categories</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listTags.do">List Tags</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							7400 E Orchard Rd <br> Greenwood Village, CO 80111<br>
							United States <br> <strong>Phone:</strong> +1 5589 55488 55<br>
							<strong>Email:</strong> info@example.com<br>
						</p>

					</div>
					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Outside Resources</h4>
						<ul>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="https://www.cdc.gov/coronavirus/2019-ncov/index.html">Center
									for Disease Control (CDC)</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="https://covid19.colorado.gov/">Colorado Department of
									Public Health and Environment (CDPHE)</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href=https://coronavirus.jhu.edu/map.html>Johns Hopkins
									University (JHU) COVID-19 Map</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="https://zoom.us/">Zoom Video Communications</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				<strong>Quarantine Escape</strong>
			</div>
			<div class="credits">
				Designed by: <a href="https://github.com/Ankitshah89">Ankit
					Shah, </a> <a href="https://github.com/rowland1318/">Christina
					Rowland, </a> <a href="https://github.com/dyoachum">David Yoachum,
				</a> <a href=https://github.com/tjteruel>Tim Tereul</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

</body>

</html>
