  <%
  com.bean.User u=new com.bean.User();

  String oid=(String)session.getAttribute("oid");
  String uid=(String)session.getAttribute("uid");

  u.setUid(uid);
  java.sql.ResultSet rs1=u.showOneUser(oid);
  rs1.next();
  String acr=rs1.getString("aname");
  String ctr=rs1.getString("cname");
  u.setAcr(acr);
  u.setCtr(ctr);
  ResultSet rs2=u.showNotices(oid);
  int n=0;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User DashBoard | Show Notices</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <br><br>
      
       <div class="container">  <%while(rs2.next()){
           n++;
           %>
 
  <div class="card mb-3">
<!--  <img src="assets/css/image/bk4.jpg"  class="card-img-top" style="height: 200px;" >-->
  <div class="card-body">
     
    <h5 class="card-title"><%=n%>) <%=rs2.getString("title")%></h5>
    <p class="card-text"><a href="shownt2.jsp?nid=<%=rs2.getInt("nid")%>"> Cick To View </a></p>
    <p class="card-text"><small class="text-muted">Last updated <%=rs2.getString("regdate")%>Date and Time</small></p>
  </div>
</div><%}%>
         
       </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> <br>
     <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>
