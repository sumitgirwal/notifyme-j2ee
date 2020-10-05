
<%
 com.bean.My m=new com.bean.My();
 String oid=(String)session.getAttribute("oid");

 m.setOid(oid);
java.sql.ResultSet rs=m.showOneOrg("notifymepro");
rs.next();
String myproblem=rs.getString("problem");


%>


 <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">

     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>Organization DashBoard | My Problem</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
   
 
  </head>

       <body>
     
        <%@include file="includes/dashboard.jsp"%>
    
        
       <br><br><br>
           
                                                                
<div class="container">
  <div class="alert alert-success" role="alert">
  <h4 class="alert-heading">My Problems :</h4><hr>
<div class="alert alert-light" role="alert">  
      <form action="myproblem2.jsp" method="post">

          <textarea class="form-control" id="exampleFormControlTextarea1" rows="9"  id="myproblem" name="myproblem" ><%=myproblem%></textarea>    
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


	
 

