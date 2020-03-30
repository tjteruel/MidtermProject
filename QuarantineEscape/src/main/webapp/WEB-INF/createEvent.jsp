<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="updateEvent.do" method="POST" modelAttribute="event">
		<input type="hidden" name="id" value="${event.id}">
		<form:label path="title">Title:</form:label>
		<form:input path="title" />
		<br />
		<form:label path="description">Description:</form:label>
		<form:input path="description" />
		<br />
		<form:label path="eventDate">Event Date:</form:label>
		<form:input path="eventDate" />
		<form:errors path="eventDate" />
		<br />
		<form:label path="publicOrPrivate">Public or private:</form:label>
		<form:input path="publicOrPrivate" />
		<form:errors path="publicOrPrivate" />
		<br />
		<form:label path="eventTime">Event time:</form:label>
		<form:input path="eventTime" />
		<form:errors path="eventTime" />
		<br />
		<form:label path="eventLink">Link to event:</form:label>
		<form:input path="eventLink" />
		<form:errors path="eventLink" />
		<br />
		<form:label path="eventImageUrl">Image:</form:label>
		<form:input path="eventImageUrl" />
		<form:errors path="eventImageUrl" />
		<br />





		<input type="submit" value="Modify" />

	</form:form>

</body>
</html>