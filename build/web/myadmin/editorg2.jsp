<%
     String myid=(String)session.getAttribute("myid");
    if(myid==null)
    {response.sendRedirect("logout.jsp");}
    
    String oid=(String)session.getAttribute("oid");
 
 
String oname=(String)session.getAttribute("oname");
String cno=request.getParameter("phoneno");
String city=request.getParameter("city");
String email=request.getParameter("email");
String problem=request.getParameter("problem");
String status=request.getParameter("status");
 


com.bean.My b=new com.bean.My();
            b.setOid(oid);
            b.loadOneOrg("notifymepro");
            if(oname.equals(""))
           {oname=b.getOname();}
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
               
                 
          
            b.setOname(oname);
            b.setCity(city);
            b.setCno(cno);
            b.setEmail(email);
            
            b.setProblem(problem);
            b.setStatus(status);
             
        
            
           int n=b.updateOrg("notifymepro");
            // out.println(n+"data are");
         //    out.println(oname+"--"+city+"--"+cno+"--"+email+"--"+status+"--"+problem);
          
     if(n>0 )
           {
                 
                  out.println("<script>alert(\" Update Account Sucessfully  !!! \");" +
                "	window.open('editorg.jsp?oid="+oid+" ','_self');" +
               "	</script>");
              
            }else
            {
                out.println("<script>alert(\"Sorry, Account Not Updated  !!! \");" +
               "	window.open('editorg.jsp?oid="+oid+" ','_self');" +
              "	</script>");
           
           
           } 
 

 


%>