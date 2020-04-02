<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/showevent.css">
<%-- <jsp:include page="js/try.js"></jsp:include> --%>
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>

	<div class="store-page-container">
		<section class="store-header">
			<h1 class="store-header-title" align="center">${event.title }</h1>
			<hr class="hidden-xs break-lines">

			<section class="store-body">
				<!-- <div class="store-content"> -->
					<!--       <picture> -->
					 <!-- <div class="img_right"> -->
        <img class="store-content" src="${event.eventImageUrl }" 
           alt="Event Image"/>  
           <!-- </div>  -->
					<!--       </picture> -->
				<!-- </div> -->
				<div class="store-info">
					<div class="store-info-container">
						<address class="store-address">
							<span>${event.location} </span> <span></span> <span
								class="text-highlight-xs">(847) 272-8920</span> <a
								href="https://www.google.com/maps/place/1775+${event.location }"
								class="text-highlight-xs text-highlight-md map">

								<hr class="break-lines" /> Map and Directions
							</a>
						</address>
						<div>
							<p>
								<b>Event Date</b><br>${event.eventDate }</p>
							<p>
								<b>Event Time</b><br>${event.eventTime }</p>
						</div>
						<ul class="store-hours">

							<li><b>Public:</b> ${event.publicOrPrivate }</li>
							<li><b>Status:</b> ${event.status }</li>
						</ul>


						<hr class="break-lines" />




						<div class="store-other-info">
							<div class="store-features">
								<div class="store-feature-title">${event.title }</div>
								<a class="store-appointment" href="${event.eventLink}">Visit
									the Website</a>
							</div>

							<div>
								<form action="attendEvent.do" method="POST" class="form-group">
									<input type="hidden" value="${event.id}" name="eventId" /> <input
										type="hidden" value="${user.id}" name="userId" /> <input
										type="submit" value="RSVP" class="btn btn-primary" />
								</form>
							</div>

							<div class="store-features hidden-xs">
								<div class="store-feature-title  text-inline">
									<b>Pre-Requisite:</b>
								</div>
								<p class="text-inline">${event.prereqs }</p>
							</div>
						</div>
					</div>
				</div>
				<hr class="break-lines" />
				<hr class="break-lines" />
				<hr class="break-lines" />
							<div class="store-features">
								<div class="store-feature-title">
									<strong>Event Details</strong>
								</div>
								<p class="store-detail">${event.description }</p>
							</div>
			</section>














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