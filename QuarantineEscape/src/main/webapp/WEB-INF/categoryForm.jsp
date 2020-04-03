<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<div class="container">
	<div class="row">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">
					<i class="fa fa-times"></i>
				</button>
				<div class="profile-userbuttons1">
					<form action="userLandingPage.do" method="POST">
						<input type="submit" value="Home" class="btn btn-success btn-sm" />
					</form>
				</div>

				<h4 class="modal-title">Ready to Add a Category?</h4>
			</div>

			<form action="createCategory.do" method="POST">
				<div class="col-md-6">
					<div class="form-group">
						<label for="categoryName">Category Name</label> <input type="text"
							class="form-control" id="categoryName"
							placeholder="Enter the Category Name" name="categoryName">
						<span class="help-block">You are Creating a New Category.</span>
					</div>
					<div class="row">
						<div class="modal-body">
							<div class="form-group">
								<label for="description">Description</label> <input type="text"
									class="form-control" id="description" name="description"
									placeholder="Enter the description"> <span
									class="help-block">Provide a Description.</span>
							</div>
						</div>
						
					</div>
				</div>

				<div class="modal-footer">
					<input type="hidden" name="isEmpty" value="">
					<button type="input" name="submit" value="newAccount"
						class="btn btn-success btn-icon">
						<i class="fa fa-check"></i> Create New Category
					</button>

				</div>
			</form>

		</div>
	</div>
</div>