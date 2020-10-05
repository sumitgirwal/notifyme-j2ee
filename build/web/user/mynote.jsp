<%

  com.bean.User u=new com.bean.User();

   String oid=(String)session.getAttribute("oid");
   String uid=(String)session.getAttribute("uid");
   
  u.setUid(uid);
  java.sql.ResultSet rs=u.showOneUser(oid);
  rs.next();
String notes=rs.getString("notes");

%>

 <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>User DashBoard | My Notes  </title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">

  
    </head>

       <body>
     
        <%@include file="includes/dashboard.jsp"%>
    
        
       <br><br><br>
           
                                                                
<div class="container">
  <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">My Notes :</h4><hr>
<div class="alert alert-light" role="alert">  
      <form action="mynote2.jsp" method="post">

          <textarea class="form-control" id="exampleFormControlTextarea1" rows="9"  name="notes" ><%=notes%></textarea>    
</div>
 <button type="button" class="btn btn-outline-success btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
         &nbsp;<button type="submit" class="btn btn-outline-success btn-lg" >
             SAVE
          </button>
          </form>


</div>

</div>


             <br><br>
  <%@include file="includes/footer.jsp"%>
          
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>


	
 

