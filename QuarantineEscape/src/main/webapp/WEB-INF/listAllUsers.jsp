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
<%-- <jsp:include page="includes/navbar.jsp"/> --%>
	<div class="container">
		<div class="row">


			<div class="col-md-12">
				<h4 class="text_align">List Of Users in the Database</h4>
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>


							<th>ID</th>
							<th>Name</th>
							<th>UserName</th>
							<th>Description</th>
							
						</thead>
						<tbody>
							<c:forEach var="user" items="${users}">
							<c:if test="${user.active }">
								<tr>
									<td>${user.id}</td>
									<td>${user.firstName}</td>
									<td>${user.username}</td>
									<td>${user.userDescription}</td>

									<td>

										<form action="updatePage.do" method="POST">

											<input type="hidden" value="${user.id}" name="user" /> <input
												type="submit" value="Update" class="btn btn-primary" />
										</form>
									</td>
									<td>
										<form action="deactivateUser.do" method="POST" class="form-group">
											<input type="hidden" value="${user.id}" name="userId" /> <input
												type="submit" value="Deactivate" class="btn btn-danger" />
										</form>
									</td>
								</tr>
								</c:if>
							</c:forEach>

						</tbody>
						<div>
						<form action="userLandingPage.do" method="POST">
							<input type="submit" value="Home" class="btn btn-success btn-sm" />
						</form>
					</div>
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