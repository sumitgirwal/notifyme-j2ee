<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>NotifyMe | Forgot Password</title>
 <link rel="stylesheet" href="assets/css/magic.css"> 
 <link rel="stylesheet" href="assets/css/style.css"> 
 <link rel="stylesheet" href="assets/css/bootstrap.min.css">
 <script  src="assets/js/myjs2.js"></script>
    </head>
    <body>
   

    <%@include file="includes/header.jsp"%>
 
  <div class="container">

  <div class="form">
      <div class="pr"><h3 style="text-align: center;">Forgot Password</h3></div><br> 
        <div id="signup">   
          
          
          <form action="forgotpassword2.jsp" method="post">
      
      <div class="tab-content">
          <div class="field-wrap">
            <label> User ID
        <span class="req">*</span>
            </label>
            <input type="text" name="uid" id="uid"  required autocomplete="off"/>
          </div>
      
           <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" id="email"  autocomplete="off" required />
            <br>
            <button type="button" class="btn btn-outline-light btn-lg"  onclick="sendMail()">
                Send Verify Code
              </button>
          </div> 

          <div class="field-wrap">
            <label> Verify Code
        <span class="req">*</span>
            </label>
            <input type="text" name="vcode" required autocomplete="off"/>
          </div>
         

          <br>
      
      </div>
      <a class="btn btn-outline-light btn-lg" href="index.jsp" role="button" >Back</a>
          
          
          <button type="submit" class="btn btn-outline-light btn-lg">
             ReDirect
          </button>
     
 </form>
         </div>
        
      </div>
      
</div>
</div>
           
       </div>

      
    <%@include file="includes/footer.jsp"%>
    <script src='assets/js/jquery.js'></script>
<script  src="assets/js/index.js"></script>
  </body>
</html>
