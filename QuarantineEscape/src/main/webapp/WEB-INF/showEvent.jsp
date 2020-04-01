<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta charset="UTF-8">
<title>Event</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/show.css">
<jsp:include page="js/showEvent.js"></jsp:include>

</head>
<body class="h-100">
	<div class="container h-100">

		<div class="wrapper">
			<div class="outer-image">
				<img class="round-image" src="${event.eventImageUrl}" height="100%">
			</div>
			<div class="header"></div>
		</div>
		<div id="centerpixel">
			<div id="Portfolio">
				<div class="inner">
					<div class="Portfolio_title">
						${event.title} <br />

					</div>
					<table class="portfolio_content">
						<tr>
							<td>Description</td>
							<td class="one">:</td>
							<td>${event.description}</td>
						</tr>
						<tr>
							<td>Event Date</td>
							<td class="one">:</td>
							<td>${event.eventDate}</td>
						</tr>
						<tr>
							<td>Time</td>
							<td class="one">:</td>
							<td>${event.eventTime}</td>
						</tr>
						<tr>
							<td>Link</td>
							<td class="one">:</td>
							<td>${event.eventLink}</td>
						</tr>
						<tr>
							<td>Public or Private</td>
							<td class="one">:</td>
							<td>${event.publicOrPrivate}</td>
						</tr>
						<tr>
							<td>Prereqs</td>
							<td class="one">:</td>
							<td>${event.prereqs}</td>
						</tr>
						<tr>
							<td>Active</td>
							<td class="one">:</td>
							<td>${event.active}</td>
						</tr>

						<tr>
					</table>
				</div>
			</div>
		</div>


		

		
	</div>

	


	

			<!-- Home Button -->
			<form action="home.do" method="POST">
				<input type="submit" value="Home" class="btn btn-primary" />
			</form>
			<!-- UPDATE USER -->
			<form action="updateEventPage.do" method="POST">
				<input type="hidden" value="${event.id}" name="event" /> <input
					type="submit" value="Update Profile" class="btn btn-primary" />
			</form>
</body>
</html>