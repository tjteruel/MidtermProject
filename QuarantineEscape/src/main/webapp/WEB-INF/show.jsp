<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <!DOCTYPE html>
<html lang="en" class="h-100">
<head>
<meta charset="UTF-8">
<title>COVID AND CHILL</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyles.css">
</head>
<body class="h-100">
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="col-10 col-md-8 col-lg-6">
	<div class="container-fluid">
		<h5>${user.username}, FirstName:(${user.firstName}) LastName: (${user.lastName})</h5>
		<table class="table table-striped">
			<thead class="thead thead-dark">
				<tr>
					<th>Email</th>
				</tr>
			<tbody>

			</thead>
			</tbody>
		</table>
	</div>



		<!-- DELETE USER -->
		<div class="btn-group;text-center" role="group" style="text-align:center" >
				<button type="button" class="btn btn-info btn-sm" >
		<form action="deleteUser.do" method="POST" class="form-group">
			<input type="hidden" value="${user.id}" name="userId" /> <input
				type="submit" value="Delete" class="btn btn-info" />
		</form>
		</button>
		
		<!-- Home Button -->
				<button type="button" class="btn btn-info btn-sm" >
		<form action="home.do" method="POST" class="form-group">
			<input type="hidden" name="food" /> <input
				type="submit" value="Home" class="btn btn-info" />
				
		</form>
		</button>
		</div>
		
	</div>
	</div>
	</div>

</body>
</html>