<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape - User Profile</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyles.css">
</head>
<body>
	<div class ="container-fluid">
		<h3>First Name: ${loggedInUser.firstName} Last Name${loggedInUser.lastName}(ID: ${loggedInUser.id})</h3>
		<p>Username: ${loggedInUser.username}</p>
		<p>Description: ${loggedInUser.userDescription}</p>
		<p>Image: ${loggedInUser.userImageUrl}</p>
	</div> 
	
       
</body>
</html>