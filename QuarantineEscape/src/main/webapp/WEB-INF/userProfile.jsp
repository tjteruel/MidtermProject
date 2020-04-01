<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta charset="UTF-8">
<title>COVID AND CHILL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/show.css">
<jsp:include page="js/show.js"></jsp:include>

</head>
<body class="h-100">
	<div class="container h-100">

		<div class="wrapper">
			<div class="outer-image">
				<img class="round-image" src="${user.userImageUrl}" height="100%">
			</div>
			<div class="header"></div>
		</div>
		<div id="centerpixel">
			<div id="Portfolio">
				<div class="inner">
					<div class="Portfolio_title">
						${user.username} <br />

					</div>
					<table class="portfolio_content">
						<tr>
							<td>First Name</td>
							<td class="one">:</td>
							<td>${user.firstName }</td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td class="one">:</td>
							<td>${user.lastName }</td>
						</tr>
						<tr>
							<td>User Description</td>
							<td class="one">:</td>
							<td>${user.userDescription }</td>
						</tr>
						<tr>
							<td>User Email</td>
							<td class="one">:</td>
							<td>${user.email }</td>
						</tr>
						<tr>
							<td>Role</td>
							<td class="one">:</td>
							<td>${user.role }</td>
						</tr>
						<tr>
							<td>Active</td>
							<td class="one">:</td>
							<td>${user.enabled }</td>
						</tr>
						
						<tr></tr>
						<tr></tr>
						<tr></tr>
						
					<c:forEach var="event" items="${events}">
						<tr>
							<td>Event</td>
							<td class="one">:</td>
							<td>${event.title}</td>
						</tr>
						<tr>
							<td>Location</td>
							<td class="one">:</td>
							<td>${event.location }</td>
						</tr>
						<tr>
							<td>Date</td>
							<td class="one">:</td>
							<td>${event.eventDate }</td>
						</tr>
						<tr>
							<td>Description</td>
							<td class="one">:</td>
							<td>${event.description }</td>
						</tr>
						</c:forEach>

						
						
						
					<%-- 	
					<thead>


					<th>Event</th>
					<th>Location</th>
					<th>Date</th>
					<th>Description</th>
					<th></th>

				</thead>
				<tbody>
					<c:forEach var="event" items="${events}">
						<tr>
							<td>${event.title}</td>
							<td>${event.location}</td>
							<td>${event.eventDate}</td>
							<td>${event.description}</td>
							<td>Remove Event from Attending List <form action="deleteEvent.do" method="POST" class="form-group">
											<input type="hidden" value="${event.id}" name="eventId" /> <input
												type="submit" value="Delete" class="btn btn-danger" />
										</form>
							</td>
						</tr>
					</c:forEach>

				</tbody> --%>
				
				
				
					</table>
					
					
					
				</div>
			</div>
		</div>
		</div>
		</body>


		<!-- DELETE USER -->
		<%-- 	<div class="btn-group;text-center" role="group" style="text-align:center" >
				<button type="button" class="btn btn-info btn-sm" >
		<form action="deleteUser.do" method="POST" class="form-group">
			<input type="hidden" value="${user.id}" name="userId" /> <input
				type="submit" value="Delete" class="btn btn-info" />
		</form>
		</button> --%>

		<%-- 	<!-- Home Button -->
		<a href="deleteUser.do" method="POST" value="${user.id }"> <span
			class="glyphicon glyphicon-trash"></span>
		</a> <a href="home.do"> <span class="glyphicon glyphicon-home"></span>
		</a> --%>
		<!-- <button type="button" class="btn btn-info btn-sm" >
		<form action="home.do" method="POST" class="form-group">
			<input type="hidden" name="food" /> <input
				type="submit" value="Home" class="btn btn-info" /> -->
<!-- 
		</form>
		</button>
	</div>

	</div> -->


	<!-- DISPLAY USERS EVENTS -->
<%-- 	<div class="col-md-12">
		<h4 class="text_align">List Of RSVP Events</h4>
		<div class="table-responsive">


			<table id="mytable" class="table table-bordred table-striped">

				<thead>


					<th>Event</th>
					<th>Location</th>
					<th>Date</th>
					<th>Description</th>
					<th></th>

				</thead>
				<tbody>
					<c:forEach var="event" items="${events}">
						<tr>
							<td>${event.title}</td>
							<td>${event.location}</td>
							<td>${event.eventDate}</td>
							<td>${event.description}</td>
							<td>Remove Event from Attending List <form action="deleteEvent.do" method="POST" class="form-group">
											<input type="hidden" value="${event.id}" name="eventId" /> <input
												type="submit" value="Delete" class="btn btn-danger" />
										</form>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<!-- Home Button -->
			<form action="home.do" method="POST">
				<input type="submit" value="Home" class="btn btn-primary" />
			</form>
			<!-- UPDATE USER -->
			<form action="updatePage.do" method="POST">
				<input type="hidden" value="${user.id}" name="user" /> <input
					type="submit" value="Update Profile" class="btn btn-primary" />
			</form>
</body> --%>
</html>