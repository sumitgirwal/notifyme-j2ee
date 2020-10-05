
  <%
      
    String oid=(String)session.getAttribute("oid");
 
   com.bean.Org o=new com.bean.Org();
   o.setOid(oid);
   java.sql.ResultSet rs=o.showOneData("notifymepro");
   rs.next();
String oname=rs.getString("oname");
String email=rs.getString("email");
String city=rs.getString("city");
String cno=rs.getString("cno");
String vc=new String(session.getAttribute("vcode")+"");

%>
 <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>Organization DashBoard | Update MyProfile</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">

	
    </head>

       <body>
     
         <%@include file="includes/dashboard.jsp"%>
        <br><br><br>
             <div class="container">
                      <div class="alert alert-light" role="alert">
                        <form action="update2.jsp" method="post">
                          <h4 class="alert-heading">Change Organization Info. : </h4><hr>

     
    
    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Organization ID</b></label>
      <input type="text" class="form-control" placeholder="<%=oid.toUpperCase()%>" autocomplete="off" readonly="">
    </div>
   
     
  </div>
   


  <div class="form-row">

    
   
     <div class="form-group col-md-6">
      <label><b>Organization Name</b></label>
      <input type="text" class="form-control" name="oname" placeholder="<%=oname%>" autocomplete="off">
    </div>

  <div class="form-group col-md-6">
      <label><b>Email Address</b></label>
      <input type="email" class="form-control" name="email" placeholder="<%=email%>" autocomplete="off">
    </div>
  
  </div>
  
  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>City</b></label>
      <input type="text" class="form-control" name="city" placeholder="<%=city%>" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Contact No.</b></label>
      <input type="text" class="form-control" maxlength="10" name="cno" placeholder="<%=cno%>" autocomplete="off">
    </div>

  
  
  </div>
    
    
  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Current Password</b></label>
      <input type="password"  class="form-control"   name="password" placeholder="Current Password">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Confirm Password</b></label>
      <input type="password"  class="form-control"    name="cpassword" placeholder="Confirm Password">
    </div>

  
  
  </div>

    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>New Password</b></label>
      <input type="password"  class="form-control" name="npassword" placeholder="New Password">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Re-Enter New Password</b></label>
      <input type="password"   class="form-control"  name="rpassword" placeholder="Re-Enter New Password" >
    </div>
</div>

  <div class="form-row">
  
      
    <div class="form-group col-md-6">
      <label><b>Verify Code</b></label>
      <input type="text"  class="form-control" required name="vcode" placeholder="Verify Code" autocomplete="off">
    </div>
   
     
</div>

  
   


  
        <br> <button type="button" class="btn btn-outline-success btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
           <a class="btn btn-outline-success btn-lg" href="delete.jsp" role="button"  onclick="return confirm('Do You Went To Delete Account ?');" >DELETE</a> &nbsp;
          <button type="submit" class="btn btn-outline-success btn-lg">
             UPDATE
          </button>


</form>
                     </div>
             </div>
             <br>
             <br>
     
        <%@include file="includes/footer.jsp"%>

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>	
	
	
	
  

