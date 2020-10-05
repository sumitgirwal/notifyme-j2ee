<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.InputStream"%>
<%@page import="jdk.internal.org.xml.sax.InputSource"%>
<%@page import="com.sun.xml.internal.ws.api.message.Attachment"%>
 
<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
  String oid=(String)session.getAttribute("oid");
  nid= Integer.parseInt(request.getParameter("nid"));
  atc(oid);
   
String contentType =this.getServletContext().getMimeType( fname);
System.out.println("ContentType="+contentType);
response.setHeader("Content-Type",contentType);
response.setHeader("Content-Length", String.valueOf(fdata.length()));
response.setHeader("Content-Disposition","inline; filename=\" "+fname +" \" ");
InputStream in=fdata.getBinaryStream();
byte[] b=new byte[1024];
int bytesRead;

while((bytesRead = in.read(b)) !=-1)
{
response.getOutputStream().write( b ,0,bytesRead);
}




%>

<%!
String fname="";
 
java.sql.Blob fdata;
 
int nid;

com.bean.Org o=new com.bean.Org();
public  void  atc( String oid)
{

try{
Connection con=new com.bean.Org().getCon(oid);
java.sql.ResultSet rs=con.createStatement().executeQuery("select * from notices where nid='"+nid+"' ");
rs.next();
fname=rs.getString("fname");
fdata=rs.getBlob("fdata");
}catch(Exception ex){System.out.println(ex);}

  
}

 



%>