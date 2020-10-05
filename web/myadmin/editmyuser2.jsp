<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
String dbname="notifymepro"; 
String uid=(String)session.getAttribute("uid");

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String cno=request.getParameter("phoneno");
String city=request.getParameter("city");
String email=request.getParameter("email");
String problem=request.getParameter("problem");
 
String status=request.getParameter("status");


com.bean.My b=new com.bean.My();
            b.setUid(uid);
            b.loadOneUser(dbname);
            
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
             
           String password=b.getPassword(); 
                 if(status.equals(""))
           {status=b.getStatus();}
                   
            
            b.setFname(fname);
            b.setLname(lname);
            b.setCity(city);
            b.setCno(cno);
            b.setEmail(email);
            b.setPassword(password);
            b.setProblem(problem);
            b.setStatus(status);
            b.setMyid(uid);
            
           int n=b.updateMyAdmin(dbname);
          
             //out.println(n+"data are status="+status);
          
      if(n>0)
           {
                 
                  out.println("<script>alert(\" Update Account Sucessfully  !!! \");" +
                "	window.open('editmyuser.jsp?uid="+uid+"','_self');" +
               "	</script>");
              
            }else
            {
                out.println("<script>alert(\"Sorry, Account Not Updated  !!! \");" +
               "	window.open('editmyuser.jsp?uid="+uid+" ','_self');" +
              "	</script>");
           
           
           } 

 
 


%>