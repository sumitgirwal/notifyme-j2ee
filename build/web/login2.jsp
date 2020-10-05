<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NotifyMePro | LogIn</title>
   <link rel="stylesheet" href="assets/css/magic.css"> 
 <link rel="stylesheet" href="assets/css/style.css"> 
 <link rel="stylesheet" href="assets/css/bootstrap.min.css"> 
    </head>
    <body>
        <%@include file="includes/header.jsp"%>
       <div class="container">
           <div class="container">

  <div class="form">
     <h3 style="text-align: center;">User Login</h3>
        <div id="signup">   
          
          
          <form action="checkwho" method="post">
      
      <div class="tab-content">
          <div class="field-wrap">
            <label> User ID<span class="req">*</span></label>
            <input type="text" name="uid" required autocomplete="off"/>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <input type="password" name="password" required autocomplete="off"/>
       
          </div>
      
      
     <a  href="forgetpassword.jsp" >Forgot Password</a> &nbsp;| &nbsp; <a  href="signuppre.jsp">Sign In</a>
      
      </div><br>
          
           <button type="button" class="btn btn-outline-light btn-lg " onclick="window.location.href='index.jsp'">
             Back
          </button>
          <button type="submit" class="btn btn-outline-light btn-lg">
             LogIn
          </button>
     
 </form>
         </div>
        
      </div>
      
</div>
</div>
           
           
     

      <br>
    <%@include file="includes/footer.jsp"%>
  <script src='assets/js/jquery.js'></script>
<script  src="assets/js/index.js"></script>
  </body>
</html>

