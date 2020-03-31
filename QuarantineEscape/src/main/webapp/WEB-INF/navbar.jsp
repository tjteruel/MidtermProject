<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
		<div class="container">
			<a class="navbar-brand" href="home.do">Quarantine Escape</a>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="categoryForm.do">Add
						Categories</a></li>
				<li class="nav-item"><a class="nav-link" href="locationForm.do">Add
						Locations</a></li>
				<li class="nav-item"><a class="nav-link"
					href="createEvent.do">Add Events</a></li>
			</ul>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="createUserPage.do">Sign Up</a></li>
					<li class="nav-item"><a class="nav-link" href="signInPage.do">Log
							In</a></li>


					<li>
						<form action="findUser.do" method="GET" id="id"
							class="form-inline my-2 my-lg-0 ">
							<input class="form-control sm-2" size="12" name="id"
								type="search" placeholder="Enter User Id" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form>
					</li>
			</div>
		</div>
		</div>




		</ul>
		</div>
		</div>
	</nav>