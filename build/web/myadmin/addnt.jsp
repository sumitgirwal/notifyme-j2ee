 <% 
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    String oid=request.getParameter("oid");
   com.bean.Org o=new com.bean.Org();
   o.setOid(oid);
   java.sql.ResultSet rs=o.showOneData("notifymepro");
   rs.next();
   String oname=rs.getString("oname");
   java.sql.ResultSet rsa=o.showAccessor(oid);
    java.sql.ResultSet rsc=o.showCategory(oid);
   int i=0;
   int j=0;


 %>
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>MyAdmin DashBoard | Edit Notice</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
        
           <div class="container"><br>
          <div class="alert alert-success" role="alert">
          <h4 class="alert-heading">Add Notices :</h4><hr>

    <div class="form-group col-md-6">
      <label><b>Organization ID :</label>
      <label><%=oid%></b></label>
    </div>
    <form method="get"  action="addnt2.jsp">
       <label>Title :</label><br>
       <input type="text" class="form-control" name="title" placeholder="Title"  required  autocomplete="off"><br>
       
        
   <div class="form-group form-check">
  <label>Accessor :</label>&nbsp; &nbsp;
              <%while(rsa.next()){
                %>     
              &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=rsa.getString("aname")%>" >
                  <label class="form-check-label" for="exampleCheck1" ><%=rsa.getString("aname")%></label> &nbsp; &nbsp;
           <%}%>
     </div>
          
   <div class="form-group form-check">
        <label>Category :</label>&nbsp; &nbsp;
              <%  
                  while(rsc.next()){%>
               &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=rsc.getString("cname")%>" >
                  <label class="form-check-label" for="exampleCheck1" ><%=rsc.getString("cname")%></label> &nbsp; &nbsp;
              <%}%>
     </div>
             
                   <label>Data And Time :</label><br>
       <input type="text" class="form-control" name="dt" placeholder="Data And Time"  required  autocomplete="off"><br>
       
          
               
               
    
       <label>Text :</label><br>
       <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"  name="text" placeholder="Text" ></textarea>    

   <br><br>
 <button type="button" class="btn btn-outline-success btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
         &nbsp;<button type="submit" class="btn btn-outline-success btn-lg" >
             ADD
          </button>
         
 
 </form>
 
         
      
    </div>
    
     


          </div></div>
     <%@include  file="includes/footer.jsp" %>
	  <br>

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>
	
	
	
	
 

