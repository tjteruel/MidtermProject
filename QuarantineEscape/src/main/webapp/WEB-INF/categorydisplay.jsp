
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.quarantineescape.entities.Role"%>
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

<link rel="stylesheet" href="css/locationForm.css">
<title>Quarantine Escape - Categories</title>



</head>
<body>


		<div class="container">
	<div class="row">



			<div class="col-md-12">
				<h4 class="text_align">List Of Categories</h4>
				<div class="profile-userbuttons1">
					<form action="userLandingPage.do" method="POST">
						<input type="submit" value="Home" class="btn btn-success btn-sm" />
					</form>
				</div>
				<div class="table-responsive">


					<table id="mytable" class="table table-bordred table-striped">

						<thead>


							<th>Name</th>
							<th>Description</th>


						</thead>
						<tbody>
							<c:forEach var="category" items="${categories}">
								<tr>
									<td>${category.categoryName}</td>
									<td>${category.description}</td>
									<td><img src="${category.categoryImageUrl}" width="325"
										height="150" /> <c:set var="Admin" value="<%=Role.Admin%>" />
										<c:if test="${loggedInUser.role == Admin}">
											<td>

												<form action="updateCategoryPage.do" method="POST">

													<input type="hidden" value="${category.id}" name="category" />
													<input type="submit" value="Update" class="btn btn-primary" />
												</form>
											</td>

										</c:if>
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

	<script src="js/listAllUsers.js"></script>

	<script src="js/listAllUsers.js"></script>


</body>
</html>