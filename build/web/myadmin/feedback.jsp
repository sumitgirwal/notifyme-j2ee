<%

     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
 com.bean.Bean b=new com.bean.Bean();
 java.sql.ResultSet rs=b.showFeedback();



%>


<!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>MyAdmin DashBoard | Show Feedback</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
       <br><br><br>
        
       <div class="container">
              
          
            <div class="content-wrapper">
			
			  <div class="container">
			     <div class="alert alert-info" role="alert">
			       <div class="row pad-botm">
            <div class="col-md-12"><h4 class="header-line">Feedback Info. :</h4><hr> </div>
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
                                            <th>FID</th>
                                            <th>Email Address</th>
                                            <th>Feedback</th>
                                            <th>Reg. Date&Time</th>
                                            <th>Delete</th>
											
                                        </tr>
                                    </thead>
				 <tbody>
<%
                int n=0;
             
            while(rs.next()){
                n++;  
          %>
		       <tr class="odd gradeX">
			        <td class="center"><b><%=n%></b></td>
			        <td class="center"><%=rs.getString("fid")%></td>
				<td class="center"><%=rs.getString("email")%></td>
				<td class="center"><%=rs.getString("feedback")%></td>
                                <td class="center"><%=rs.getTimestamp("regdate")%></td>
	          <td class="center">
                      
                      
                        <a class="btn btn-info" href="deletef.jsp?fid=<%=rs.getString("fid")%>"role="button"  onclick="return confirm('Do You Went To Delete Feedback ?');" >DELETE</a> 
                     
			</tr><%}%>  
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
	
