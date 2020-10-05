<%
String oid=(String)session.getAttribute("oid");
int cid=(Integer)session.getAttribute("cid");
String cname=request.getParameter("cname");
com.bean.Org o=new com.bean.Org();
java.sql.ResultSet rsc=o.showOneCategory(oid);

rsc.next();
if(cname.equalsIgnoreCase(""))
{cname=rsc.getString("cname");}

o.setCname(cname);
o.setId(cid);
int n=o.updateCategory(oid);

     if(n>0)
           {   out.println("<script>alert(\"Updated Category Sucessfully !!! \");" +
               "	window.open('editc.jsp?cid="+cid+"&cname="+cname+"','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry,  Not Updated Yet !!! \");" +
               "	window.open('editc.jsp?cid="+cid+"&cname="+cname+"','_self');" +
              "	</script>");
           
           }





%>
