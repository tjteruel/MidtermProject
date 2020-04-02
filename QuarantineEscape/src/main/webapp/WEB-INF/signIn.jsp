

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<head>


<link rel="stylesheet" href="css/signIn.css">
<jsp:include page="js/signin.js"></jsp:include>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<head>





</head>





<body>


	<div class="container">
		<div class="card card-container">

			<img id="profile-img" class="profile-img-card"
				src="https://2.bp.blogspot.com/-A-UiF-5439M/TnS-h_4EaqI/AAAAAAAAAxg/wDWLcMGdMYs/s1600/Free-Scooby-Doo-Picture-Download-Photo.jpg" />
			<p id="profile-name" class="profile-name-card"></p>
			<form action="signIn.do" method="post">
				<span id="reauth-email" class="reauth-email"></span> <input
					type="text" id="username" name="username" class="form-control"
					placeholder="Enter Username" required autofocus> <input
					type="password" id="password" name="password" class="form-control"
					placeholder="Enter Password" required>
				<div id="remember" class="checkbox"></div>
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit">Sign in</button>
			</form>

		</div>
	</div>




</body>
</html>