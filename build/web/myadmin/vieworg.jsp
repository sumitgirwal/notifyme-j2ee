  <%
   
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
   com.bean.My o=new com.bean.My();
   String oid=request.getParameter("oid");
   o.setOid(oid);
   session.setAttribute("oid",oid);
   java.sql.ResultSet rs=o.showOneOrg("notifymepro"); 
   int n;
   n=0;
   rs.next();    
   session.setAttribute("oname",rs.getString("oname"));

  %>

 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>MyAdmin DashBoard | Edit Organization</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
          <div class="container">
          <div class="container">
              <br><br><br>
                      <div class="alert alert-light" role="alert">
                        <form action="editorg2.jsp" method="post">
                          <h4 class="alert-heading">Edit Organization Info. : </h4><hr>
           
 <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Organization ID</b></label>
      <input type="text" class="form-control"  placeholder="<%=oid.toUpperCase()%>"  readonly>
    </div>
      <div class="form-group col-md-6">
      <label><b>Status</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("status")%>"  readonly>
    </div>
    
  </div> 
      
  
 
      
    

  <div class="form-row">

    <div class="form-group col-md-6">
    <label><b>Organization Name</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("oname")%>"  readonly>
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Email Address</b></label>
      <input type="email" class="form-control"  placeholder="<%=rs.getString("email")%>" name="email" autocomplete="off" readonly>
    </div>

  
  
  </div>

   

    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>City</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("city")%>" name="city" autocomplete="off" readonly>
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Contact NO.</b></label>
      <input type="text" class="form-control"  maxlength=10 placeholder="<%=rs.getString("cno")%>" name="phoneno" autocomplete="off" readonly>
    </div>

  
  
  </div>
    
 <div class="form-row">

     
    <div class="form-group col-md-12">
      <label><b>Problem</b></label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"  name="problem" readonly><%=rs.getString("problem")%></textarea>        
    </div>
   
   
  
  
  </div>


  
        <br>
       <a class="btn btn-outline-info btn-lg" href="showorg.jsp" role="button"   >BACK</a> 
    &nbsp;
        


</form>
                     </div>
             </div>    
           </div>

           <br><br> <br><br><br>
       
       <%@include  file="includes/footer.jsp" %>
	 

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>
	
	
	
	
 

