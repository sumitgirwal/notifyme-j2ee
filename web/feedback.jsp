 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>NotifyMe | Feedback</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/fontawesome.css" rel= "stylesheet">
        <link href="assets/css/magic.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
        <br>
   
  <div class="container">

  <div class="form">
     <h4 style="text-align: center; color:#cfcfcf;font-family:verdana;   ">Feedback </h4>
        <div id="signup">   
          
          
          <form action="feedback2.jsp" method="post">
      
      <div class="tab-content">
          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" required autocomplete="off"/>
       
          </div>

         
           <div class="field-wrap">
               <textarea type="text" name="feedback" placeholder="Leave your message...," required autocomplete="off"></textarea>	
          </div>

          <br>
      
      </div>
      <a class="btn btn-outline-light btn-lg" href="index.jsp" role="button" >Back</a>
          
          
          <button type="submit" class="btn btn-outline-light btn-lg">
             Send
          </button>
     
 </form>
         </div>
        
      </div>
      
</div>
</div>
            <br> 
       
       <%@include  file="includes/footer.jsp" %>
	   

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/index.js"></script>
    
   
  </body>
</html>
	
	
	
	
 

