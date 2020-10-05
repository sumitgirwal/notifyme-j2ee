<% 
        String oid=(String)session.getAttribute("oid");
        int nid=Integer.parseInt(request.getParameter("nid"));
          com.bean.Org o=new com.bean.Org();
          o.setId(nid);
        java.sql.ResultSet rs=o.selectOneNT(oid);
        rs.next();
        byte b[]=rs.getBytes("img");
        ServletOutputStream outp=response.getOutputStream();
        outp.write(b);
       





%>
 