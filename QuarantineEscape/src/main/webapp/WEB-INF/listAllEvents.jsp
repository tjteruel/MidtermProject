<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape - Events</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
  		<h2>List of Events in Database</h2>
  		<table class="table table-striped">
		<thead class="thead thead-dark">
			<tr>
				<th>Event</th>
				<th>Location</th>
				<th>Date</th>
				<th>Image</th>
				<th>Description</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="event" items="${events}">
				<tr>
					<td>${event.title}</td>
					<td>${event.location}</td>
					<td>${event.eventDate}</td>
					<td>${event.eventImageUrl}</td>
					<td>${event.description}</td>
					<td>
						<form action ="updateEvent.do" method = "POST">
						<input type="hidden" value="${event.id}" name = "event"/>
						<input type="submit" value="Update" class="btn btn-primary"/>
						</form>
					</td>
					<td>
						<form action ="deleteEvent.do" method = "POST" class="form-group">
						<input type="hidden" value="${event.id}" name = "eventId"/>
						<input type="submit" value="Delete" class="btn btn-danger"/>
						</form>
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
		</table>
		
</body>
</html>