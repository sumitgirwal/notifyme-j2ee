<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
      myid=(String)session.getAttribute("myid");
     String oid=request.getParameter("oid");
     com.bean.Org o=new com.bean.Org();
     o.setOid(oid);
   int n=o.deleteOrg("notifymepro");
  //out.println("data are:"+n);  
       if(n>0)
           {   out.println("<script>alert(\" Delete  Account Sucessfully  !!! \");" +
               "	window.open('showorg.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Account Not Deleted Yet  !!! \");" +
               "	window.open('showorg.jsp','_self');" +
              "	</script>");
           
           
           }
          

        
         
         
         
        

%>