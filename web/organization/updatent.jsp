 <%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%
int nid=(Integer)session.getAttribute("nid");
String oid=(String)session.getAttribute("oid");
com.bean.Org o=new com.bean.Org();
java.sql.ResultSet rsa=o.showAccessor(oid);
    String aname="",cname="";
    byte imgdata[]=null;
    
    DiskFileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);
    List<FileItem> items=upload.parseRequest(new ServletRequestContext(request));


 java.sql.ResultSet rsc=o.showCategory(oid);
 

        String fname="";
        String  title="";
        String msg="";
        InputStream fdata=null;
        String status="";
 for(FileItem item:items){
            String name=item.getFieldName();
            if(name.equalsIgnoreCase("title")){
                 title=item.getString();
            }else if(name.equalsIgnoreCase("text")){
                msg=item.getString();
            }else if(name.equalsIgnoreCase("img")){
                imgdata=item.get();
            }else if(name.equalsIgnoreCase("status")){
                status=item.getString();
            }
            else if(name.equalsIgnoreCase("fdata")){
                fname=item.getName();
                fdata =item.getInputStream();
            }
            //  out.println("<br>ITEAM:"+item.getName()+"--"+item.getFieldName());
            }  

          while(rsc.next())
            {
             for(FileItem item:items){
             String name=item.getFieldName();
             if(name.equalsIgnoreCase(rsc.getString("cname")))
             {
                 String temp= item.getString();
               if(temp!=null)
               {
                if(temp.equalsIgnoreCase("on")){
                cname =new String(cname+rsc.getString("cname")+","); 
                //System.out.println(cname+"");
                }
               }
              }
             }
            }
          

     while(rsa.next())
            {
             for(FileItem item:items){
             String name=item.getFieldName();
             if(name.equalsIgnoreCase(rsa.getString("aname")))
             {
                 String temp= item.getString();
               if(temp!=null)
               {
                if(temp.equalsIgnoreCase("on")){
                aname =new String(aname+rsa.getString("aname")+","); 
                //System.out.println(aname+"");
                }
               }
              }
             //out.println("<br>Iteams:"+item);
             }
            }
            
     if(aname.equalsIgnoreCase(""))
      {
          while(rsa.previous()){
           aname =new String(aname+rsa.getString("aname")+",");
          }
      
      }
      if(cname.equalsIgnoreCase(""))
      {
          while(rsc.previous()){
           cname =new String(cname+rsc.getString("cname")+",");
          }
      
      
      }
      
      o.setId(nid);
           
     java.sql.ResultSet rsn=o.showOneNotices(oid);
   rsn.next();
       if(title.equalsIgnoreCase(""))
       { title=rsn.getString("title");}
       if(msg.equalsIgnoreCase(""))
       { msg=rsn.getString("text");}
       if(imgdata.length==0)
        { imgdata=rsn.getBytes("img");}
       if(fname.equalsIgnoreCase(""))
       { fname=rsn.getString("fname");}
      if(fdata==null)
       { fdata=rsn.getBinaryStream("fdata");}
      
       
    o.setTitle(title);
    o.setText(msg);
    o.setImgdata(imgdata);
    o.setFname(fname);
    //o.setFdata();
    o.setAname(aname);
    o.setCname(cname);
    o.setStatus(status);
   /* out.println("<br><br>");
    out.println(title+"----"+msg);
    out.println(fname+"----");
    out.println(aname+"-----"+cname);    

    out.println("<br>----"+imgdata);
    out.println("<br><br>----------"+fdata);
    

   out.println(n+"data are");*/
       int n=o.updateNotices(oid,fdata);


if(n>0)
           {
               out.println("<script>alert(\" Updated Notice  Sucessfully  !!! \");" +
               "	window.open('editnt.jsp?nid="+nid+" ','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Not Update Notice Yet  !!! \");" +
               "	window.open('editnt.jsp?nid="+nid+" ','_self');" +
              "	</script>");
           
           
           } 

%>