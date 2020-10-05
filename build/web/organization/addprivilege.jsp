<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Organization DashBoard | Add Privilege</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <br><br><br>
       <div class="container">
       <div class="row">
	  
	
	   <div class="col-md-6 col-md-offset-3 ">
	   <br> <br> 
   <div class="alert alert-info" role="alert">
      <h4 class="alert-heading">Add Privilege :</h4><hr>                
      <form method="post"  action="addprivilege2.jsp">
       <label><b>Add Accessor </b></label><br>
       <input type="text" class="form-control" name="aname" placeholder="Accessor"  required  autocomplete="off"><br>
       <button type="button" class="btn btn-outline-info btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
          <button type="submit" name="btn" value="accessor" class="btn btn-outline-info btn-lg">ADD</button>
      </form>
      </div>
   </div>
       
       
        
           
           <div class="col-md-6 col-md-offset-3 ">
	   <br> <br> 
   <div class="alert alert-info" role="alert">
      <h4 class="alert-heading">Add Privilege :</h4><hr>                
      <form method="post"  action="addprivilege2.jsp">
       <label><b>Add Category </b></label><br>
       <input type="text" class="form-control" name="cname" placeholder="Category"  required  autocomplete="off"><br>
       <button type="button" class="btn btn-outline-info btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
               <button type="submit" name="btn" value="category" class="btn btn-outline-info btn-lg">ADD</button>
      </form>
      </div>
   </div>
		 				
						
   </div>  
	    
	
	   
       
       
       <div class="col-md-3 col-md-offset-3 ">
		</div>				
						
   </div><br><br><br><br><br><br>
     <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>