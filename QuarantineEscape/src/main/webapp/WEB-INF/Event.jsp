<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyles.css">
</head>
<body class="h-100">
	<div class="container h-100">
		<div class="row h-100 justify-content-center align-items-center">
			<div class="col-10 col-md-8 col-lg-6">
				<div class="container-fluid">
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
								<button type="submit" class="btn btn-primary "
									value="Update Event">Update Event</button>
							</form>
							<form action="deleteEvent.do" method="POST">
								<input type="hidden" name="title" value="${ event.title }" />
								<button type="submit" class="btn btn-primary "
									value="Delete event">Delete Event</button>
							</form>
						</c:when>
						<c:otherwise>
							<p>
								<strong>No Event Found</strong>
							</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>