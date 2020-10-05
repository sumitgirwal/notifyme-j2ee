<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
com.bean.My m=new com.bean.My();
String temp="";
temp = (String)session.getAttribute("sended");
//out.println("Sended="+temp);
String sended =new String(temp+"");
temp = null;
temp = (String)session.getAttribute("notsended");
String notsended[] =temp.split(",");
//out.println("NotSended="+temp);
String uid=request.getParameter("uid");
String oname=(String)session.getAttribute("oname");
int nid=Integer.parseInt(request.getParameter("nid"));
//String sended=(String)session.getAttribute("sended");
//String notsended[]=((String)session.getAttribute("notsended")).split(",");
//out.println("sended="+sended);
//out.println(uid+"------"+nid);
//com.bean.My m=new com.bean.My();


java.sql.ResultSet rs=m.showAnyThing("notifymepro","user","uid",uid);
rs.next();
String oid=rs.getString("oid");
java.sql.ResultSet rsn=m.showAnyThing(oid+"","notices","nid",nid);
rsn.next();
//out.println("<br>");
String fname=rs.getString("fname");
String lname=rs.getString("lname");

String title=rsn.getString("title");
String msg=rsn.getString("text");
String email=rs.getString("email");

       com.nmp.JEmail e=new  com.nmp.JEmail();
       String[] toemail={email+""};
        
       String text= e.getText(uid, oname, fname, lname, title, msg);
         boolean found=e.EmailCaller(request, toemail , text);
      
 /*      System.out.println("founded="+found+"<br>");
      out.println("<br><br>");
   */    
       if(found)
       {
        sended= sended+","+uid;
        for(String ns : notsended)
        {
         if(ns.equalsIgnoreCase(uid))
         { 
          temp=temp.replaceAll(uid,"");
          
         }
          
        }
        
        
       }else{out.println("<script>alert(\" Details Not Send To  User  !!! \"); </script>");}
     
     // out.println("<br><br>");
       session.setAttribute("sended", sended);
       session.setAttribute("notsended", temp);
       //out.print(sended+"----"+temp);
      
      out.println("<script> " +
              "	window.open('showtosend.jsp','_self');" +
             "	</script>");


%>