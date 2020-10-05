<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    String uid=request.getParameter("uid");
     com.bean.My m=new com.bean.My();
     m.setUid(uid);
   int n=m.deleteMyUser("notifymepro");
   
 // out.println("data are:"+n);  
       if(n>0)
           {   out.println("<script>alert(\" Delete  Account Sucessfully  !!! \");" +
               "	window.open('showmyadmin.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Account Not Deleted Yet  !!! \");" +
               "	window.open('editmyuser.jsp?uid="+uid+"','_self');" +
              "	</script>");
           
           
           }
          




%>