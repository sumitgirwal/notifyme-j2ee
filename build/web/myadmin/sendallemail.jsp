<%
    
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
int nid=Integer.parseInt(request.getParameter("nid"));
String oid=(String)session.getAttribute("oid");

session.setAttribute("nid",nid);




   com.bean.Org o=new  com.bean.Org();
   com.bean.My m=new  com.bean.My();
    o.setOid(oid);
    
   java.sql.ResultSet oname2=o.showOneData("notifymepro");
     oname2.next();
   String temp=oname2.getString("oname");
   
   
session.setAttribute("oname",temp);

   o.setId(nid);
 java.sql.ResultSet rs=o.showOneNotices(oid);
rs.next();
String title=rs.getString("title");
String msg=rs.getString("text");
String oname=new String(temp);
        
       // out.println("<br><br>Temp :"+temp);

   java.sql.ResultSet rsa=o.showAccessor(oid);
   java.sql.ResultSet rsc=o.showCategory(oid);
String aname[]=rs.getString("aname").split(",");
String cname[]=rs.getString("cname").split(",");
int i=0;
int j=0;
int n=0;
String sended="";
String notsended ="";

for(i=0;i<aname.length;i++)
{
 for(j=0;j<cname.length;j++)
 {
     
 // out.println("<br>"+aname[i]+"----"+cname[j]);
  rs=m.sendMailWithUser(oid,aname[i],cname[j]);
 while(rs.next())
 {
  //out.println("<br>----->"+rs.getString("uid")+"<**********>"+rs.getString("email"));
  
   String email=rs.getString("email");
         com.nmp.JEmail e=new  com.nmp.JEmail();
       String[] toemail={email+""};
       String uid=new String(""+rs.getString("uid"));
       String text=e.getText(uid,oname, rs.getString("fname"), rs.getString("lname"), title,msg);
       boolean found=e.EmailCaller(request,toemail,text);
       //System.out.println("founded="+found);
       if(found)
       {
           sended=sended+","+uid;
        
       // out.println(sended+"-Sended Code To :"+email);
        
        n=1;
       }else
       {
            notsended=notsended+","+uid;
        //out.println(notsended+"-Email are wrong :"+email);
        
       }
           
  
 }
 m.setId(nid);
 n=m.updateNotices(oid);
 if(n>0)
 {
     
// out.println("Update the   send....,"+n);
 }
 
 
 
 //else
// {
// 
// out.println("<script>alert(\" Accessor Or Cname Not Exsist  User  !!! \");" +
//               "	window.open('editnt.jsp?nid="+nid+"&oid="+oid+"','_self');" +
//              "	</script>");
 
 //}
 
 }
 

}
//out.println(sended+"----------"+notsended);

 session.setAttribute("sended",sended);
 session.setAttribute("notsended",notsended);
 session.setAttribute("oid",oid);
 //out.println("<a href=\"showtosend.jsp\">Click To How to Show.</a>");
out.println("<script>alert(\" Details Send To All User  !!! \");" +
              "	window.open('showtosend.jsp','_self');" +
             "	</script>");














%>
 