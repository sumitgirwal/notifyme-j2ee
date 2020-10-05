<%
String oid=(String)session.getAttribute("oid");
int aid=(Integer)session.getAttribute("aid");
String aname=request.getParameter("aname");
com.bean.Org o=new com.bean.Org();
java.sql.ResultSet rsa=o.showOneAccessor(oid);

rsa.next();
if(aname.equalsIgnoreCase(""))
{aname=rsa.getString("aname");}

o.setAname(aname);
o.setId(aid);
int n=o.updateAccessor(oid);
     if(n>0)
           {   out.println("<script>alert(\"Update   Sucessfully  !!! \");" +
               "	window.open('showa.jsp?aid="+aid+"&aname="+aname+"','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry,  Not Update Yet  !!! \");" +
               "	window.open('showa.jsp?aid="+aid+"&aname="+aname+"','_self');" +
              "	</script>");
           
           }





%>
