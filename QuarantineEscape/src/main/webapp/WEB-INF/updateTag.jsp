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
<title>Quarantine Escape Update Tag</title>
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
            <h2>Update Tag</h2>
          </div>
          <form action="updateTag.do" method="POST">
            <div class="form-group">
              <label for="hostName">Tag Name:</label>
              <input type="text" class="w3-input form-control" id="tagName" placeholder="${tag.tagName}"   name="tagName" >
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
              
              		<input type = "hidden" name = "id" value = "${tag.id}"/>
		<input type="submit" value="Update Tag" class="text-center;btn btn-info" />
		</form>
		</div>
        </div>
      </div>
</body>
</html>