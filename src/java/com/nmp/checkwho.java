/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nmp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author home
 */
public class checkwho extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         PrintWriter out = response.getWriter();
         String btn="";
         try {
            response.setContentType("text/html;charset=UTF-8");
           
            String cid=request.getParameter("uid");
            String cpassword=request.getParameter("password");
            boolean founded=false;
            com.bean.Bean b=new com.bean.Bean();
            HttpSession session=request.getSession();
                
            ResultSet rs1=b.checkWho("notifymepro","user", "uid", cid,cpassword);
            ResultSet rs2=b.checkWho("notifymepro","organization", "oid", cid,cpassword);
            ResultSet rs3=b.checkWho("notifymepro","myadmin", "myid", cid,cpassword);
               if(rs3.next())
            {
                
                
                 String status=rs3.getString("status");
                if(status.equalsIgnoreCase("pending"))
                {
                        btn="pending";    
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
                if(status.equalsIgnoreCase("pending"))
                {
                        btn="pending";    
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
                if(status.equalsIgnoreCase("pending"))
                {
                        btn="pending";    
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
             
            
            
            
        } catch (SQLException ex) {
        out.println(ex);
        }
         
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
