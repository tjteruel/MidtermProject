<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="userLandingPage.css">
<meta charset="UTF-8">
<title>User Home Page</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.do">Health Together</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

						<c:if test="${! empty sessionScope.user}">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="userhome.do"> ${sessionScope.user.firstName}'s Profile<span class="sr-only"></span></a></li>
				
					<li class="nav-item"><a class="nav-link"
						href="createupdateuser.do">Update Account</a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="createworkout.do"> Create Workout </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="finishedworkout.do">Workout History</a></li>
				<c:if test="${! empty sessionScope.user.firstName}">
					<li class="nav-item dropdown"><a class="nav-link"
						href="logout.do"> Logout </a></li>
				</c:if>


				</ul>

				<c:if test="${sessionScope.user.id==1}">
					<form class="form-inline my-2 my-lg-0" action="admin.do">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
							name="searchterm">Admin Function</button>
					</form>
				</c:if>
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
						name="searchterm">Show All Workouts</button>


				</form>
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search Workout" aria-label="Search" name="searchterm">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

				</form>
			
			</div>
			</c:if>
		</nav>
	</header>



	<main>
	

		<c:if test="${!empty activeWorkout}">
		<div class="card mb-3"
			style="max-width: 30rem; text-align: center; margin: auto; ">
			<img class="card-img-top go-hard"
				src="https://i1.sndcdn.com/avatars-000369555311-i351q4-t500x500.jpg"
				alt="Card image cap" style="max-height: 150px;">
			<div class="card-body">
				<h5 class="card-title">
					<strong class="user">${sessionScope.user.firstName}
						${sessionScope.user.lastName} Hosted Workouts</strong>
				</h5>
				<p class="card-text"></p>
			</div>
		</div>
		
		</c:if>
		<div class="card-columns">
		<c:if test="${!empty sessionScope.user.workouts}">
			<c:forEach var="myworkout" items="${sessionScope.user.workouts}">


			<c:if test="${myworkout.active}">

				<c:if test="${myworkout.active}">
					<c:if test="${myworkout.title ne 'D0NTEVER$HOW' }">

					<div class="card" style="width: 23rem;">
						<img class="card-img-top" src="${myworkout.activity.image}"
							alt="Card image cap" style="max-height: 205px">
						<div class="card-body">
							<h5 class="card-title">${myworkout.title}</h5>
							<p class="card-text"></p>
							<table>
								<tr>
									<td><strong>Host:</strong> ${myworkout.user.firstName} ${myworkout.user.lastName}</td>
								</tr>
								<tr>
									<td><strong>Date:</strong> ${myworkout.workoutDate}</td>
								</tr>
								<tr>
									<td><strong>Workout Name:</strong>
										${myworkout.location.name}</td>
								</tr>
								<tr>
									<td><strong>Description:</strong> ${myworkout.description}</td>
								</tr>
							</table>

							<a href="editworkout.do?wid=${myworkout.id}" class="btn btn-primary">Edit</a>
								<form action="workoutbyid.do">
								<input type='hidden' value=${myworkout.id } name='id' />
								<button type='submit' class="btn btn-primary">Detail</button>
								</form>
							<form action="deleteworkout2.do">
								<input type='hidden' value=${myworkout.id } name='wid' />
								<button type='submit' class="btn btn-primary">Delete</button>
							</form>
							<a href="deleteworkout.do?wid=${myworkout.id}" class="btn btn-primary">Completed</a>
						</div>
					</div>
					
			</c:if>


				</c:if>
</c:if>

			</c:forEach>
			</c:if>
			</div>
		
		<c:if test="${!empty activeGuestWorkout}">
		<div class="card mb-3"
			style="max-width: 30rem; text-align: center; margin: auto;">
			<img class="card-img-top go-hard"
				src="https://i.pinimg.com/originals/ca/13/d7/ca13d709f44fb8937dc5cc86c2d3f0f3.jpg"
				alt="Card image cap" style="max-height: 150px;">
			<div class="card-body">
				<h5 class="card-title">
					<strong class="user">${sessionScope.user.firstName}
						${sessionScope.user.lastName} Joined Workouts</strong>
				</h5>
				<p class="card-text"></p>
			</div>
		</div>
			</c:if>
				<c:if test="${!empty sessionScope.user.guestWorkouts}">
			<div class="card-columns">
		
			<c:forEach var="myworkout" items="${sessionScope.user.guestWorkouts}">
				<c:if test="${myworkout.active}">
					<c:if test="${myworkout.title ne 'D0NTEVER$HOW' }">

						<div class="card" style="width: 23rem">
							<img class="card-img-top" src="${myworkout.activity.image}"
								alt="Card image cap" style="max-height: 205px" >
							<div class="card-body">
								<h5 class="card-title">${myworkout.title}</h5>
								<p class="card-text"></p>
								<table>
									<tr>
										<td><strong>Host:</strong> ${myworkout.user.firstName}
											${myworkout.user.lastName}</td>
									<tr>
										<td><strong>Date:</strong> ${myworkout.workoutDate}</td>
									</tr>
									<tr>
										<td><strong>Workout Name:</strong>
											${myworkout.location.name}</td>
									</tr>
									<tr>
										<td><strong>Description:</strong>
											${myworkout.description}</td>
									</tr>
								</table>

								<form action="workoutbyid.do">
									<input type='hidden' value=${myworkout.id } name='id' />
									<button type='submit' class="btn btn-primary">Detail</button>
								</form>
								<form action="removeguestfromworkout.do">
									<input type='hidden' value="${myworkout.id}" name='wid' />
									<button type='submit' class="btn btn-primary">Cancel
										Invitation</button>
								</form>
							</div>
						</div>
					</c:if>
			
		</c:if>
			</c:forEach>
			</div>
			</c:if>
	</main>

</body>
</html>