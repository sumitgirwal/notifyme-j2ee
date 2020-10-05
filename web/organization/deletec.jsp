<%
String oid=(String)session.getAttribute("oid");
int cid=Integer.parseInt(request.getParameter("cid"));
com.bean.Org o=new com.bean.Org();
o.setId(cid);
int n=o.deleteCategory(oid);
     
       if(n>0)
           {
                
                 out.println("<script>alert(\" Deleted   Sucessfully  !!! \");" +
               "	window.open('showc.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry,  Not Delete yet  !!! \");" +
               "	window.open('showc.jsp','_self');" +
              "	</script>");
           
           
           } 

%>