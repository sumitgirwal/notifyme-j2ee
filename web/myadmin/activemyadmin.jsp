<%
    String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    String uid=request.getParameter("uid");
    session.setAttribute("uid",uid);
    com.bean.My m=new com.bean.My();
    m.setUid(uid);
    java.sql.ResultSet rs=m.showOneUser("notifymepro");
    rs.next();    


%>
 <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>MyAdmin DashBoard | Active MyAdmin</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">

	
    </head>

       <body>
     
         <%@include file="includes/dashboard.jsp"%> 
     <br><br> 
       <div class="container">
                            <div class="alert alert-light" role="alert">
                        <form action="activemyadmin2.jsp" method="get">
                          <h4 class="alert-heading">Active My Admin Info. : </h4><hr style="background-color : red;">
   <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>User ID </b></label>
      <input type="text" class="form-control"  placeholder="<%=(rs.getString("uid")).toUpperCase()%>"  readonly="" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Status </b></label>
      <input type="text" class="form-control"  placeholder="<%=(rs.getString("status")).toUpperCase()%>"  readonly="" autocomplete="off">
    </div>
   </div>
         
       <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>First Name</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("fname")%>"  readonly="" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Last Name </b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("lname")%>"  readonly="" autocomplete="off">
    </div>
   </div>
         
      
 
      
  
  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Password</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("password")%>" readonly="" name="password" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Email Address</b></label>
      <input type="email" class="form-control"  placeholder="<%=rs.getString("email")%>" readonly="" name="email" autocomplete="off">
    </div>

  
  
  </div>

   

    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>City</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("city")%>" readonly="" name="city" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
         <label><b>Contact NO.</b></label>
      <input type="text" class="form-control"  maxlength=10 placeholder="<%=rs.getString("cno")%>" readonly="" name="phoneno" autocomplete="off">
    </div>

  
  
  </div>
    
    
    
  
  
        <br>
       <a class="btn btn-outline-danger btn-lg" href="showorg.jsp" role="button"   >BACK</a> 
    &nbsp;<button type="submit" class="btn btn-outline-danger btn-lg" >
             ACTIVE
          </button>


</form>
                     </div>  
       </div>
					  
        <br><br> <br><br><br>
         <%@include file="includes/footer.jsp"%>

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>	
	
	
	
  

