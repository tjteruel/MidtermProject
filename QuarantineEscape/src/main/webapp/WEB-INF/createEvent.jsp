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
	<form:form action="createEvent.do" method="POST" modelAttribute="event">
		<input type="hidden" name="id" value="${event.id}">
		<form:label path="title" name="title">Title:</form:label>
		<form:input path="title" name="title"/>
		<br />
		<form:label path="description" name="description">Description:</form:label>
		<form:input path="description" name="description"/>
		<br />
		<form:label path="eventDate" name="eventDate">Event Date:</form:label>
		<form:input path="eventDate" name="eventDate"/>
		<form:errors path="eventDate" name="eventDate"/>
		<br />
		<form:label path="publicOrPrivate" name="publicOrPrivate">Public or private:</form:label>
		<form:input path="publicOrPrivate" name="publicOrPrivate"/>
		<form:errors path="publicOrPrivate" name="publicOrPrivate"/>
		<br />
		<form:label path="eventTime" name="eventTime">Event time:</form:label>
		<form:input path="eventTime" name="eventTime"/>
		<form:errors path="eventTime" name="eventTime"/>
		<br />
		<form:label path="eventLink" name="eventLink">Link to event:</form:label>
		<form:input path="eventLink" name="eventLink"/>
		<form:errors path="eventLink" name="eventLink"/>
		<br />
		<form:label path="eventImageUrl" name="eventImageUrl">Image:</form:label>
		<form:input path="eventImageUrl" name="eventImageUrl"/>
		<form:errors path="eventImageUrl" name="eventImageUrl"/>
		<br />





		<input type="submit" value="Modify" />

	</form:form>

</body>
</html>