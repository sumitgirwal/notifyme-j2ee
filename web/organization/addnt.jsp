 <%  String oid=(String)session.getAttribute("oid");
 
   com.bean.Org o=new com.bean.Org();
   o.setOid(oid);
   java.sql.ResultSet rs=o.showOneData("notifymepro");
   rs.next();
   String oname=rs.getString("oname");
   java.sql.ResultSet rsa=o.showAccessor(oid);
    java.sql.ResultSet rsc=o.showCategory(oid);
   int i=0;
   int j=0;
   

%>
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">
     <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    

    <title>Organization DashBoard | Add Notice</title>
      <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
        <link href="assets/css/font-awesome.css" rel= "stylesheet">
            
	
    </head>

       <body>
        <!--print all the link for quiz-->
            
           <%@include  file="includes/dashboard.jsp" %>
        
           <div class="container"><br>
          <div class="alert alert-success" role="alert">
          <h4 class="alert-heading">Add Notice :</h4><hr>
 
    
    
    <form method="post"  action="addnt2.jsp" enctype="multipart/form-data">
        
         <div class="form-row">

    <div class="form-group col-md-6">
      <label><b>Organization ID </b></label>
      <input type="text" class="form-control"  placeholder="<%=oid.toUpperCase()%>"  readonly="" autocomplete="off">
    </div>
   
    
   
  
  </div>
       <label><b>Title  </b></label><br>
       <input type="text" class="form-control" name="title" placeholder="Title"  required  autocomplete="off"><br>
    <label> <b> Accessor :</b></label>&nbsp; &nbsp;
              <%while(rsa.next()){
               String   acr=rsa.getString("aname");             
                 
                %>     
              &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=acr%>" >
                  <label class="form-check-label" for="exampleCheck1" ><%=acr.toUpperCase()%></label> &nbsp; &nbsp;
           <%}%>
    
          <br>
              <br>
        <label> <b>Category :</b></label>&nbsp; &nbsp;
              <%  
                  
                  while(rsc.next()){
              
              String ctr=rsc.getString("cname");
              %>
               &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=ctr%>" >
                  <label class="form-check-label" for="exampleCheck1" ><%=ctr.toUpperCase()%></label> &nbsp; &nbsp;
              <%}%>
   
                        <br>
              <br>
                  
 
         <div class="row">
      <div class="form-group col-md-6">   
      <label><b>Select Image   </b></label>
      <input type="file" class="form-control-file" name="img"    autocomplete="off"></div>
       <div class="form-group col-md-6">
      <label><b>Select File   </b> </label>
       <input type="file" class="form-control-file" name="fdata"    autocomplete="off"></div>
         </div>
       <br>
         <label><b>Text  </b></label><br>
           <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"  name="text" placeholder="Text" required="" ></textarea>    

   <br><br>
 <button type="button" class="btn btn-outline-success btn-lg" onclick="window.location.href='index.jsp'">
             BACK
          </button>&nbsp;
         &nbsp;<button type="submit" class="btn btn-outline-success btn-lg" >
             ADD
          </button>
         
 
 </form>
 
         
      
    </div>
    
     


          </div></div>
     <%@include  file="includes/footer.jsp" %>
	  

   
     <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
   
  </body>
</html>
	
	
	
	
 

