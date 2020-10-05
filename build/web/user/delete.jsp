  
<%
    

           String uid=(String)session.getAttribute("uid");
            String oid=(String)session.getAttribute("oid");
           com.bean.User b=new com.bean.User();
            b.setUid(uid);
            b.setOid(oid);
           int n= b.deleteUser(oid);
         
            
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