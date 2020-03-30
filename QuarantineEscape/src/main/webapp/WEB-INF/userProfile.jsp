<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape - User Profile</title>

	<div class ="container-fluid">
		<h3>First Name: ${user.firstName} Last Name${user.lastName}(ID: ${user.id})</h3>
		<p>Email: ${user.email}</p>
		<p>Description: ${user.description}</p>
		<p>Image: ${user.breed}</p>
		<p>Gender: ${cat.gender}</p>
	</div>
	
</head>
<body>
</body>
</html>