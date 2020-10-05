<%
            String problem=request.getParameter("problem");
              String oid=(String)session.getAttribute("oid");
  String uid=(String)session.getAttribute("uid");
            
           com.bean.User u=new com.bean.User();
            u.setUid(uid);
            u.setProblem(problem);
           int n=u.updataProblem(oid);
            if(n>0)
            {
            
             out.println("<script>alert(\" Wait for responece the problem by for Oganization !!! \");" +
                "	window.open('myproblem.jsp','_self');" +
               "	</script>");
            
            }else
            {
                    out.println("<script>alert(\" Sorry, Not Updated Problem Yet !!! \");" +
               "	window.open('myproblem.jsp','_self');" +
              "	</script>");  
                    
            }
        
 %>