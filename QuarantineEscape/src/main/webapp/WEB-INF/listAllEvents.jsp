
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta charset="UTF-8">
<jsp:include page="js/listAllUsers.js"></jsp:include>
 <link rel="stylesheet" href="css/locationForm.css">
<title>Quarantine Escape - Users</title>



</head>
<body>

	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4 class="text_align">List Of Events</h4>
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>


							<th>Event</th>
							<th>Location</th>
							<th>Date</th>
							<th>Description</th>
							<th>Prereqs</th>
							<th>Event Link</th>
							
						</thead>
						<tbody>
							<c:forEach var="event" items="${events}">
								<tr>
									<td>${event.title}</td>
									<td>${event.location}</td>
									<td>${event.eventDate}</td>
									<td>${event.description}</td>
									<td>${event.prereqs}</td>
									<td><a href="${event.eventLink}">Click Here</a></td>

									<td>

										<form action="updateEventPage.do" method="POST">

											<input type="hidden" value="${event.id}" name="event" /> <input
												type="submit" value="Update" class="btn btn-primary" />
										</form>
									</td>
									<td>
										<form action="deleteEvent.do" method="POST" class="form-group">
											<input type="hidden" value="${event.id}" name="eventId" /> <input
												type="submit" value="Delete" class="btn btn-danger" />
										</form>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<div class="clearfix"></div>
					<ul class="pagination pull-right">
						<li class="disabled"><a href="#"><span
								class="glyphicon glyphicon-chevron-left"></span></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</ul>

				</div>

			</div>
		</div>
	</div>



	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

</body>
</html>