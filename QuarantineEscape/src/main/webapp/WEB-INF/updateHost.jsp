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
<title>Quarantine Escape - Update Host</title>
</head>
<body>

	<form action="updateHost.do" method="POST">
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
										<legend>Update Host</legend>
										<div class="form-group">
											<label for="hostName">Host Name: </label> <input type="text"
												value="${host.hostName}" name="hostName" id="hostName"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="email">Host Email: </label> <input type="text"
												value="${host.email}" name="email" id="email"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="phoneNumber">Phone Number: </label> <input
												type="text" value="${host.phoneNumber}" name="phoneNumber"
												id="phoneNumber" class="form-control" required />
										</div>
										<div class="form-group">
											<label for="url">Photo URL: </label> <input type="text"
												value="${host.url}" name="url" id="url" class="form-control" />
										</div>
										<div class="form-group">
											<label for="urlLogo">User Image URL: </label> <input
												type="text" value="${host.urlLogo}" name="urlLogo"
												id="urlLogo" class="form-control" />
										</div>
										<div class="form-group">
											<label for="address">Location Address: </label> <input type="text"
												value="${host.location.address}" name="address" id="address"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="city">City: </label> <input type="text"
												value="${host.location.city}" name="city" id="city"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="state">Province/State: </label> <input type="text"
												value="${host.location.state}" name="state" id="state"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="country">Country: </label> <input type="text"
												value="${host.location.country}" name="country" id="country"
												class="form-control" />
										</div>
										<div class="form-group">
											<label for="postalCode">Postal Code: </label> <input type="text"
												value="${host.location.country}" name="postalCode" id="postalCode"
												class="form-control" />
										</div>
									</fieldset>
										<div class="form-group">
										<input type="hidden" name="id" value="${host.id}" /> <input
											type="submit" value="Update Host" class="btn btn-primary" />
											</div>
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




