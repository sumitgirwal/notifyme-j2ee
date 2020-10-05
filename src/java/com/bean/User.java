 
package com.bean;

import java.sql.*;
 
public class User {
    
    String fname,lname,oid,uid,email,city,cno,status,problem,notes,oname,password,acr,ctr;
    Connection con=null;
    PreparedStatement ps;
    ResultSet rs;
    int nid;
   
    
     public  int deleteUser(String dbname) 
    {
        int n=0;
        try{
        con=getCon(dbname);
        n=con.createStatement().executeUpdate("delete from user where uid='"+getUid()+"'");
        con=getCon("notifymepro");
        n=n+con.createStatement().executeUpdate("update user set  status='DISABLED'  WHERE uid='"+getUid()+"'");
        
         
        }catch(Exception ex){System.out.println(ex);}
     return n;
    
    }
    
    
   public int updateUserStatus(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="update user set  status='DISABLED'  WHERE uid='"+getUid()+"'";
     con=getCon(dbname);
      n=con.createStatement().executeUpdate(sql);
    
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
    
    
     public int updateUser(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE user SET fname=?,lname=?,email=?,city=?,cno=?,password=?  WHERE uid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getPassword());
   
     ps.setString(7,getUid());
     n=ps.executeUpdate();
     
       sql="UPDATE user SET fname=?,lname=?,email=?,city=?,cno=?,password=?  WHERE uid=?";
     con=getCon("notifymepro");
     ps=con.prepareStatement(sql);
     
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getPassword());
   
     ps.setString(7,getUid());
     n=ps.executeUpdate()+n;
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    public  ResultSet showAccessor(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from accessor");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    public  ResultSet showCategory(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from category");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
    
    
    
    public Connection getCon(String dbname)
    {
        
     try{
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname  ,"root","");
     }catch(Exception ex){System.out.println(ex);}
    
      return con;
    }
    
    public  ResultSet showNotices(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from notices ");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
    
    public  ResultSet showOneNotices(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from notices where nid='"+getNid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
    
    
    
    
    public  int updataNotes(String dbname) 
    {
        int n=0;
        try{
        con=getCon(dbname);
        n=con.createStatement().executeUpdate("UPDATE `user` SET `notes` = '"+getNotes()+"' where uid='"+getUid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return n;
    
    }
    
    //UPDATE `user` SET `problem` = 'not problem yet !!!a' WHERE `user`.`id` = 1;
    public  int updataProblem(String dbname) 
    {
        int n=0;
        try{
        con=getCon(dbname);
        n=con.createStatement().executeUpdate("UPDATE `user` SET `problem` = '"+getProblem()+"' where uid='"+getUid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return n;
    
    }
    
    
    
    
     public  ResultSet showOneUser(String dbname) 
    {
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where uid='"+getUid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getAcr() {
        return acr;
    }

    public void setAcr(String acr) {
        this.acr = acr;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getCtr() {
        return ctr;
    }

    public void setCtr(String ctr) {
        this.ctr = ctr;
    }

    public User() {
    }

    public int getNid() {
        return nid;
    }

    public void setNid(int nid) {
        this.nid = nid;
    }
    
    
    
    
    
    
    
}
