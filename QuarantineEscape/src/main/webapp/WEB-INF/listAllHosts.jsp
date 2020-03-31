
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta charset="UTF-8">
<jsp:include page="js/listAllUsers.js"></jsp:include>
<link rel="stylesheet" href="css/locationForm.css">
<title>Quarantine Escape - Users</title>



</head>
<body>
	<h4 class="text_align">List of Hosts in Database</h4>
	<div class="container">
		<div class="row">


			<div class="col-md-12">
	
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>
							<tr>
								<th>Host ID</th>
								<th>Host Name</th>
								<th>Email</th>
								<th>Phone Number</th>
								<th>URL</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach var="host" items="${hosts}">
								<tr>
									<td>${host.id}</td>
									<td>${host.hostName}</td>
									<td>${host.email}</td>
									<td>${host.phoneNumber}</td>
									<td><a href="${host.url}">Click Here</a></td>

									<td>
										<form action="updateHostPage.do" method="POST">
											<input type="hidden" value="${host.id}" name="host" /> <input
												type="submit" value="Update" class="btn btn-primary" />
										</form>
									</td>
									<td>
										<form action="deleteHost.do" method="POST" class="form-group">
											<input type="hidden" value="${host.id}" name="hostId" /> <input
												type="submit" value="Delete" class="btn btn-danger" />
										</form>
									</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div class="clearfix"></div>
					<ul class="pagination pull-right">
						<li class="disabled"><a href="#"><span
								class="glyphicon glyphicon-chevron-left"></span></a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</ul>

				</div>

			</div>
		</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
</body>
</html>