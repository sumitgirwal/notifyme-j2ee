<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    String oid=(String)session.getAttribute("oid");
int id=Integer.parseInt(request.getParameter("nid"));
com.bean.Org o=new com.bean.Org();
            o.setId(id);
            
          
           int n=o.deleteNotices(oid);
         if(n>0)
           {
                
                 out.println("<script>alert(\" Deleted Notice  Sucessfully !!! \");" +
               "	window.open('shownt.jsp?oid="+oid+"&oname=MyCode','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Not Delete  yet !!! \");" +
               "	window.open('shownt.jsp','_self');" +
              "	</script>");
           
           
           } 





%>