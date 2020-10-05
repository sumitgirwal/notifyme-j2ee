
 <%
String oid=(String)session.getAttribute("oid");
com.bean.Org o=new com.bean.Org();
java.sql.ResultSet rs=o.getAllNotices(oid);
if(rs==null)
{rs=null;}
int n=0;
 
 
 %>                                                      
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>Organization DashBoard | Show Notices </title>
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
            <div class="col-md-12"><h4 class="header-line">All Notices Info. :</h4><hr> </div>
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
                                            <th>NID</th>
                                            <th>Title</th>
                                            <th>Status</th>
                                            <th>Image</th>
                                            <th>Date & Time</th>
                                            <th>Edit</th>								
                                        </tr>
                                    </thead>
				 <tbody>
<%
                
             
            while(rs.next()){			  
				String status=rs.getString("status");			n++;  
          %>
		       <tr class="odd gradeX">
			        <td class="center"><b><%=n%></b ></td>
			        <td class="center"><%=rs.getString("nid")%></td>
				<td class="center"><%=rs.getString("title")%></td>
                                 <%if(status.equalsIgnoreCase("active")){%>
                                <td class="center" style="color: green;"><b><%=status.toUpperCase()%></b></td>
                                <%}else if(status.equalsIgnoreCase("deactive")){%><td class="center" style="color: red;"><b><%=status.toUpperCase()%></b></td><%}%>
                              
                                <td class="center">
                                    <% 
                                 byte imgdata[]=rs.getBytes("img");       
                                        
                                 if(imgdata==null){%>  
                                <img src="assets/css/image/1.jpg"  class="card-img-top" style="height: 150px; width: 200px"> 
                                <%}else{%>
                                <img src="ImageLoader.jsp?nid=<%=rs.getString("nid")%>"  class="card-img-top" style="height: 150px; width: 200px"> 
                                <%}%>
                                </td>
                                <td class="center"><%=rs.getString("regdate")%></td>
				<td class="center"><a class="btn btn-info" href="editnt.jsp?nid=<%=rs.getString("nid")%>" role="button" >Edit</a></td>
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
	
