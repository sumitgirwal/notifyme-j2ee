
  <%
      
   String oid=(String)session.getAttribute("oid");
   com.bean.Org o=new com.bean.Org();
   o.setOid(oid);
   java.sql.ResultSet rs=o.showAllUserOrg("notifymepro"); 
   int n;
   n=0;


%> 
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>Organization DashBoard | Show User </title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
       
       <br><br><br><br><br> 
       <div class="container">
              
          
            <div class="content-wrapper">
			
			  <div class="container">
			     <div class="alert alert-info" role="alert">
			       <div class="row pad-botm">
            <div class="col-md-12"><h4 class="header-line">User Info. :</h4><hr> </div>
                     </div>
	
         
          <div class="row">
		  
           <div class="col-md-12">
		      <div class="panel panel-default">
			  
			   <div class="panel-body">
			    <div class="table-responsive">
				  <table class="table table-striped table-bordered table-hover" id="dataTables-example">
				              <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>UID</th>
                                            <th>Name</th>
                                             
                                            <th>Email ID</th>
                                            <th>Status</th>
                                            <th>City</th>
                                            <th>Contact&nbsp;no.</th>
                                            <th>Reg.Date&Time</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
				 <tbody>
<%
                
             
            while(rs.next()){
              
			String status=rs.getString("status");	
				 if(!status.equalsIgnoreCase("disabled"))
                                 {
				n++;  
          %>
		       <tr class="odd gradeX">
			        <td class="center"><b><%=n%></b></td>
			        <td class="center"><%=rs.getString("uid")%></td>
				<td class="center"><%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%></td>
			        <td class="center"><%=rs.getString("email")%></td>
                                 <%if(status.equalsIgnoreCase("active")){%>
                                <td class="center" style="color: green;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("pending")){%><td class="center" style="color:#17a2b8 ;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("deactive")){%><td class="center" style="color: red;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("access")){%><td class="center" style="color:yellowgreen;"><b><%=status.toUpperCase()%></b></td><%}%>
                                
				<td class="center"><%=rs.getString("city")%></td>
				<td class="center"><%=rs.getString("cno")%></td>
			       
				
                                <td class="center"><%=rs.getString("regdate")%></td>
                                  
  <td class="center">
      <% 
            
    if(status.equalsIgnoreCase("pending")){ %>
     <a class="btn btn-danger" href="activeuser.jsp?uid=<%=rs.getString("uid")%>" role="button" >Active</a>
     <% }else{ %>
       <a class="btn btn-info" href="edituser.jsp?uid=<%=rs.getString("uid")%>&oid=<%=rs.getString("oid")%>" role="button" >&nbsp;Edit&nbsp;&nbsp;</a>
   <%}%>
     
  </td>
			</tr><% } }%>  
		    </tbody>
		   </table>
		</div>
		   </div>
		 </div>
		 </div>
             </div>
          </div>
             </div>  </div>      


      
          

      </div>

           <br><br> <br><br><br>
       
       <%@include  file="includes/footer.jsp" %>
	  
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/dataTables/jquery.dataTables.js"></script>
    <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
     <script src="assets/js/custom.js"></script>
   
  </body>
</html>
	
