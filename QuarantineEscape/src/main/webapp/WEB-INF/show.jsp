<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta charset="UTF-8">
<title>COVID AND CHILL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/show.css">
<jsp:include page="js/show.js"></jsp:include>

</head>
<body class="h-100">
	<div class="container h-100">

		<div class="wrapper">
			<div class="outer-image">
				<img class="round-image"

				src="${user.userImageUrl}" 
				 
					height="100%">
			</div>
			<div class="header"></div>
		</div>
		<div id="centerpixel">
			<div id="Portfolio">
				<div class="inner">
					<div class="Portfolio_title">
						${user.username}
						

						<br />

					</div>
					<table class="portfolio_content">
						<tr>
							<td>First Name</td>
							<td class="one">:</td>
							<td>${user.firstName }</td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td class="one">:</td>
							<td>${user.lastName }</td>
						</tr>
						<tr>
							<td>Role</td>
							<td class="one">:</td>
							<td>${user.role }</td>
						</tr>
						<tr>
							<td>Active</td>
							<td class="one">:</td>
							<td>${user.enabled }</td>
						</tr>

						<tr>
					</table>
				</div>
			</div>
		</div>
		<!-- DELETE USER -->
		<%-- 	<div class="btn-group;text-center" role="group" style="text-align:center" >
				<button type="button" class="btn btn-info btn-sm" >
		<form action="deleteUser.do" method="POST" class="form-group">
			<input type="hidden" value="${user.id}" name="userId" /> <input
				type="submit" value="Delete" class="btn btn-info" />
		</form>
		</button> --%>

	<%-- 	<!-- Home Button -->
		<a href="deleteUser.do" method="POST" value="${user.id }"> <span
			class="glyphicon glyphicon-trash"></span>
		</a> <a href="home.do"> <span class="glyphicon glyphicon-home"></span>
		</a> --%>
		<!-- <button type="button" class="btn btn-info btn-sm" >
		<form action="home.do" method="POST" class="form-group">
			<input type="hidden" name="food" /> <input
				type="submit" value="Home" class="btn btn-info" /> -->

		</form>
		</button>
	</div>

	</div>
	

</body>
</html>