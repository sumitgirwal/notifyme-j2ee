<%
              String notes=request.getParameter("notes");
              String oid=(String)session.getAttribute("oid");
              String uid=(String)session.getAttribute("uid");
   
            
           com.bean.User u=new com.bean.User();
            u.setUid(uid);
            u.setNotes(notes);
           int n=u.updataNotes(oid);
            if(n>0)
            {
           
             out.println("<script>" +
               "	window.open('mynote.jsp','_self');" +
              "	</script>");
            
            }else
            {
                    out.println("<script>alert(\" Sorry, Not Updated Yet  !!! \");" +
               "	window.open('mynote.jsp','_self');" +
              "	</script>");  
                    
            }
        
 %>