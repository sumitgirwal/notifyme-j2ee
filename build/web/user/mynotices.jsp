
 <%
String oid=(String)session.getAttribute("oid");
String uid=(String)session.getAttribute("uid");
com.bean.Org o=new com.bean.Org();
java.sql.ResultSet rs=o.getAllNotices(oid);
int n=0;
o.setUid(uid);
java.sql.ResultSet rsn=o.showOneUser(oid);
rsn.next();
String status=rsn.getString("status");
 
 %>                                                      
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>User DashBoard | My Notices</title>
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
                                            <th>Text</th>
                                            <th>Image</th>
                                            <th>Date & Time</th>
                                            <th>Edit</th>								
                                        </tr>
                                    </thead>
				 <tbody>
<%
                
             
            while(rs.next()){			  
							n++; 
        String aname[]=rs.getString("aname").split(",");
        String cname[]=rs.getString("cname").split(",");
        boolean found1=o.findPrivilege(aname,rsn.getString("aname"));
        boolean found2=o.findPrivilege(cname,rsn.getString("cname"));
         if(found1 && found2)
         {

          %>
		       <tr class="odd gradeX">
			        <td class="center"><b><%=n%></b></td>
			        <td class="center"><%=rs.getString("nid")%></td>
				<td class="center"><%=rs.getString("title")%></td>
                                <td class="center"><%=rs.getString("text")%></td>
                                <td class="center">
                                <img src="ImageLoader.jsp?nid=<%=rs.getString("nid")%>"  class="card-img-top" style="height: 150px; width: 200px"> 
                                </td>
                                <td class="center"><%=rs.getString("regdate")%></td>
				<td class="center">
                  <a class="btn btn-info" href="shownt2.jsp?nid=<%=rs.getString("nid")%>" role="button" >View</a>
         <%   
               
            if(status.equalsIgnoreCase("access"))
            {%>
           <a class="btn btn-info" href="editnt.jsp?nid=<%=rs.getString("nid")%>&oid=<%=oid%>" role="button" >Edit</a>
           <%} %>
                                </td>
			</tr><%}}%>  
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
	
