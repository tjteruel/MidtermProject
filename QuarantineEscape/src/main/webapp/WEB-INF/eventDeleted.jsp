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
<h2>Delete Event</h2>
  		<table class="table table-striped">
		<thead class="thead thead-dark">
		
<c:choose>
		<c:when test="${delete == true}">
			Event DELETED ${eventId}
		</c:when>
		<c:otherwise>
			<p>No Event found</p>
		</c:otherwise>
</c:choose>
</thead>
</table>
</body>
</html>