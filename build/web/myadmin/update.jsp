<%
   
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    com.bean.My m=new com.bean.My();
    m.setMyid(myid);
    java.sql.ResultSet rs=m.showAnyThing("notifymepro","myadmin","myid",myid);
    rs.next();
    
String fname=rs.getString("fname");
String lname=rs.getString("lname");
String email=rs.getString("email");
String city=rs.getString("city");
String cno=rs.getString("cno");
String vc=new String(""+session.getAttribute("vcode"));
myid=myid.toUpperCase();
%>

 <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

        <title>MyAdmin DashBoard | MyProfile Update</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">

	
    </head>

       <body>
     
         <%@include file="includes/dashboard.jsp"%>
       <br><br><br>
             <div class="container">
                      <div class="alert alert-light" role="alert">
                        <form action="update2.jsp" method="post">
                          <h4 class="alert-heading">Change  My Info. : </h4><hr>

     
    
    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>My ID</b></label>
      <input type="text" class="form-control" placeholder="<%=myid%>" autocomplete="off" readonly="">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Email Address</b></label>
      <input type="email" class="form-control" name="email" placeholder="<%=email%>" autocomplete="off">
    </div>

  
  
  </div>
  <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>First Name</b></label>
      <input type="text" class="form-control" name="fname" placeholder="<%=fname%>" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Last Name</b></label>
      <input type="text" class="form-control" name="lname" placeholder="<%=lname%>" autocomplete="off">
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
      <input type="text"  class="form-control" required name="vcode" placeholder="Verify Code">
    </div>
   
     
</div>

  
   


  
        <br> <button type="button" class="btn btn-outline-success btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
           <button type="button" class="btn btn-outline-success btn-lg" href="delete.jsp" onclick=" return confirm('Are you sure to delete account ?')">
             DELETE
          </button>&nbsp;
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
	
	
	
  

