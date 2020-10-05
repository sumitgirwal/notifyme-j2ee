<%
    
    
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    String oid=request.getParameter("oid");
    com.bean.Org o=new com.bean.Org();
    int a=0,c=0;
    java.sql.ResultSet rsa=o.showAccessor(oid);
    String aname="",cname="";
    while(rsa.next())
     {
         String temp=request.getParameter(rsa.getString("aname")+"");
         if(temp!=null)
         {
      if(temp.equalsIgnoreCase("on")){
         aname =new String(aname+rsa.getString("aname")+",");
               }
         
          //out.println(temp+"---"+rsa.getString("aname"));
     }}
  
     java.sql.ResultSet rsc=o.showCategory(oid);
     while(rsc.next())
     { String temp=request.getParameter(rsc.getString("cname"));
     if(temp!=null)
         {
     if(temp.equalsIgnoreCase("on")){
      cname =new String(cname+rsc.getString("cname")+","); 
     
      }}
     }
     
    

   /* out.println("aname="+aname);
    out.println("cname="+cname);
    */
    
    o.setTitle(request.getParameter("title"));
    o.setText(request.getParameter("text"));
    o.setAname(aname);
    o.setCname(cname);
    o.setDt(request.getParameter("dt"));
    
    
    
    int n=o.insertNt(oid);
    
    //out.println(n+"data are");       
           
         if(n>0)
            {
              out.println("<script>alert(\" Added Notices  Sucessfully  !!! \");" +
               "	window.open('addnt.jsp','_self');" +
               "	</script>");
            
           }else
           {
                out.println("<script>alert(\"Sorry, Not Added Notices !!! \");" +
              "	window.open('addnt.jsp','_self');" +
              "	</script>");
           }
         
%>