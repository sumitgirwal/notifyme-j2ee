<%

 String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
String uid=(String)session.getAttribute("uid");
com.bean.My m=new com.bean.My();
m.setUid(uid);
java.sql.ResultSet rs=m.showOneUser("notifymepro");
 while(rs.next())
 {
        
        m.setAname(rs.getString("aname"));
        m.setCname(rs.getString("cname"));
        m.setCity(rs.getString("city"));
        m.setFname(rs.getString("fname"));
        m.setLname(rs.getString("lname"));
        m.setCno(rs.getString("cno"));
        m.setPassword(rs.getString("password"));
        m.setEmail(rs.getString("email"));
        
        
  
     
 }
 
int n=m.updateMyStatus("notifymepro");
//out.println(n+"output are....");

 

 if(n>0)
 {  out.println("<script>alert(\" Activated Account Sucessfully  !!! \");" +
               "	window.open('showmyadmin.jsp','_self');" +
              "	</script>");
 }else{
 
  out.println("<script>alert(\"Sorry,Not Active Yet !!!  !!! \");" +
               "	window.open('activemyadmin.jsp?uid="+uid+"','_self');" +
              "	</script>");
}

 










%>

