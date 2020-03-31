
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

	<form action="updateTag.do" method="POST">
		<div id="fullscreen_bg" class="fullscreen_bg" />
		<form class="form-signin">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel panel-primary">
								<h3 class="text-center">Update Tag information</h3>

								<div class="panel-body">

									<fieldset>


										<div class="form-group">
											<label for="hostName">Tag Name: </label> <input type="text"
												value="${tag.tagName}" name="tagName" id="tagName"
												class="form-control" required />
										</div>


										<input type="hidden" name="id" value="${tag.id}" /> <input
											type="submit" value="Update Tag" class="btn btn-primary" />
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

