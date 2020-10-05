
<%
            String myproblem=request.getParameter("myproblem");
            String oid=(String)session.getAttribute("oid");
            com.bean.Org o=new com.bean.Org();
             o.setProblem(myproblem);
            //out.println(""+myproblem);
            o.setOid(oid);
            int n=o.updateMyProblem("notifymepro");
            if(n>0)
            {
            
           out.println("<script>alert(\" Added Problem  Sucessfully  !!! \");" +
               "	window.open('myproblem.jsp','_self');" +
               "	</script>");
            
            }else
            {
                     out.println("<script>alert(\" Not Added Problem Yet  !!! \");" +
               "	window.open('myproblem.jsp','_self');" +
               "	</script>");
                    
            }
        
 %>