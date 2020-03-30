<hr class="colorgraph colorgraph-footer"><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<head>

<link rel="stylesheet" href="css/locationForm.css">
<%-- <jsp:include page="js/signup.js"></jsp:include>  --%>



</head>
<body>
	<div class="container-fluid">
		<div class="row no-gutter">
			<div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
			<div class="col-md-8 col-lg-6">
				<div class="login d-flex align-items-center py-5">
					<div class="container">
						<div class="row">
							<div class="col-md-9 col-lg-8 mx-auto">
								<h3 class="login-heading mb-4">Welcome back!</h3>
								<form action="signIn.do">
									<div class="form-label-group">
										<input type="text" id="username" name="username" class="form-control"
											placeholder="Enter Username" required autofocus> <label
											for="username">Username</label>
									</div>

									<div class="form-label-group">
										<input type="password" id="password" name="password" class="form-control"
											placeholder="Enter Password" required> <label
											for="password">Password</label>
									</div>

									<div class="custom-control custom-checkbox mb-3">
										<input type="checkbox" class="custom-control-input"
											id="customCheck1"> <label
											class="custom-control-label" for="customCheck1">Remember
											Password</label>
									</div>
									<button
										class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
										type="submit">Sign in</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>