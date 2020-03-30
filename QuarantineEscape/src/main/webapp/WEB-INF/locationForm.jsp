<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quarantine Escape Team</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="css/locationForm.css">
</head>
<body>
<header class="bg-primary text-center py-5 mb-4">
  <div class="container">
    <h1 class="font-weight-light text-white">Add the Event Location</h1>
    
  </div>
</header><!--Section: Contact v.1-->
<section class="section pb-5">

  <!--Section heading-->
  
 

  <div class="row">
<div style="width: 55%">
     <img src="https://d1xcdyhu7q1ws8.cloudfront.net/wp-content/uploads/sites/5/2018/02/27170007/world-map.gif" style="float:right;" />
  </div>
    <!--Grid column-->
    <div class="col-lg-5 mb-4">

      <!--Form with header-->
      <div class="card">

        <div class="card-body">
      

          <!--Body-->
          <form action="createLocation.do" method="POST">
          <div class="md-form">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="text" id="country" class="form-control" placeholder="Enter the Country" name ="country">
            <label for="country">Country</label>
          </div>

          <div class="md-form">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="text" id="state" class="form-control" placeholder="Enter the State" name ="state">
            <label for="state">State</label>
          </div>

          <div class="md-form">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="text" id="state" class="form-control" placeholder="Enter the City" name ="city">
            <label for="city">City</label>
          </div>
          <div class="md-form">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="text" id="Address" class="form-control" placeholder="Enter the Address" name ="address">
            <label for="state">State</label>
          </div>
          
         <div class="md-form">
            <i class="fas fa-envelope prefix grey-text"></i>
            <input type="text" id="postalCode" class="form-control" placeholder="Enter the Postal Code" name ="postalCode">
            <label for="postalCode">Postal Code</label>
          </div>

          <div class="text-center mt-4">
          
            <button type="input" name="submit" value="newAccount" class="btn btn-success btn-icon"><i class="fa fa-check"></i> Add Location </button>
          </div>

</form>
        </div>
      </div>
      <!--Form with header-->

    </div>
    <!--Grid column-->
   <!--  <div>
        <img src="https://d1xcdyhu7q1ws8.cloudfront.net/wp-content/uploads/sites/5/2018/02/27170007/world-map.gif" style="float:right;" />
        <div style="clear:right;">
            text here
        </div>

</div>
<div style="width: 100%">
    <img style="float:right; ">
  <img src="https://d1xcdyhu7q1ws8.cloudfront.net/wp-content/uploads/sites/5/2018/02/27170007/world-map.gif"></img>
  </div>
   
</div> 

     
 
  <!--   </div>< -->
    <!--Grid column-->

 </div> 

</section>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
<!--Section: Contact v.1-->