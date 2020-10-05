  <%
  com.bean.User u=new com.bean.User();
  int nid=Integer.parseInt(request.getParameter("nid"));
  String oid=(String)session.getAttribute("oid");
  u.setNid(nid);
  ResultSet rs2=u.showOneNotices(oid);

%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User DashBoard | Show Notice </title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <br><br>
      <div class="container">
       
       <div class="form-row">

    <div class="form-group col-md-2">
      </div>
   
     <div class="form-group col-md-8">
    <%while(rs2.next()){%>
       
      
  <div class="card" style="width: 50rem;">
      <img src="ImageLoader.jsp?nid=<%=nid%>"  class="card-img-top" style=" "   >
  <div class="card-body">
       <h2 >Notices Info. :</h2><br>
    <h4 class="card-title"><%=rs2.getString("title")%></h4>
    <p class="card-text"><%=rs2.getString("text")%></p>
    <h6><br>
                 <%
                     String fname=rs2.getString("fname");
             if(!fname.equalsIgnoreCase("not")){ %>    
          <label><b>Available File :</b> </label> &nbsp;&nbsp; <%=fname%>  &nbsp;&nbsp;
          <a class="btn btn-danger btn-group-sm " href="downto.jsp?nid=<%=nid%>" role="button" >Download</a>
          <%}%>
          
    </h6>
      </div>    <div class="card-footer">
    <p class="card-text"><small class="text-muted"><b>Last updated </b> <%=rs2.getString("regdate")%>&nbsp;Date and Time</small></p>
  </div>
</div><%}%>   </div>
     <div class="form-group col-md-2">
      </div>
  
     
  </div>
      </div>
        
     <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>
