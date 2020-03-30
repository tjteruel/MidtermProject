<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape - Tags</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<body>
  		<h2>List of Tags in Database</h2>
  		<table class="table table-striped">
		<thead class="thead thead-dark">
			<tr>
				<th>Tag ID</th>
				<th>Tag Name</th>

			</tr>
		</thead>
		<tbody>
			<c:forEach var="tag" items="${tags}">
				<tr>
					<td>${tag.id}</td>
					<td>${tag.tagName}</td>

					<td>
						<form action ="updateTagPage.do" method = "POST">
						<input type="hidden" value="${tag.id}" name = "tag"/>
						<input type="submit" value="Update" class="btn btn-primary"/>
						</form>
					</td>
					<td>
						<form action ="deleteTag.do" method = "POST" class="form-group">
						<input type="hidden" value="${tag.id}" name = "tagId"/>
						<input type="submit" value="Delete" class="btn btn-danger"/>
						</form>
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
		</table>
		
</body>
</html>