 
package com.nmp;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class signup extends HttpServlet  {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try{
       PrintWriter out = response.getWriter();
       String btn=request.getParameter("btn");
      int vc =Integer.parseInt(request.getParameter("vcode"));
     
      
      HttpSession session =request.getSession();
      int vcode=(Integer)session.getAttribute("vcode");
      if(vcode==vc)
      {
      
      
       if(btn.equalsIgnoreCase("user"))
       {
           
            com.bean.My m=new com.bean.My();
           String oid=request.getParameter("oid");
           
           
           java.sql.ResultSet rs=m.showAnyThing("notifymepro","organization","oid",oid);
           
           if(rs.next() || oid.equalsIgnoreCase("")){
           
           
       String fname=request.getParameter("fname");
       String lname=request.getParameter("lname");
       String password=request.getParameter("password");
       String email=request.getParameter("email");
       String city=request.getParameter("city");
       String cno=request.getParameter("cno");
       
         
      
        com.bean.Bean b=new com.bean.Bean();
       
        
        
       if(oid.equalsIgnoreCase("")){
       oid=new String("self pro");}
       b.setOid(oid);
       b.setFname(fname);
       b.setLname(lname);
       b.setPassword(password);
       b.setEmail(email);
       b.setCity(city);
       b.setCno(cno);
         com.nmp.JEmail e=new  com.nmp.JEmail();
       String[] toemail={email+""};
       boolean found=e.EmailCaller(request, toemail,"Thank you for joining us Your ID :"+b.getUserID());
       System.out.println("Signup founded="+found);
       
       int n=b.insertUser("notifymepro");
       
     
       
       if(n>0)
       {
           
           out.println("<script>alert(\" SignUp  Sucessfully And All Details Send In Your Email  !!! \");" +
               "	window.open('signup.jsp?btn=user','_self');" +
               "	</script>");
       
       
       }
       else{out.println("<script>alert(\" Sorry, Not SignUp Sucessfully  !!! \");" +
               "	window.open('signup.jsp?btn=user','_self');" +
               "	</script>");}
       
       
       }else{out.println("<script>alert(\" Sorry, Organization Key Are Wrong  !!! \");" +
               "	window.open('signup.jsp?btn=user','_self');" +
               "	</script>");}
       
       
       
       }else{
           //Org Codes
           
           
       String oname=request.getParameter("fname");
       String password=request.getParameter("password");
       String email=request.getParameter("email");
       String city=request.getParameter("city");
       String cno=request.getParameter("cno");
    
 
       com.bean.Bean b=new com.bean.Bean();
 
       b.setOname(oname);
       b.setPassword(password);
       b.setEmail(email);
       b.setCity(city);
       b.setCno(cno);
         com.nmp.JEmail e=new  com.nmp.JEmail();
       String[] toemail={email+""};
       boolean found=e.EmailCaller(request, toemail,"Thank you for joining us Your  ID :"+b.getOrgID());
       System.out.println("Signup founded="+found);
       
       int n=b.insertOrg("notifymepro");
        if(n>0)
       {out.println("<script>alert(\"  SignUp  Sucessfully And All Details Send In Your Email  !!!\");" +
               "	window.open('signup.jsp?btn=org','_self');" +
               "	</script>");}
       else{out.println("<script>alert(\" Sorry, Not SignUp Sucessfully  !!! \");" +
               "	window.open('signup.jsp?btn=org','_self');" +
               "	</script>");}
       
      }
       
    }else
    {
    
      out.println("<script>alert(\" Verify Code Are Wrong !!!\");" +
               "	window.open('signup.jsp?btn="+btn+"','_self');" +
               "	</script>");
    
    }
        }catch(Exception ex){System.out.println(ex);}
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
