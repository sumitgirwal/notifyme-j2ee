<%

int vc =Integer.parseInt(request.getParameter("vcode"));
int vcode=(Integer)session.getAttribute("vcode");
  String email=request.getParameter("email");
  String uid=request.getParameter("uid");
  String btn;
  
  
  if(vc==vcode){
             boolean founded=false;
            com.bean.Bean b=new com.bean.Bean();
            java.sql.ResultSet rs1,rs2,rs3;
             rs1=b.checkWho2("notifymepro","user", "uid", uid,email);
             rs2=b.checkWho2("notifymepro","organization", "oid", uid,email);
          rs3=b.checkWho2("notifymepro","myadmin", "myid", uid,email);
               if(rs3.next())
            {
                
                
                 String status=rs3.getString("status");
                if(status.equalsIgnoreCase("panding"))
                {
                        btn="panding";    
                }else{
                    btn="myadmin";
                }
      
                session.setAttribute("myid",rs3.getString("myid"));   
               out.println("<script type=\"text/javascript\" >\n" +
"                  window.location.href='loadDB?btn="+btn+"';\n" +
"               </script>");
            
            
            }
                     else  if(rs1.next()){
            
                String status=rs1.getString("status");
                if(status.equalsIgnoreCase("panding"))
                {
                        btn="panding";    
                }else{
                    btn="user";
                }
                
                
                session.setAttribute("uid",rs1.getString("uid"));
                session.setAttribute("oid",rs1.getString("oid"));
                out.println("<script type=\"text/javascript\" >\n" +
"                  window.location.href='loadDB?btn="+btn+"';\n" +
"               </script>");
                
            
            }
            else if(rs2.next())
            {
                String status=rs2.getString("status");
                if(status.equalsIgnoreCase("panding"))
                {
                        btn="panding";    
                }else{
                    btn="org";
                }
                
                
      
                session.setAttribute("oid",rs2.getString("oid"));   
               out.println("<script type=\"text/javascript\" >\n" +
"                  window.location.href='loadDB?btn="+btn+"';\n" +
"               </script>");} 
           
            else{
           out.println("<script>alert(\" Access Denied !!! \");" +
               "	window.open('login.jsp','_self');" +
               "	</script>");
            
            }
             
}else{

 out.println("<script>alert(\" Access Denied !!! \");" +
               "	window.open('login.jsp','_self');" +
               "	</script>");

}






%>
