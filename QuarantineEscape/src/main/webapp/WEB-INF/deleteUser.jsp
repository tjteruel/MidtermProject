<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


				<button type="button" class="btn btn-info btn-sm" >
		<form action="deleteUser.do" method="POST" class="form-group">
			<input type="hidden" value="${user.id}" name="food" /> <input
				type="submit" value="Delete" class="btn btn-info" />
		</form>
		</button>

</body>
</html>