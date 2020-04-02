<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Quarantine Escape</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyles.css">
<link rel="stylesheet" href="css/searchbar.css">
<!-- <link rel="stylesheet" href="css/try.css"> -->

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
			<a class="navbar-brand" href="home.do">Quarantine Escape</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="createUserPage.do">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link" href="signInPage.do">Log
							In</a></li>


					<li>
						<form action="findUser.do" method="GET" id="id"
							class="form-inline my-2 my-lg-0 ">
							<input class="form-control sm-2" size="12" name="id"
								type="search" placeholder="Enter User Id" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form>
					</li>
					<li>
						<form action="findEvent.do" method="GET" id="id"
							class="form-inline my-2 my-lg-0 ">
							<input class="form-control sm-2" size="12" name="id"
								type="search" placeholder="Enter Event Id" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form>
					</li>
				</ul>
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

	<!-- ======= Main Section ======= -->
	<section id="portfolio" class="section-bg">
		<div class="container">

			<header class="section-header">
				<h3 class="section-title" align="center">Our Events</h3>
				</header>
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
						<h4>Useful Links</h4>
						<ul>
							<li><i class="ion-ios-arrow-right"></i> <a href="home.do">Home</a></li>

							<li><i class="ion-ios-arrow-right"></i> <a
								href="meetTheTeam.do">Meet the Team</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listEvents.do">Events</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="createUserPage.do">SignUp</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="signInPage.do">Login</a></li>
							<li><i class="ion-ios-arrow-right"></i> <a
								href="listUsers.do">List Users</a></li>
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
					<div class="col-lg-3 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Subscribe for our Newsletter.</p>
						<form action="subscribe.do" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				<strong>Quarantine Escape</strong>
			</div>
			<div class="credits">Designed by: Ankit Shah, Christina
				Rowland, David Yoachum, Tim Teruel</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- Bootstrap core JavaScript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/wow/wow.min.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/superfish/superfish.min.js"></script>
	<script src="assets/vendor/hoverIntent/hoverIntent.js"></script>
	<script src="assets/vendor/jquery-touchswipe/jquery.touchSwipe.min.js"></script>

</body>

</html>