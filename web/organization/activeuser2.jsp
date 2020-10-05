<%

String cname=request.getParameter("cname");
String aname=request.getParameter("aname");

String uid=(String)session.getAttribute("uid");
String oid=(String)session.getAttribute("oid");


com.bean.Org o=new com.bean.Org();
o.setUid(uid);
o.setOid(oid);
o.setAname(aname);
o.setCname(cname);
//out.println("oid="+oid+"--"+uid);

o.setUid(uid);
java.sql.ResultSet rs=o.showOneUser("notifymepro");
 while(rs.next())
 {
  o.setFname(rs.getString("fname"));
  o.setLname(rs.getString("lname"));
  o.setCity(rs.getString("city"));
  o.setCno(rs.getString("cno"));
  o.setPassword(rs.getString("password"));
  o.setStatus("active");
  o.setEmail(rs.getString("email"));
 }
int n=o.insertUser(oid);




if(n>0)
{
 out.println("<script>alert(\" Activated Account Sucessfully  !!! \");" +
               "	window.open('showuser.jsp','_self');" +
              "	</script>");
}else{

 out.println("<script>alert(\"Sorry,Not Active Yet !!!  !!! \");" +
               "	window.open('showuser.jsp','_self');" +
              "	</script>");
}
 












%>

