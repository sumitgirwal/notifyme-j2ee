<%
      String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
     String oid=request.getParameter("oid");
     com.bean.My o=new com.bean.My();
     o.setOid(oid);
     java.sql.ResultSet rs=o.showOneOrg("notifymepro");
     int n=0;
     rs.next();
    session.setAttribute("oid",oid);
   

%>
 <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>MyAdmin DashBoard | Active Organization</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">

	
    </head>

       <body>
     
         <%@include file="includes/dashboard.jsp"%> 
      <div class="hey">Hey,<span style="font-family:Calibri;padding-left:5px; font-size:25px;color:#fcfcfc">
          <%=rs.getString("oname")%></span>
         </div>
        
       <div class="container">
                            <div class="alert alert-light" role="alert">
                        <form action="activeorg2.jsp" method="get">
                          <h4 class="alert-heading">Active Organization Info : </h4><hr style="background-color : red;">
   <div class="form-row">

    <div class="form-group col-md-6">
      <label>Organization ID :</label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("oid")%>"  readonly="" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label>Status :</label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("status")%>"  readonly="" autocomplete="off">
    </div>
   </div>
         
      
 
      
  <div class="form-row">

    <div class="form-group col-md-12">
      <label>Organization Name</label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("oname")%>"  readonly="" name="fname" autocomplete="off" >
    </div>

     
  
  </div>

  <div class="form-row">

     
   
     <div class="form-group col-md-12">
      <label>Email Address</label>
      <input type="email" class="form-control"  placeholder="<%=rs.getString("email")%>" readonly="" name="email" autocomplete="off">
    </div>

  
  
  </div>

   

    <div class="form-row">

    <div class="form-group col-md-6">
      <label>City</label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("city")%>" readonly="" name="city" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label>Contact NO.</label>
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
	
	
	
  

