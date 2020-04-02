<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.skilldistillery.quarantineescape.entities.Role"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/show.css">
<meta charset="UTF-8">
<title>User Profile</title>
</head>
<body>



	<div class="container">
		<div class="row profile">
			<div class="col-md-3">
				<div class="profile-sidebar">
					<!-- SIDEBAR USERPIC -->
					<div class="profile-userpic">
						<img src="${user.userImageUrl}" class="img-responsive" alt="">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">${user.firstName}
							${user.lastName }</div>
						<div class="profile-usertitle-job">${user.username}</div>
					</div>
					<!-- END SIDEBAR USER TITLE -->
					<!-- SIDEBAR BUTTONS -->
					<div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">Follow</button>
						<button type="button" class="btn btn-danger btn-sm">Message</button>
					</div>
					<!-- END SIDEBAR BUTTONS -->
					<!-- SIDEBAR MENU -->

					<!-- END MENU -->

					<div class="portlet light bordered">
						<!-- STAT -->
						<div class="row list-separated profile-stat">
							<div class="col-md-4 col-sm-4 col-xs-6">
								<div class="uppercase profile-stat-title">${user.role}</div>
								<div class="uppercase profile-stat-text">Role</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-6">
								<div class="uppercase profile-stat-title">${user.createdAt }
								</div>
								<div class="uppercase profile-stat-text">Joined</div>
							</div>

						</div>
						<!-- END STAT -->
						<div>
							<h4 class="profile-desc-title">About ${user.firstName}
								${user.lastName }</h4>
							<span class="profile-desc-text"> ${user.userDescription }
							</span>
							<div class="margin-top-20 profile-desc-link">
								<i class="fa fa-globe"></i> <a href="#">${user.email}</a>
							</div>


						</div>
					</div>



				</div>
			</div>
			<div class="col-md-9">
				<div class="profile-content">

					<!--  -->





					<div class="profile-userbuttons1">
						<form action="userLandingPage.do" method="POST">
							<input type="submit" value="Home" class="btn btn-success btn-sm" />
						</form>
					</div>




					<div class="container">
						<div class="row">
							<div class="col-xs-12">
								<table class="table table-bordered table-hover"
									data-tablesaw-mode="columntoggle" data-tablesaw-minimap>
									<caption class="text-center">
										List of Events for the ${user.firstName} ${user.lastName }
										<thead>
											<tr>
												<th data-tablesaw-priority="persist">Event</th>
												<th data-tablesaw-priority="2">Date</th>
												<th data-tablesaw-priority="3">Description</th>
												<th data-tablesaw-priority="4"> </th>
											</tr>
										</thead>
										<tbody>

									
											<c:set var="role" value="<%=Role.Admin%>" />
											<c:forEach var="ae" items="${attendingEvents}">
												<tr>

													<td><a href="findEvent.do?id=${ae.event.id}">${ae.event.title}</a></td>
													<td>${ae.event.eventDate}</td>
													<td>${ae.event.description}</td>
												<c:choose>		
												<c:when test="${not empty loggedInUser or loggedInUser.role == role}">
												<c:if test="${loggedInUser.id == user.id or loggedInUser.role == role}">
													<td><form action="unattendEvent.do" method="POST"
															class="form-group">
															<input type="hidden" value="${ae.event.id}"
																name="eventId" /> <input type="submit" value="Remove"
																class="btn btn-danger" />
														</form></td>
														</c:if>
														</c:when>
														</c:choose>



												</tr>


												<!-- UPDATE USER -->


											</c:forEach>
											<!-- Home Button -->
								</table>
								</tbody>

							</div>

						</div>
					</div>
					
					
					<div class="profile-userbuttons1">
					<c:choose>
					<c:when test="${not empty loggedInUser or loggedInUser.role == role}">
					<c:if test="${loggedInUser.id == user.id or loggedInUser.role == role}">

						<form action="updatePage.do" method="POST">
							<input type="hidden" value="${user.id}" name="user" /> <input
								type="submit" value="Update Profile"
								class="btn btn-danger btn-sm" />
						</form>
						</c:if>
						</c:when>
						</c:choose>
					</div>


					<!--  -->
				</div>
			</div>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>



</body>
</html>