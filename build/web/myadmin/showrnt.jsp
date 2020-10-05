
 <%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
com.bean.My m=new com.bean.My();
java.sql.ResultSet rso=m.showAllOrganization("notifymepro");
int n=0;
com.bean.Org o=new com.bean.Org();
java.sql.ResultSet rs;

 %>                                                      
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>MyAdmin DashBoard | Recent Notices</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

     
       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
       <br><br><br><br>
        
       <div class="container">
              
          
            <div class="content-wrapper">
			
			  <div class="container">
			     <div class="alert alert-info" role="alert">
			       <div class="row pad-botm">
            <div class="col-md-12"><h4 class="header-line">Notices Info. :</h4><hr> </div>
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
                                            <th>Title</th>
                                             <th>Status</th>
                                            <th>Sended</th>
                                            <th>Date & Time</th>
                                            <th>Edit</th>								
                                        </tr>
                                    </thead>
				 <tbody>
<%
                
             
            while(rso.next()){
                String status=rso.getString("status");
                if(status.equalsIgnoreCase("active")){
              
               
         String oid=rso.getString("oid");
        rs=o.getAllNotices(oid);
        while(rs.next())
        {
          n++;
	  status=new String(rs.getString("status"));
         
         String send=new String(rs.getString("send"));
          if(status.equalsIgnoreCase("active") && send.equalsIgnoreCase("not")){
         
          %>
		       <tr class="odd gradeX">
			        <td class="center"><b><%=n%></b></td>
			        <td class="center"><%=oid%></td>
				<td class="center"><%=rs.getString("title")%></td>
                                <%if(status.equalsIgnoreCase("active")){%>
                                <td class="center" style="color: green;"><b><%=status.toUpperCase()%></b></td>
                                <%}else{%><td class="center" style="color: red;"><%=status.toUpperCase()%></td><%}%>
                                <%if(send.equalsIgnoreCase("not")){%>
                                <td class="center" style="color: red;"><b><%=send.toUpperCase()%></b></td>
                                <%}else{%><td class="center" style="color: green;"><b><%=send.toUpperCase()%></b></td><%}%>
                                
                                <td class="center"><%=rs.getString("regdate")%></td>
				<td class="center"><a class="btn btn-info" href="editnt.jsp?nid=<%=rs.getString("nid")%>&oid=<%=oid%>" role="button" >Edit</a></td>
			</tr><%}}}}%>  
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
	
