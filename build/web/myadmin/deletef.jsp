<%@page import="com.bean.Bean"%>
<%
          
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
           int fid=Integer.parseInt(request.getParameter("fid"));  
            Bean b=new Bean(); 
             
           int n=b.deleteFeedback(fid);
           if(n>0)
           {   out.println("<script>alert(\" Deleted  Feedback Sucessfully  !!! \");" +
               "	window.open('feedback.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Feedback Not Delete Yet !!! \");" +
               "	window.open('feedback.jsp','_self');" +
              "	</script>");
           
           
           }
        

%>