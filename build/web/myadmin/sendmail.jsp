<%
    
   
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    com.bean.My m=new com.bean.My();
    m.setMyid(myid);
    java.sql.ResultSet rs=m.showAnyThing("notifymepro","myadmin","myid",myid);
    rs.next();
    
    String email=rs.getString("email");
    
    
    
       com.nmp.JEmail e=new  com.nmp.JEmail();
       String[] toemail={email+""};
        
       boolean found=e.EmailCaller(request, toemail);
      
      /* 
       System.out.println("founded="+found+"<br>");
      out.println("<br><br>");
       */
       if(found)
       {
       out.println("<script>alert(\"Verify Code,Sended to your email  !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
        }
        else{
       
        out.println("<script>alert(\"Sorry, Check Your Connection  !!! \");" +
               "	window.open('index.jsp','_self');" +
              "	</script>");
       }
      
        
       


%>