<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NotifyMe</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <hr style="color:white;background-color: white;">
       <div class="container">
        <h3 style="padding:33px;text-align:center; color:white;"><u>WelCome</u></h3>   
        
        
        
        
         <div class="b1">
               <button type="button" class="btn btn-outline-light btn-lg" onclick="window.location.href='signuppre.jsp'">
                                 SignUp</button>
             </div>
         
         <div class="context">
           <div class="b2">
              <button type="button" class="btn btn-outline-light btn-lg" onclick="window.location.href='login.jsp'">
                LogIn
              </button>
            </div>&nbsp;
            <div class="alert alert-info" style="background-color:#e3f2fd;font-size: 15px;" role="alert">
                <h4 class="alert-heading">Hey,</h4>
                  <p style="text-align: center;"> <b>"No one is perfect in this world and nothing is eternally best. But we can try to be better."</b></p>
                <hr>
               <p class="mb-0">  Hi, Notify-Me , It is a online notices board based web application which will auto-mate a lot of activities in a school or college or office etc, depending upon the usage that is expected by different organizations. more Coding Click to visit :<a href="http://procodersp.blogspot.com" style="text-decoration: none; "> ProCoder</a></p> 
                   </div>
         </div> 
       </div>
  <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>
