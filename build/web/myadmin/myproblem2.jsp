
<%
            String myproblem=request.getParameter("myproblem");
     
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
            com.bean.My o=new com.bean.My();
            o.setProblem(myproblem);
            o.setMyid(myid);
            int n=o.updateMyProblem("notifymepro");
            if(n>0)
            {
            
           out.println("<script>alert(\" Added Problem Sucessfully !!! \");" +
               "	window.open('myproblem.jsp','_self');" +
               "	</script>");
            
            }else
            {
                     out.println("<script>alert(\"Not Added Problem Yet !!! \");" +
               "	window.open('myproblem.jsp','_self');" +
               "	</script>");
                    
            }
        
 %>