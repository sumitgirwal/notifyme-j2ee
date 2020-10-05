<%@page import="com.bean.User"%>
<%
    
           String vr=request.getParameter("vcode");
           String vc=new String(""+session.getAttribute("vcode"));
           String oid=(String)session.getAttribute("oid");
           String oname=(String)request.getParameter("oname");
           String email=(String)request.getParameter("email");
           String city=(String)request.getParameter("city");
           String cno=(String)request.getParameter("cno");
           String password=(String)request.getParameter("password");
           String cpassword=(String)request.getParameter("cpassword");
           String npassword=(String)request.getParameter("npassword");
           String rpassword=(String)request.getParameter("rpassword");
           boolean found=false;
           
           
           
           
           if(vc.equalsIgnoreCase(vr))
           {
           
               com.bean.My m=new com.bean.My();
               java.sql.ResultSet rs=m.showAnyThing("notifymepro","organization","oid",oid);
               
               rs.next();
               
               if(cpassword.equalsIgnoreCase("") && password.equalsIgnoreCase("") && npassword.equalsIgnoreCase("") && rpassword.equalsIgnoreCase(""))
               {
               
               password=rs.getString("password");
               
               }else{
               
                 if(rpassword.equalsIgnoreCase(npassword) && cpassword.equalsIgnoreCase(password) && password.equalsIgnoreCase(rs.getString("password")))
                 {
                //  out.println("now change the password !!!");
                        password=npassword;  
                 }else
                 {
               
               found=true;
                 
                 }
                   
                   
                 }
               
               if(!found)
               {
           
            if(oname.equals(""))
           {oname=rs.getString("oname");}
            if(email.equals(""))
           {email=rs.getString("email");}
           if(cno.equals(""))
           {cno=rs.getString("cno");}
            if(city.equals(""))
           {city=rs.getString("city");}
               
             com.bean.Org b=new com.bean.Org();
             b.setOid(oid);
             
            b.setOname(oname);
            b.setCity(city);
            b.setCno(cno);
            b.setEmail(email);
            b.setPassword(password);
            
            int n=b.updateOrg("notifymepro");
             //  out.println("data are="+n);
                
               
               if(n>0)
               {
                   out.println("<script>alert(\"Updated Account Successfully !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");}else{out.println("<script>alert(\"Sorry,Not Updated Yet  !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
               }
               
               
               
               }else{  out.println("<script>alert(\"Sorry,Password Are  Wrong !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
           } 
                       
                     
           }else
           {
           
           
             out.println("<script>alert(\"Sorry,Verify Code Are Wrong !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
           
           }
    
    
%>