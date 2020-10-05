 
package com.bean;
 
import java.io.*;
import java.sql.*;
 

public class Org {
    int id;
    String oid,oname,password,email,city,cno,status,problem,notes;
    String uid,fname,lname ;
    String  title,text,aname,cname,dt;
    byte imgdata[]=null;
    Blob fdata;
    Connection con=null;
    PreparedStatement ps;
    ResultSet rs;
    
    
    
    public boolean findPrivilege(String anamea[],String aname)
    {
        boolean b=false;
    try{
    
        for(String a : anamea)
        {
         if(a.equalsIgnoreCase(aname))
         {
         b=true;
         }
        
        }
    }catch(Exception ex){System.out.println(ex);}
    
    
     return b;  
    }
    
     public int updateOrg(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE organization SET oname=?,email=?,city=?,cno=?,password=?  WHERE oid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     
     ps.setString(1,getOname());
    
     ps.setString(2,getEmail());
     ps.setString(3,getCity());
     ps.setString(4,getCno());
     ps.setString(5,getPassword());
   
     ps.setString(6,getOid());
     n=ps.executeUpdate();
     
       
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
    
     public  int updateNotes(String dbname) 
    {
        int n=0;
        try{
        con=getCon(dbname);
        n=con.createStatement().executeUpdate("UPDATE `organization` SET `notes` = '"+getNotes()+"' where oid='"+getOid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return n;
    
    }
    
    public int deleteOrg(String dbname)
    {
        int n=0;
     try
       {
      con=getCon("");
      n=con.createStatement().executeUpdate("DROP DATABASE `"+getOid()+"`;");
      con=getCon(dbname);
      n=con.createStatement().executeUpdate("update organization set status='DISABLED' where oid='"+getOid()+"'")+n;
      con=getCon(dbname);
      n=con.createStatement().executeUpdate("update user set status='DISABLED' where oid='"+getOid()+"'")+n;
      
      
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    }
    
    public ResultSet selectOneNT(String dbname)
    {
     try
       {
     con=getCon(dbname);
     rs=con.createStatement().executeQuery("select * from notices where nid='"+getId()+"'");
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return rs;
    }
    
    public int updateCategory(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE category SET cname=?  WHERE cid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getCname());
     ps.setInt(2,getId());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
     public int deleteCategory(String dbname)
    {
       int n=0;
     try
       {
     con=getCon(dbname);
        n=con.createStatement().executeUpdate("delete from category where cid='"+getId()+"'");
   }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    }
    
    
    
    public int updateAccessor(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE accessor SET aname=?  WHERE aid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getAname());
     ps.setInt(2,getId());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
     public int deleteAccessor(String dbname)
    {
       int n=0;
     try
       {
     con=getCon(dbname);
        n=con.createStatement().executeUpdate("delete from accessor where aid='"+getId()+"'");
   }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    }
     
     public ResultSet showOneAccessor(String dbname)
    {
     try
       {
     con=getCon(dbname);
     rs=con.createStatement().executeQuery("select * from accessor where aid='"+getId()+"'");
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return rs;
    }
    public ResultSet showOneCategory(String dbname)
    {
    
     try
       {
     con=getCon(dbname);
     rs=con.createStatement().executeQuery("select * from category where cid='"+getId()+"'");
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return rs;
    }
    
    public boolean findUser(String dbname)
    {
        
     boolean found=false;
     
    try{ 
      con=getCon(dbname);
      rs=con.createStatement().executeQuery("select * from user where uid='"+getUid()+"'");
      if(rs.next())
      {found=true;}
     }catch(Exception ex){System.out.println(ex);}
     
    
    
      return  found;
    }
    
   
    
    public int  insertUser(String dbname)
    {
    int n=0;
    try{ 
        if(!findUser(dbname))
        {
    con=getCon(dbname);
    String sql="INSERT INTO `user` VALUES (NULL,?,?,?,?,?,?,?,?,?, 'active', 'Not Problem Yet !!!', 'My Notes...,', CURRENT_TIMESTAMP, '0000-00-00 00:00:00.000000');";
    ps=con.prepareStatement(sql);
       
        ps.setString(1,getUid());
        ps.setString(2,getFname());
        ps.setString(3,getLname());
        ps.setString(4,getPassword());
        ps.setString(5,getEmail());
        ps.setString(6,getCity());
        ps.setString(7,getCno());
        ps.setString(8,getAname());
        ps.setString(9,getCname());
        n=ps.executeUpdate();
        }
       con=getCon(oid);
       n= n+con.createStatement().executeUpdate("UPDATE user SET status='active' WHERE uid='"+getUid()+"'");
        
       con=getCon("notifymepro");
      n= n+con.createStatement().executeUpdate("UPDATE user SET status='active',aname='"+getAname()+"',cname='"+getCname()+"' WHERE uid='"+getUid()+"'");
        
    }catch(Exception ex){System.out.println(ex);}
     return n;
    }
    
    public int count(String dbname,String tbname)
    {
    
      int n=0;
     try
       {
     con=getCon(dbname);
      rs=con.createStatement().executeQuery("select * from "+tbname);
     while(rs.next())
     {
      n++;
     }
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    }
    
    
    
    public int insertAname(String dbname)
    {
       int n=0;
     try
       {
     con=getCon(dbname);
     n=con.createStatement().executeUpdate("INSERT INTO `accessor` VALUES (NULL, '"+getAname()+"');");
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    }
    
    
    public int insertCname(String dbname)
    {
       int n=0;
     try
       {
     con=getCon(dbname);
    n=con.createStatement().executeUpdate("INSERT INTO `category` VALUES (NULL, '"+getCname()+"');");
        }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    
    
    
    }
       
    public int deleteNotices(String dbname)
    {
       int n=0;
     try
       {
     con=getCon(dbname);
     n=con.createStatement().executeUpdate("delete from notices where nid="+getId());
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    
    
    
    }
    
     
    public int updateNotices(String dbname,InputStream in)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE notices SET title=?,text=?,aname=?,cname=?,img=?,fname=?,fdata=?,status=?,send='not'  WHERE nid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     
     ps.setString(1,getTitle());
     ps.setString(2,getText());
     ps.setString(3,getAname());
     ps.setString(4,getCname());
     ps.setBytes(5, getImgdata());
     ps.setString(6,getFname());
     ps.setBlob(7,in);
     ps.setString(8,getStatus());
     ps.setInt(9,getId());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
    
    public int  insertNt(String dbname,InputStream in)
    {
    int n=0;
    try{
    con=getCon(dbname);
    String sql="INSERT INTO `notices`  VALUES (NULL,?,?,?,?, 'active','not',?,?,?,CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);";
    ps=con.prepareStatement(sql);
        ps.setString(1,getTitle());
        ps.setString(2,getText());
        ps.setString(3,getAname());
        ps.setString(4,getCname());
        ps.setBytes(5, getImgdata());
        ps.setString(6,getFname());
        ps.setBlob(7,in);
      
        n=ps.executeUpdate();
        
        
        
         
    
    }catch(Exception ex){System.out.println(ex);}
     return n;
    }
    
    
      
    
    public ResultSet getAllNotices(String dbname)
    {
    try
       {
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from notices");
       }catch(Exception ex)
       {System.out.println(ex);}
     return rs;
    }
    
    public ResultSet showCategory(String dbname)
    {
    try
       {
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from category");
       }catch(Exception ex)
       {System.out.println(ex);}
     return rs;
    }
    
    public ResultSet showAccessor(String dbname)
    {
    try
       {
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from accessor");
       }catch(Exception ex)
       {System.out.println(ex);}
     return rs;
    }
    
    public int updateMyProblem(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE organization SET problem=? WHERE oid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getProblem());
     ps.setString(2,getOid());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
    
   public int updateUser(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE user SET fname=?,lname=?,email=?,city=?,cno=?,problem=?,aname=?,cname=?,status=? WHERE uid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getProblem());
     ps.setString(7,getAname());
     ps.setString(8,getCname());
     ps.setString(9,getStatus());
     ps.setString(10,getUid());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
     public  void loadOneUser(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where uid='"+getUid()+"' ");
         while(rs.next())
         {
             setUid(rs.getString("uid"));
             setEmail(rs.getString("email"));
             setCity(rs.getString("city"));
             setCno(rs.getString("cno"));
             setProblem(rs.getString("problem"));
             setFname(rs.getString("fname"));
             setLname(rs.getString("lname"));
             setNotes(rs.getString("notes"));
             setAname(rs.getString("aname"));
             setCname(rs.getString("cname"));
             
         
         }
        }catch(Exception ex){System.out.println(ex);}
     
    
    }
     public  void leadOneAllNoticesData(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from notices where nid='"+getId()+"' ");
         while(rs.next())
         {
             setTitle(rs.getString("title"));
             setText(rs.getString("text"));
             setAname(rs.getString("aname"));
             setCname(rs.getString("cname"));
             setDt(rs.getString("dt"));
             
         
         }
        }catch(Exception ex){System.out.println(ex);}
     
    
    }
     
     
     
     
       public  void loadOrg(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from organization where oid='"+getOid()+"' ");
         while(rs.next())
         {
             setOname(rs.getString("oname"));
             setPassword(rs.getString("password"));
             setCity(rs.getString("city"));
             setCno(rs.getString("cno"));
             setEmail(rs.getString("email"));
             setProblem(rs.getString("problem"));
             setNotes(rs.getString("notes"));
             System.out.println(getProblem());
         
         
         }
        }catch(Exception ex){System.out.println(ex);}
     
    
    } 
     
     
     public  ResultSet showOneNotices(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from notices where nid='"+getId()+"' ");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    } 
     
    
    
    public  ResultSet showOneUser(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where uid='"+getUid()+"' ");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
    
    public  ResultSet showAllUser(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where  status='active'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
     public  ResultSet showAllUserOrg(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where oid='"+getOid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
    
    
    
    public  ResultSet showOneData(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from organization where oid='"+getOid()+"'");
         
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

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    
     
   
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
    
    
    
    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
    
    
    
    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
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
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public byte[] getImgdata() {
        return imgdata;
    }

    public void setImgdata(byte[] imgdata) {
        this.imgdata = imgdata;
    }

    public Blob getFdata() {
        return fdata;
    }

    public void setFdata(Blob fdata) {
        this.fdata = fdata;
    }

    
     
    public Org() {
    }
    
    
}
