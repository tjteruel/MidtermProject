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
<title>Quarantine Escape - Update Event</title>
</head>
<body>

	<form action="eventUpdated.do" method="POST">
		<div id="fullscreen_bg" class="fullscreen_bg" />
		<form class="form-signin">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel panel-primary">
								<h3 class="text-center">Update Event Information</h3>

								<div class="panel-body">

									<fieldset>
										<legend>Update Event</legend>
										<div class="form-group">
											<label for="title">Title: </label> <input type="text"
												value="${event.title}" name="title" id="title"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="description">Description: </label> <input
												type="text" value="${event.description}" name="description"
												id="desription" class="form-control" required />
										</div>
										<div class="form-group">
											<label for="eventDate">Event Date: </label> <input
												type="date" value="${event.eventDate}" name="eventDate"
												id="eventDate" class="form-control" required />
										</div>
										<div class="form-group">
											<label for="eventLink">Link to Event: </label> <input
												type="text" value="${event.eventLink}" name="eventLink"
												id="eventLink" class="form-control" />
										</div>
										<div class="form-group">
											<label for="publicORPrivate">Public or Private: </label> <select
												id="${event.publicOrPrivate}" name="publicOrPrivate"
												id="publicOrPrivate"
												class="btn btn-secondary dropdown-toggle" required>
												<option value="True">Public</option>
												<option value="False">Private</option>
											</select>
										</div>
										<div class="form-group">
											<label for="status">Event Status: </label> <select
												id="${event.status}" name="status" id="status"
												class="btn btn-secondary dropdown-toggle" required>
												<option value="Scheduled">Scheduled</option>
												<option value="Cancelled">Cancelled</option>
												<option value="Delayed">Delayed</option>
											</select>
										</div>
										<div class="form-group">
											<label for="eventImageUrl">Event Image URL: </label> <input
												type="url" value="${event.eventImageUrl}"
												name="eventImageUrl" id="eventImageUrl" class="form-control" />
										</div>
										<div class="form-group">
											<label for="active">Active: </label> <select name="active"
												selected="${event.active}" id="active"
												class="btn btn-secondary dropdown-toggle" required>
												<option value="True">True</option>
												<option value="False">False</option>
											</select> <input type="hidden" name="id" value="${event.id}" /> <input
												type="submit" value="Update Event" class="btn btn-primary" />
										</div>
									</fieldset>

								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
	</form>