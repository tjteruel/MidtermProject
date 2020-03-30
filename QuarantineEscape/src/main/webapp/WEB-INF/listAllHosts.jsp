<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape - Hosts</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
<h2>List of Hosts in Database</h2>
  		<table class="table table-striped">
		<thead class="thead thead-dark">
			<tr>
				<th>Host ID</th>
				<th>Host Name</th>
				<th>Email</th>
				<th>Phone Number</th>
				<th>URL</th>
				<th>Logo</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="host" items="${hosts}">
				<tr>
					<td>${host.id}</td>
					<td>${host.hostName}</td>
					<td>${host.email}</td>
					<td>${host.phoneNumber}</td>
					<td>${host.url}</td>
					<td>${host.urlLogo}</td>
					<td>
						<form action ="updateHostPage.do" method = "POST">
						<input type="hidden" value="${host.id}" name = "host"/>
						<input type="submit" value="Update" class="btn btn-primary"/>
						</form>
					</td>
					<td>
						<form action ="deleteHost.do" method = "POST" class="form-group">
						<input type="hidden" value="${host.id}" name = "hostId"/>
						<input type="submit" value="Delete" class="btn btn-danger"/>
						</form>
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
		</table>

</body>
</html>