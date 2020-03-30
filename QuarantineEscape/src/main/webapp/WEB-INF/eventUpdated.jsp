<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Event</title>
</head>
<body>

<form:form action="updateEvent.do" method="POST" modelAttribute="event">
		
		<form:label for="title" >Title:</form:label>
		<form:input value="${event.title}" path="title" name="title"/>
		<br />
		<form:label for="description" >Description:</form:label>
		<form:input value="${event.description}" path="description" name="description"/>
		<br />
		<form:label for="eventDate">Event Date:</form:label>
		<form:input value="${event.eventDate}" path="eventDate" name="eventDate"/>
		
		<br />
		<form:label for="publicOrPrivate" >Public or private:</form:label>
		<form:input value="${event.publicOrPrivate}" path="publicOrPrivate" name="publicOrPrivate"/>
		
		<br />
		<form:label for="eventTime" name="eventTime">Event time:</form:label>
		<form:input value="${event.eventTime}" path="eventTime" name="eventTime"/>
		
		<br />
		<form:label for="eventLink" name="eventLink">Link to event:</form:label>
		<form:input value="${event.eventLink}" path="eventLink" name="eventLink"/>
		
		<br />
		<form:label for="eventImageUrl" name="eventImageUrl">Image:</form:label>
		<form:input value="${event.ImageUrl}" path="eventImageUrl" name="eventImageUrl"/>
		<form:errors path="eventImageUrl" name="eventImageUrl"/>
		<br />
		
		
		
		
	
		<input type="submit" value="Modify" />
	
	</form:form>

</body>
</html>