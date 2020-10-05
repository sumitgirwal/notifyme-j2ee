<%
    String oid=(String)session.getAttribute("oid");
        String oname=(String)session.getAttribute("oname");
String euid=(String)session.getAttribute("uid");
//out.println(euid);
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String cno=request.getParameter("phoneno");
String city=request.getParameter("city");
String email=request.getParameter("email");
String problem=request.getParameter("problem");
 
String status=request.getParameter("status");
String aname=request.getParameter("aname");
String cname=request.getParameter("cname");


com.bean.My b=new com.bean.My();
            b.setUid(euid);
            b.loadOneUser(oid);
            
            if(fname.equals(""))
           {fname=b.getFname();}
            if(lname.equals(""))
           {lname=b.getLname();}
            if(email.equals(""))
           {email=b.getEmail();}
            if(cno.equals(""))
           {cno=b.getCno();}
            if(city.equals(""))
           {city=b.getCity();}
       if(problem.equals(""))
           {problem=b.getProblem();}
              
                 if(status.equals(""))
           {status=b.getStatus();}
                   if(aname.equals(""))
           {aname=b.getAname();}  
                   if(cname.equals(""))
           {cname=b.getCname();}
                
            
            b.setFname(fname);
            b.setLname(lname);
            b.setCity(city);
            b.setCno(cno);
            b.setEmail(email);
             
            b.setProblem(problem);
            b.setStatus(status);
             b.setAname(aname);
             b.setCname(cname);
        
            
           int n=b.updateUser(oid);
             n=b.updateUser("notifymepro")+n;
            // out.println(n+"data are");
          
           if(n>0  )
           {
                 
                  out.println("<script>alert(\" Update Account Sucessfully  !!! \");" +
                "	window.open('edituser.jsp?uid="+euid+"&oid="+oid+"&oname="+oname+" ','_self');" +
               "	</script>");
              
            }else
            {
                out.println("<script>alert(\"Sorry, Account Not Updated  !!! \");" +
               "	window.open('edituser.jsp?uid="+euid+"&oid="+oid+"&oname="+oname+" ','_self');" +
              "	</script>");
           
           
           } 


 
 
%>