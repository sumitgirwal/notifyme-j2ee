<%
    String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    int n=0;
    java.sql.ResultSet rs=new com.bean.My().showAllOrganization("notifymepro");
    com.bean.Org o=new com.bean.Org();
%> 
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>MyAdmin DashBoard | Show Organization </title>
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
            <div class="col-md-12"><h4 class="header-line">Organization Info. :</h4><hr> </div>
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
                                            <th>OID</th>
                                            <th>Organization&nbsp;name</th>
                                            <th>Email Address</th>
                                            <th>City</th>
                                            <th>Contact&nbsp;no.</th>
                                            <th>Status</th>
					    <th>Problem</th>
				            <th>Reg.&nbsp;Date&Time</th>
                                            <th>Notices</th>
                                            <th>User</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>
				 <tbody>
<%
                
             
            while(rs.next()){
				String status=rs.getString("status");
				  
				n++;  
          %>
		       <tr class="odd gradeX">
			        <td class="center"><b><%=n%></b></td>
			        <td class="center"><%=rs.getString("oid")%></td>
				<td class="center"><%=rs.getString("oname")%></td>
				 
			 
				<td class="center"><%=rs.getString("email")%></td>
				<td class="center"><%=rs.getString("city")%></td>
				<td class="center"><%=rs.getString("cno")%></td>
			            
                                    
                                <%if(status.equalsIgnoreCase("active")){%>
                                <td class="center" style="color: green;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("pending")){%><td class="center" style="color: #08C;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("deactive")){%><td class="center" style="color: red;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("disabled")){%><td class="center" style="color: red;"><b><%=status.toUpperCase()%></b></td><%%>
                                <%}else if(status.equalsIgnoreCase("access")){%><td class="center" style="color: #002752;"><b><%=status.toUpperCase()%></b></td> 
                                 <%}else if(status.equalsIgnoreCase("admin")){%><td class="center" style="color: #002752;"><b><%=status.toUpperCase()%></td><%}%>
                                    
				<td class="center"><%=rs.getString("problem")%></td>
                                <td class="center"><%=rs.getString("regdate")%></td>
                                <%if(status.equalsIgnoreCase("pending")){%>
                                <td class="center"><a class="btn btn-info disabled" href="shownt.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >Notice</a></td>
			        <td class="center"><a class="btn btn-info disabled" href="showuser.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >User</a></td>
			        <td class="center"><a class="btn btn-danger " href="activeorg.jsp?oid=<%=rs.getString("oid")%>" role="button" >Active</a></td>
      
                                <%}else{
                                if(status.equalsIgnoreCase("active") || status.equalsIgnoreCase("deactive")){
                                
                                %>
                                <%if(o.count(rs.getString("oid"),"notices")>0){%>
                                <td class="center"><a class="btn btn-info" href="shownt.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >Notice</a></td>
			        <%}else{%>
                                <td class="center"><a class="btn btn-info disabled" href="shownt.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >Notice</a></td>
			        <%}%>
                                
                                <%if(o.count(rs.getString("oid"),"user")>0){%>
                                <td class="center"><a class="btn btn-info" href="showuser.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >User</a></td>
			      <%}else{%>
                                <td class="center"><a class="btn btn-info disabled" href="showuser.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >User</a></td>
			      <%}%>
                                <td class="center"><a class="btn btn-info" href="editorg.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >Edit</a></td>
			        
                       </tr><% }else   if(status.equalsIgnoreCase("disabled")){%>
                       
           <td class="center"><a class="btn btn-info disabled" href="shownt.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >Notice</a></td>
	 <td class="center"><a class="btn btn-info disabled" href="showuser.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >User</a></td>
	  <td class="center"><a class="btn btn-info" href="vieworg.jsp?oid=<%=rs.getString("oid")%>&oname=<%=rs.getString("oname")%>" role="button" >View</a></td>
      


<%}}



}%>  
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
	
