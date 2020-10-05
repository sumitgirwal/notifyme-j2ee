  <%
   
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
   com.bean.My o=new com.bean.My();
   String oid=request.getParameter("oid");
   String uid=request.getParameter("uid");
   String oname="";
   
   o.setUid(uid);
   session.setAttribute("uid",uid);
   session.setAttribute("oid",oid);
   
   java.sql.ResultSet rs1=o.showAnyThing("notifymepro","organization","oid",oid);
   if(rs1.next())
   {oname=rs1.getString("oname");}
   java.sql.ResultSet rs=o.showOneUser(oid); 
   int n;
   n=0;
   rs.next();  
   
   session.setAttribute("oname",oname);
    java.sql.ResultSet rsa=o.showAccessor(oid); 
    java.sql.ResultSet rsc=o.showCategory(oid); 
String cname=rs.getString("cname");
String aname=rs.getString("aname");

  %>

 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>MyAdmin DashBoard | Edit User</title>
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
                      <div class="alert alert-info" role="alert">
                        <form action="edituser2.jsp" method="get">
                          <h4 class="alert-heading">Edit User Info. : </h4><hr>
   <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Organization ID </b></label>
      <input type="text" class="form-control"  placeholder="<%=oid.toUpperCase()%>"  readonly="" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Organization  Name </b></label>
      <input type="text" class="form-control"  maxlength=10 placeholder="<%=oname%>" readonly="" autocomplete="off">
    </div>

  
  
  </div>
 
      
  

 <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>User ID</b></label>
      <input type="text" class="form-control"  placeholder="<%=uid.toUpperCase()%>"   autocomplete="off" readonly="" >
    </div>
   
    
  
  
  </div> 
      
        <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>First Name</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("fname")%>" name="fname" autocomplete="off" >
    </div>

     <div class="form-group col-md-6">
      <label><b>Last Name</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("lname")%>" name="lname" autocomplete="off">
    </div>

  
  
  </div>

  

 <div class="form-row">

    <div class="form-group col-md-6">
    <div class="form-group">
    <label for="exampleFormControlSelect1"><b>Accessor</b></label>
    <select class="form-control" name="aname">
        <option value="<%=aname%>"><%=aname%></option>
        <%while(rsa.next()){
            if(!aname.equalsIgnoreCase(rsa.getString("aname"))){
        %>
      <option value="<%=rsa.getString("aname")%>"><%=rsa.getString("aname")%></option>
    <%}}%>
    </select>
  </div> </div>
   
     <div class="form-group col-md-6">
      <div class="form-group">
    <label for="exampleFormControlSelect1"><b>Category</b></label>
    <select class="form-control" name="cname">
         <option value="<%=cname%>"><%=cname%></option>
  <%while(rsc.next()){ 
  if(!cname.equalsIgnoreCase(rsc.getString("cname"))){
        %>
      <option value="<%=rsc.getString("cname")%>"><%=rsc.getString("cname")%></option>
    <%}}%>
    </select>
  </div>
    </div>

  
  
  </div> 
      
     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      

  <div class="form-row">
 <div class="form-group col-md-6">
      <div class="form-group">
    <label for="exampleFormControlSelect1"><b>Status</b></label>
    
      <%

                String status=rs.getString("status");  
                String value1=null;
                String value2=null;
                String value3=null;
                String value4=null;
                String value5=null;
                
           if(status.equalsIgnoreCase("active") || status.equalsIgnoreCase("admin"))
           {
            value1="ACTIVE"; 
            value2="DEACTIVE";
            value3="PENDING";
            value4="ACCESS";
            value5="DISABLED";

          }else if(status.equalsIgnoreCase("deactive"))
           {
            value5="ACTIVE"; 
            value1="DEACTIVE";
            value2="PENDING";
            value3="ACCESS";
            value4="DISABLED";
               
          }else if(status.equalsIgnoreCase("pending"))
           {
            value4="ACTIVE"; 
            value5="DEACTIVE";
            value1="PENDING";
            value2="ACCESS";
            value3="DISABLED";
               
          }else if(status.equalsIgnoreCase("access"))
           {
            value3="ACTIVE"; 
            value4="DEACTIVE";
            value5="PENDING";
            value1="ACCESS";
            value2="DISABLED";
          }else if(status.equalsIgnoreCase("disabled"))
           {
            value2="ACTIVE"; 
            value3="DEACTIVE";
            value4="PENDING";
            value5="ACCESS";
            value1="DISABLED";
          }
          

            
       
%>
    <select class="form-control" name="status">

      <option value="<%=value1%>"><%=value1%></option>
      <option value="<%=value2%>"><%=value2%></option>
      <option value="<%=value3%>"><%=value3%></option>
      <option value="<%=value4%>"><%=value4%></option>
      <option value="<%=value5%>"><%=value5%></option>

    </select>
  </div>    
    </div>

   
     <div class="form-group col-md-6">
      <label><b>Email Address</b></label>
      <input type="email" class="form-control"  placeholder="<%=rs.getString("email")%>" name="email" autocomplete="off">
    </div>

  
  
  </div>

   

    <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>City</b></label>
      <input type="text" class="form-control"  placeholder="<%=rs.getString("city")%>" name="city" autocomplete="off">
    </div>
   
     <div class="form-group col-md-6">
      <label><b>Contact NO.</b></label>
      <input type="text" class="form-control"  maxlength=10 placeholder="<%=rs.getString("cno")%>" name="phoneno" autocomplete="off">
    </div>

  
  
  </div>
    
 <div class="form-row">

     
    <div class="form-group col-md-12">
      <label><b>Problem</b></label>
  <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"  name="problem" ><%=rs.getString("problem")%></textarea>        
    </div>
   
   
  
  
  </div>


  
        <br>
       <a class="btn btn-outline-info btn-lg" href="showuser.jsp?uid=<%=uid%>&oid=<%=oid%>&oname=<%=oname%>" role="button"   >BACK</a> 
    &nbsp;
          <a class="btn btn-outline-info btn-lg" href="deleteuser.jsp?uid=<%=uid%>" role="button"  onclick="return confirm('Are you sure you want to delete?');" >DELETE</a> 
    &nbsp;<button type="submit" class="btn btn-outline-info btn-lg" >
             UPDATE
          </button>


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
	
	
	
	
 

