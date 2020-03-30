<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
</head>
<body>
	<a class="btn btn-lg btn-primary" href="home.do" role="button">Home</a>
	<c:choose>
		<c:when test="${! empty event}">
			<ul>
				<li>ID: ${event.id}
				<li>Name: ${event.title}</li>
				<li>Date: ${event.eventDate}</li>
				<li>Location: ${event.location}</li>
			</ul>
			<form action="updateEvent.do" method="GET">
				<input type="hidden" name="id" value="${event.id}" />
				<button type="submit" class="btn btn-primary " value="Update Event">Update
					Dog</button>
			</form>
			<form action="deleteEvent.do" method="POST">
				<input type="hidden" name="title" value="${ event.title }" />
				<button type="submit" class="btn btn-primary " value="Delete event">Delete Event</button>
			</form>
		</c:when>
		<c:otherwise>
			<p>
				<strong>No Event Found</strong>
			</p>
		</c:otherwise>
	</c:choose>

</body>
</html>