  <%
  com.bean.User u=new com.bean.User();
  String oid=(String)session.getAttribute("oid");
  String uid=(String)session.getAttribute("uid");
  u.setUid(uid);
  java.sql.ResultSet rs=u.showOneUser(oid);
  rs.next();
  String fname=rs.getString("fname");
   u.setUid(uid);
  java.sql.ResultSet rs1=u.showOneUser(oid);
  rs1.next();
  String acr=rs1.getString("aname");
  String ctr=rs1.getString("cname");
  u.setAcr(acr);
  u.setCtr(ctr);
  ResultSet rs2=u.showNotices(oid);
  int n=0;
  rs2.afterLast();
  
  
  %>

 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>User DashBoard | Home</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
         <div class="hey">Hey,<span style="font-family:Calibri;padding-left:5px; font-size:25px;color:#fcfcfc">
          <%=fname%></span>
         </div>
        
               <%@include  file="includes/values.jsp" %>
               <br><br>
   <div class="container">
       
       <div class="row">
       <%
       while(rs2.previous()){
       n++;
       if(n>0)
       {
      int nid=rs2.getInt("nid");     
      
       
       %> 
       <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro">
                             
                    
  <div class="card" style="width: 20rem;">
      <img src="ImageLoader.jsp?nid=<%=nid%>"  class="card-img-top" style=" "   >
  <div class="card-body">
      
      <h4 class="card-title"><a href="shownt2.jsp?nid=<%=nid%>"><%=n%>) <%=rs2.getString("title")%></a></h4>
    
     
      </div>    <div class="card-footer">
    <p class="card-text"><small class="text-muted"><b>Last updated </b> <%=rs2.getString("regdate")%>&nbsp;Date and Time</small></p>
  </div>
</div>     </div>
                        
                      </div></div>
                      <% }}%>
                      
                      
                      
  
      </div> </div>
+

           <br><br> <br><br><br>
       
       <%@include  file="includes/footer.jsp" %>
 

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>
	
		
	
 

