<%
String btn=request.getParameter("btn");
String oid=(String)session.getAttribute("oid");
com.bean.Org o=new com.bean.Org();

if(btn.equalsIgnoreCase("accessor"))
{
String aname=request.getParameter("aname");
o.setAname(aname);
int n=o.insertAname(oid);
            if(n>0)
            {
              out.println("<script>alert(\" Added  Sucessfully  !!! \");" +
               "	window.open('addprivilege.jsp','_self');" +
               "	</script>");
            
           }else
           {
                out.println("<script>alert(\"Sorry, Not Added Yet !!! \");" +
              "	window.open('addprivilege.jsp','_self');" +
              "	</script>");
           }
         

}
else
{
String cname=request.getParameter("cname");
 o.setCname(cname);
int n=o.insertCname(oid);
           if(n>0)
            {
              out.println("<script>alert(\" Added  Sucessfully  !!! \");" +
               "	window.open('addprivilege.jsp','_self');" +
               "	</script>");
            
           }else
           {
                out.println("<script>alert(\"Sorry, Not Added Yet !!! \");" +
              "	window.open('addprivilege.jsp','_self');" +
              "	</script>");
           }

}






%>