 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<link rel="stylesheet" href="css/update.css">
<meta charset="UTF-8">
<title>Quarantine Escape - Update User</title>
</head>
<body>

	<form action="updateUser.do" method="Post">
		<div id="fullscreen_bg" class="fullscreen_bg" />
		<form class="form-signin">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel panel-primary">
								<h3 class="text-center">Update User information</h3>

								<div class="panel-body">

									<fieldset>
										<legend>Update User</legend>
										<div class="form-group">
											<label for="firstName">First Name: </label> <input
												type="text" value="${user.firstName}" name="firstName"
												id="firstName" class="form-control" required />
										</div>
										<div class="form-group">
											<label for="lastName">Last Name: </label> <input type="text"
												value="${user.lastName}" name="lastName" id="lastName"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="username">UserName: </label> <input type="text"
												value="${user.username}" name="username" id="username"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="password">Password: </label> <input type="text"
												value="${user.password}" name="password" id="password"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="role">Role: </label> <input type="text"
												value="${user.role}" name="role" id="role"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="enabled">Enabled: </label> <select name="enabled"
												selected="${user.enabled}" id="enabled"
												class="btn btn-secondary dropdown-toggle" required>
												<option value="True">True</option>
												<option value="False">False</option>
											</select>
										</div>
										<input type="hidden" name="id" value="${user.id}" /> <input
											type="submit" value="Update User" class="btn btn-primary" />
									</fieldset>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</form>

</body>
</html>

 
 
 