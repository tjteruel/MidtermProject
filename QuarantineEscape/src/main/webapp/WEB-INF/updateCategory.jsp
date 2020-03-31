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
<title>Quarantine Escape - Update Category</title>
</head>
<body>

	<form action="updateCategory.do" method="Post">
		<div id="fullscreen_bg" class="fullscreen_bg" />
		<form class="form-signin">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel panel-primary">
								<h3 class="text-center">Update Category information</h3>

								<div class="panel-body">

									<fieldset>
										<legend>Update Category</legend>
										<div class="form-group">
											<label for="categoryName">Name: </label> <input
												type="text" value="${category.categoryName}" name="categoryName"
												id="categoryName" class="form-control" required />
										</div>
										<div class="form-group">
											<label for="description">Description: </label> <input type="text"
												value="${category.description}" name="description" id="description"
												class="form-control" required />
										</div>
										<div class="form-group">
											<label for="categoryImageUrl"> Image URL: </label> <input type="text"
												value="${category.categoryImageUrl}" name="categoryImageUrl" id="categoryImageUrl"
												class="form-control" required />
										</div>
										
										<input type="hidden" name="id" value="${category.id}" /> <input
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

 
 
 