<%
    String oid=request.getParameter("oid");
int id=Integer.parseInt(request.getParameter("nid"));
com.bean.Org o=new com.bean.Org();
            o.setId(id);
            
          
           int n=o.deleteNotices(oid);
         if(n>0)
           {
                
                 out.println("<script>alert(\" Deleted Notices Sucessfully  !!! \");" +
               "	window.open('shownt.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry,  Not Delete yet  !!! \");" +
               "	window.open('shownt.jsp','_self');" +
              "	</script>");
           
           
           } 





%>