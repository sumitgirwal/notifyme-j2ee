<%
String oid=(String)session.getAttribute("oid");
int aid=Integer.parseInt(request.getParameter("aid"));
com.bean.Org o=new com.bean.Org();
o.setId(aid);
int n=o.deleteAccessor(oid);
       if(n>0)
           {
                
                 out.println("<script>alert(\" Deleted Accessor Sucessfully  !!! \");" +
               "	window.open('showa.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry,  Not Deleted Yet !!! \");" +
               "	window.open('showa.jsp','_self');" +
              "	</script>");
           
           
           } 

%>