<%
      
     String uid=request.getParameter("uid");
     com.bean.Org o=new com.bean.Org();
     o.setUid(uid);
     java.sql.ResultSet rs=o.showOneUser("notifymepro");
     int n=0;
     rs.next();
     String oid=(String)session.getAttribute("oid");
    java.sql.ResultSet rsa=o.showAccessor(oid);
    java.sql.ResultSet rsc=o.showCategory(oid);
    String aname="Please Add Accessor";
    String cname="Please Add Category";
    session.setAttribute("oid",oid);
    session.setAttribute("uid",uid);
    

%>
 <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>Admin DashBoard | Active User</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">

	
    </head>

       <body>
     
         <%@include file="includes/dashboard.jsp"%> 
      <div class="hey">Hey,<span style="font-family:Calibri;padding-left:5px; font-size:25px;color:#fcfcfc">
          <%=rs.getString("fname")%></span>
         </div>
        
       <div class="container">
                            <div class="alert alert-light" role="alert">
                        <form action="activeuser2.jsp" method="get">
                          <h4 class="alert-heading">Active User Info. : </h4><hr style="background-color : red;">
   <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>User ID</b> </label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("uid")%>"  readonly="" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Status </b> </label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("status")%>"  readonly="" autocomplete="off">
    </div>
   </div>
         
      
 
      
  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>First Name</b> </label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("fname")%>"  readonly="" name="fname" autocomplete="off" >
    </div>

     <div class="form-group col-md-6">
      <label><b>Last Name</b> </label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("lname")%>" readonly="" name="lname" autocomplete="off">
    </div>

  
  
  </div>

  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Password</b> </label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("password")%>" readonly="" name="password" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Email Address</b> </label>
      <input type="email" class="form-control"  placeholder="<%=rs.getString("email")%>" readonly="" name="email" autocomplete="off">
    </div>

  
  
  </div>

   

    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>City</b> </label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("city")%>" readonly="" name="city" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Contact NO.</b> </label>
      <input type="text" class="form-control"  maxlength=10 placeholder="<%=rs.getString("cno")%>" readonly="" name="phoneno" autocomplete="off">
    </div>

  
  
  </div>
    
  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Accessor</b> </label>
         <select class="form-control" name="aname">
     <%while(rsa.next()){
         
           aname=rsa.getString("aname");
         
     %>
      <option value="<%=aname.toUpperCase()%>"><%=aname.toUpperCase()%></option>
     <%}%>
    </select>
    </div>
   
      <div class="form-group col-md-6">
      <label><b>Category</b> </label>
      <select class="form-control" name="cname">
     <%while(rsc.next()){
         
           cname=rsc.getString("cname");
           
         
     %>
      <option value="<%=cname.toUpperCase()%>"><%=cname.toUpperCase()%></option>
     <%}%>
    </select>
    </div>
  
  
  </div>
    
  
  
        <br>
       <a class="btn btn-outline-danger btn-lg" href="showuser.jsp" role="button"   >BACK</a> 
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
	
	
	
  

