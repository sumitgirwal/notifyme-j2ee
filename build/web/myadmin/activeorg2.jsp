<%
String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
String oid=(String)session.getAttribute("oid");
com.bean.My m=new com.bean.My();
m.setOid(oid);
java.sql.ResultSet rs=m.showOneOrg("notifymepro");
 while(rs.next())
 {
  m.setStatus("active");
 }
int n=m.updateOrgStatus("notifymepro");
//out.println(n+"outpsasasasaut are....");
 if(n>0)
  {  out.println("<script>alert(\" Activated Account Sucessfully  !!! \");" +
               "	window.open('showorg.jsp','_self');" +
              "	</script>");
 }else{
 
  out.println("<script>alert(\"Sorry,Not Active Yet !!!  !!! \");" +
               "	window.open('showorg.jsp','_self');" +
             "	</script>");}


%>




















