  <%
    
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
  
   com.bean.My m=new com.bean.My();
   m.setMyid(myid);
   java.sql.ResultSet rs=m.showAnyThing("notifymepro","myadmin","myid",m.getMyid() );
   rs.next();
   
  %>

 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>MyAdmin DashBoard | Home</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
        <%@include  file="includes/dashboard.jsp"%>  
          
         <div class="hey">Hey MyAdmin,<span style="font-family:Calibri;padding-left:5px; font-size:25px;color:#fcfcfc">
          <%=rs.getString("fname")%></span>
         </div>
        
       <div class="container">
            <%@include  file="includes/values.jsp"%>  
          
        


      
           

      </div>

           <br><br>     <br><br>
      
	  <br>

         <%@include  file="includes/footer.jsp"%>  
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>
	
	
	
	
 

