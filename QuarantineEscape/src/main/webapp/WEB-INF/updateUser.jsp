<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape - Update User</title>
</head>
<body>
<form action="updateUser.do" method="Post">
			<fieldset>
				<legend>Update User</legend>
				<div class="form-group">
					<label for="firstName">First Name: </label>
					<input type="text" value = "${user.firstName}" name="firstName" id="firstName" class="form-control" required />
				</div>
				<div class="form-group">
					<label for="lastName">Last Name: </label>
					<input type="text" value = "${user.lastName}"  name="lastName" id="lastName" class="form-control" required/>
				</div>
				<div class="form-group">
					 <label for="username">Username: </label>
					 <input type="text" value = "${user.username}"  name="username" id="username" class="form-control" required/>
				</div>
				<div class="form-group">
					<label for="password">Password: </label>
					<input type="text" value = "${user.password}"  name="password" id="password" class="form-control" required />
				</div>
				<div class="form-group">
					<label for="password">Role: </label>
					<input type="text" value = "${user.role}"  name="password" id="password" class="form-control" required />
				</div>
				<div class="form-group">
					<label for="enabled">Enabled: </label>
					<select name="enabled" selected = "${user.enabled}"  id="enabled" class="btn btn-secondary dropdown-toggle" required>
						<option value="True">True</option>
						<option value="False">False</option>
					</select>				
				</div>
				<input type = "hidden" name = "id" value = "${user.id}"/>
				<input type="submit" value="Update User" class="btn btn-primary"/>
			</fieldset>
		</form>
</body>
</html>