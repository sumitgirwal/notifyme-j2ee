<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%
    String oid=(String)session.getAttribute("oid");
    com.bean.Org o=new com.bean.Org();
    int a=0,c=0;
    java.sql.ResultSet rsa=o.showAccessor(oid);
    String aname="",cname="";
    byte imgdata[]=null;
    
    DiskFileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);
    List<FileItem> items=upload.parseRequest(new ServletRequestContext(request));
    
    /*
    while(rsa.next())
     {
         String temp=request.getParameter(rsa.getString("aname")+"");
         if(temp!=null)
         {
      if(temp.equalsIgnoreCase("on")){
         aname =new String(aname+rsa.getString("aname")+",");
               }
         
          out.println(temp+"---"+rsa.getString("aname"));
    
    
     }}
     */
     java.sql.ResultSet rsc=o.showCategory(oid);
     /*
     while(rsc.next())
     { String temp=request.getParameter(rsc.getString("cname"));
     if(temp!=null)
         {
     if(temp.equalsIgnoreCase("on")){
      cname =new String(cname+rsc.getString("cname")+","); 
     
      }}
     }
*/
     
        String fname="";
        String  title="";
        String msg="";
        InputStream fdata=null;
      //  File f=new File("C:\\Users\\USER\\Desktop\\111.png");
       File f=new File("F:\\lastPro\\NotifyMePro\\web\\noimage.jpg");
       
        byte tempb[]=Files.readAllBytes(f.toPath());
            for(FileItem item:items){
            String name=item.getFieldName();
            if(name.equalsIgnoreCase("title")){
                 title=item.getString();
            }else if(name.equalsIgnoreCase("text")){
                msg=item.getString();
            }else if(name.equalsIgnoreCase("img")){
                imgdata=item.get();
                 if( (item.getName()).equalsIgnoreCase("") )
                 {
                  imgdata=tempb;
                 }
            
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
             //   System.out.println(cname+"");
                }
               }
              }
             }
            }
           // out.println("-------------------------------------------------------------------");
            
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
              //  System.out.println(aname+"");
                }
               }
              }
             //out.println("<br>Iteams:"+item);
             }
            }
            
                         
            
            
               
             
             
             
      
   // out.println("<br>aname="+aname);
    //out.println("cname="+cname);
    
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
 
     InputStream in=null;
     
      
      
       if(fname.equalsIgnoreCase(""))
       { fname = "not";}
       
       
       if(imgdata ==null)
       {out.println("hello sumit");}
       
       
    o.setTitle(title);
    o.setText(msg);
    o.setImgdata(imgdata);
    o.setFname(fname);
    //o.setFdata();
    o.setAname(aname);
    o.setCname(cname);
    o.setDt("Empty");
    
    
     
    
    
    int n=o.insertNt(oid,fdata);
   /* out.println(n+"data are<br>");   
    out.println(aname+"--------------"+cname);
out.println("<br>"+fname);
out.println(n+"data are the img="+imgdata);   
*/


           
         if(n>0)
              {
              out.println("<script>alert(\" Added Notice  Sucessfully  !!! \");" +
                "	window.open('addnt.jsp','_self');" +
                 "	</script>");             
              }else
              {
                 out.println("<script>alert(\"Sorry, Not Added Notice !!! \");" +
                 "	window.open('addnt.jsp','_self');" +
                "	</script>");
          }
         
%>

