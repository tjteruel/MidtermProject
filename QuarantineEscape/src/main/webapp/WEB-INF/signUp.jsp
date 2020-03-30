<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Quarantine Escape Sign Up</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyles.css">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<body>
  <div class="w3-card-4">
        <div>
          <div class="w3-container w3-2019-eden">
            <h2>Sign Up Form</h2>
          </div>
          <form action="createUser.do" class="needs-validation" novalidate method="POST">
          <input id="updateId" type="hidden" name="id" value="${user.id }">
          <div class="form-group">
              <label for="username">Username:</label>
              <input type="text" class="w3-input form-control" id="username" placeholder="Enter username"   name="username" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
              <label for="firstName">First Name:</label>
              <input type="text" class="w3-input form-control" id="firstName" placeholder="Enter First Name"   name="firstName" >
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
              <label for="lastName">Last Name:</label>
              <input type="text" class="w3-input form-control" id="lastName" placeholder="Enter Last Name"  name="lastName" >
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
              <div class="form-group">
              <label for="password">Password:</label>
              <input type="password" class="w3-input form-control" id="password" placeholder="Enter password" name="password" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
              <label for="email">Email:</label>
              <input type="email" class="w3-input form-control" id="email" placeholder="Enter Email"  name="email" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
              <label for="userImageUrl">User Image URL:</label>
              <input type="url" class="w3-input form-control" id="userImageUrl" placeholder="Enter Image URL"  name="userImageUrl" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="form-group">
              <label for="userDescription">User Description:</label>
              <input type="text" class="w3-input form-control" id="userDescription" placeholder="Enter User Description"  name="userDescription" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <button type="submit" class="btn btn-primary">Sign Up</button>
          </form>

        </div>
      </div>
</body>
</html>