<%@page import="com.bean.User"%>
<%
    
           String vr=request.getParameter("vcode");
           String vc=new String(""+session.getAttribute("vcode"));
           String oid=(String)session.getAttribute("oid");
           String uid=(String)session.getAttribute("uid");
           String fname=(String)request.getParameter("fname");
           String lname=(String)request.getParameter("lname");
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
               java.sql.ResultSet rs=m.showAnyThing(oid,"user","uid",uid);
               
               rs.next();
               
               if(cpassword.equalsIgnoreCase("") && password.equalsIgnoreCase("") && npassword.equalsIgnoreCase("") && rpassword.equalsIgnoreCase(""))
               {
               
               password=rs.getString("password");
               
               }else{
               
                 if(rpassword.equalsIgnoreCase(npassword) && cpassword.equalsIgnoreCase(password) && password.equalsIgnoreCase(rs.getString("password")))
                 {
                  //out.println("now change the password !!!");
                        password=npassword;  
                 }else
                 {
               
               found=true;
                 
                 }
                   
                   
                 }
               
               if(!found)
               {
            if(fname.equals(""))
           {fname=rs.getString("fname");}
            if(lname.equals(""))
           {lname=rs.getString("lname");}
            if(email.equals(""))
           {email=rs.getString("email");}
           if(cno.equals(""))
           {cno=rs.getString("cno");}
            if(city.equals(""))
           {city=rs.getString("city");}
               
             com.bean.User b=new com.bean.User();
             b.setUid(uid);
             b.setFname(fname);
            b.setLname(lname);
            b.setCity(city);
            b.setCno(cno);
            b.setEmail(email);
            b.setPassword(password);
            int n=b.updateUser(oid);
              // out.println("data are="+n);
                
               
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
    
    
    
    
  /*  
           String vr=request.getParameter("vcode");
           String vc=new String(""+session.getAttribute("vcode"));
           out.println("vc="+vc+" vr="+vr);
           if(!vc.equalsIgnoreCase(vr))
           { out.println("<script>alert(\" Verify Code Are Wrong !!! \");" +
               "	window.open('index.jsp','_self');" +
              "	</script>");
           
           }else{
               
               
               
           
           String oid=(String)session.getAttribute("oid");
           String uid=(String)session.getAttribute("uid");
           String fname=(String)request.getParameter("fname");
           String lname=(String)request.getParameter("lname");
           String email=(String)request.getParameter("email");
           String city=(String)request.getParameter("city");
           String cno=(String)request.getParameter("cno");
           String password=(String)request.getParameter("password");
           String cpassword=(String)request.getParameter("cpassword");
           String npassword=(String)request.getParameter("npassword");
           String rpassword=(String)request.getParameter("rpassword");
        
           if(password.equalsIgnoreCase(cpassword)){
               
               
           }else{
           User b=new User();
            b.setUid(uid);
            java.sql.ResultSet rs=b.showOneUser(oid);
             rs.next();
            if(fname.equals(""))
           {fname=rs.getString("fname");}
            if(lname.equals(""))
           {lname=rs.getString("lname");}
            if(email.equals(""))
           {email=rs.getString("email");}
           if(cno.equals(""))
           {cno=rs.getString("cno");}
            if(city.equals(""))
           {city=rs.getString("city");}
            
            out.println("<br>"+fname);
            out.println("<br>"+lname);
            out.println("<br>"+email);
            out.println("<br>"+cno);
            out.println("<br>"+city);
            
            
            if(password.equals("") && cpassword.equals("") && npassword.equals("") && rpassword.equals(""))
             {password=rs.getString("password");out.println("in");}
            
            
            
           out.println("<br>newpassword="+password);
           out.println("<br>"+cpassword);
           out.println("<br>"+npassword);
           out.println("<br>"+rpassword);
            
           
            b.setFname(fname);
            b.setLname(lname);
            b.setCity(city);
            b.setCno(cno);
            b.setEmail(email);
            b.setPassword(password);
           int n=b.updateUser(oid);
           out.println(n+""+lname);
           
           
           
      /*   if(n>0)
           {
             out.println("<script>alert(\" Updated Account Sucessfully  !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
           
           }else
           {
                out.println("<script>alert(\"Sorry, Account Not Updated Yet !!! \");" +
               "	window.open('update.jsp','_self');" +
              "	</script>");
           
           
           } 
         
           }
         
           }*/

%>