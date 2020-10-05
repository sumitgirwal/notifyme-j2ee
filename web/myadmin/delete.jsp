 
<%
    

           String myid=(String)session.getAttribute("myid");
            
           com.bean.My b=new com.bean.My();
            b.setMyid(myid);
             
           int n= b.deleteMyUser("notifymepro");
         
            
         if(n>0)
           {   out.println("<script>alert(\" Delete  Account Sucessfully  !!! \");" +
               "	window.open('logout.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Account Not Deleted Yet  !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
           
           
           }
        

%>