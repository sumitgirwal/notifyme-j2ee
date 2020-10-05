<%
              String notes=request.getParameter("mynotes");
              String oid=(String)session.getAttribute("oid");
              
   
          //  out.println("notes:"+notes+"---"+oid);
           com.bean.Org o=new com.bean.Org();
            o.setOid(oid);
            o.setNotes(notes);
           int n=o.updateNotes("notifymepro");
       //   out.println("data are :"+n);
            if(n>0)
            {
           
             out.println("<script>" +
               "	window.open('mynote.jsp','_self');" +
              "	</script>");
            
            }else
            {
                    out.println("<script>alert(\" Sorry, Not Updated Yet  !!! \");" +
               "	window.open('mynote.jsp','_self');" +
              "	</script>");  
                    
            }
        
 %>