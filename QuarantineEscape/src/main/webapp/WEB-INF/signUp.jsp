<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Quarantine Escape - Sign Up</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyles.css">

<link rel="stylesheet" href="css/signup.css">
<jsp:include page="js/signup.js"></jsp:include>

<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">





<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<body>




	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<hr class="colorgraph colorgraph-header">
		<div class="container"></div>

	</nav>

	<div class="container">

		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<h2 class="text_align">Please Sign Up for Quarantine Escape</h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 ">

						<form action="createUser.do" method="POST">
							<div class="form-group">
								<label for="username">Username:</label> <input type="text"
									class="form-control input-lg" id="username"
									placeholder="Enter Username" name="username" required>

							</div>
							<div class="form-group">
								<label for="firstName">First Name:</label> <input type="text"
									class="form-control input-lg" id="firstName"
									placeholder="Enter First Name" name="firstName">

							</div>
							<div class="form-group">
								<label for="lastName">Last Name:</label> <input type="text"
									class="form-control input-lg" id="lastName"
									placeholder="Enter Last Name" name="lastName">

							</div>
							<div class="form-group">
								<label for="password">Password:</label> <input type="password"
									class="form-control input-lg" id="password"
									placeholder="Enter password" name="password" required>

							</div>
							<div class="form-group">
								<label for="email">Email:</label> <input type="email"
									class="form-control input-lg" id="email"
									placeholder="Enter Email" name="email" required>

							</div>
							<div class="form-group">
								<label for="userImageUrl">User Image URL:</label> <input
									type="url" class="form-control input-lg" id="userImageUrl"
									placeholder="Enter Image URL" name="userImageUrl">

							</div>
							<div class="form-group">
								<label for="userDescription">User Description:</label> <input
									type="text" class="form-control input-lg" id="userDescription"
									placeholder="Enter User Description" name="userDescription">

							</div>
							<div class="form-group">
								<label for="enabled">Enabled</label> <select name="enabled"
									id="enabled" class="btn btn-secondary dropdown-toggle" required>
									<option value="True">True</option>
									<option value="False">False</option>
								</select>
							</div>
							<div class="form-group">
								<label for="active">Active</label> <select name="active"
									id="active" class="btn btn-secondary dropdown-toggle" required>
									<option value="True">True</option>
									<option value="False">False</option>
								</select>
							</div>
							<div class="form-group">
								<label for="role">Role</label> <select name="role"
									id="role" class="btn btn-secondary dropdown-toggle" required>
									<option value="User">User</option>
									<option value="Admin">Admin</option>
								</select>
							</div>
						<!-- 	<div class="form-group">
								<label for="role">Role:</label> <input type="text"
									class="form-control input-lg" id="role"
									placeholder="Enter User Role" name="role" required>

							</div> -->
							<div style="text-align: center">
							<button type="submit" class="btn btn-primary">Sign Up</button>
							</div>
						</form>



					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>