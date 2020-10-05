<%
 
         com.bean.User u=new com.bean.User();
         String uid=(String)session.getAttribute("uid");
         String oid=(String)session.getAttribute("oid");
         
         u.setUid(uid);
         int n=u.deleteUser(oid);
            n=n+u.updateUserStatus("notifymepro");
           out.println("data are:"+n);
         if(n>0)
           {   out.println("<script>alert(\" Delete  Account Sucessfully  !!! \");" +
               "	window.open('showuser.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Account Not Deleted Yet  !!! \");" +
               "	window.open('edituser.jsp?uid="+uid+"&oid="+oid+".jsp','_self');" +
              "	</script>");
           
           
           }
          




%>