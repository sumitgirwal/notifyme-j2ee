<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NotifyMe | SignUp</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <div class="container">
            <h3 style="padding:26px;text-align:center; color:white;"><u>SignUp</u></h3> 
 <div class="card">
  <div class="card-header">
  User
  </div>
  <div class="card-body">
    <h5 class="card-title">User Info.</h5>
    <p class="card-text">Organization has the full authority over User. He can view all the regis-tered users and have the power to delete them. He can edit the User , and update them. He can view all the all details also,
From an end-user perspective, the project consists of two functional elements: an enhanced searchable database for the search notices, managing members, send Notices and receiving by its user .</p>
    <a href="signup.jsp?btn=user" class="btn btn-primary">User SignUp</a>
  </div>
</div>
<br><br> 
<div class="card">
  <div class="card-header">
  Organization
  </div>
  <div class="card-body">
    <h5 class="card-title">Organization Info.</h5>
    <p class="card-text">Administrator has the full authority over the website. He can view all the regis-tered users and have the power to delete them. He can edit the Organization, and update them. He can view all the all details of User,
From an end-user or Organization perspective, the project consists of two functional elements: an enhanced searchable database for the search notices, managing members, send Notices and receiving by its Organization or User</p>
    <a href="signup.jsp?btn=user2" class="btn btn-primary"> Organization SignUp</a>
  </div>
</div>
 
            
            
            
              
       </div>
     <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>
