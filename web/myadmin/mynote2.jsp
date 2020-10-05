<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.My"%>
<%
            String notes=request.getParameter("mynote");
            
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
            My b=new My();
            b.setMyid(myid);
            b.setNotes(notes);
                 
             
            int n=b.updateMyNotes("notifymepro");
            if(n>0)
            {
            
             out.println("<script> " +
               "	window.open('mynote.jsp','_self');" +
              "	</script>");  
                    
            }else
            {
            
            out.println("<script>alert(\" Sorry, Not Update Yet  !!! \");" +
               "	window.open('mynote.jsp','_self');" +
              "	</script>");  
            
            
            
            }
        
 %>