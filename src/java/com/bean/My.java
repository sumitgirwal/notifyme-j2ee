 
package com.bean;

 import java.sql.*;
public class My {
      int id;
    String oid,oname,password,email,city,cno,status,problem,notes;
    String uid,fname,lname;
    String  title,text,aname,cname,dt,myid;
    Connection con=null;
    PreparedStatement ps;
    ResultSet rs;
      
    
    public int deleteMyUser(String dbname)
    {
        int n=0;
     try
       {
      con=getCon(dbname);
      n=con.createStatement().executeUpdate("delete from myadmin where myid='"+getUid()+"'");
      n=con.createStatement().executeUpdate("update user set status='DISABLED' where uid='"+getUid()+"'")+n;
      
      
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    }
    
    public int updateMyNotes(String dbname)
    {
       
       int n=0;
     try
       {
     String sql="UPDATE myadmin SET notes=? WHERE myid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getNotes());
     ps.setString(2,getMyid());
     
     n=ps.executeUpdate();
    
      sql="UPDATE user SET notes=? WHERE uid=?";
     con=getCon("notifymepro");
     ps=con.prepareStatement(sql);
     ps.setString(1,getNotes());
     ps.setString(2,getMyid());
     
     n=ps.executeUpdate()+n;
    
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
    
    }
    
    
    public  int countSelfPro() 
    {
          int n=0;
       
        try{
        con=getCon("notifymepro");
        rs=con.createStatement().executeQuery("SELECT * FROM `user` WHERE oid='self pro' ");
      
        while(rs.next())
         {n++;}
        
        }catch(Exception ex){System.out.println("Programmmmmmmmmm"+ex);}
     return n;
    
    }
    
    
    
    
     public  ResultSet showSelfPro() 
    {
       
        try{
        con=getCon("notifymepro");
        rs=con.createStatement().executeQuery("SELECT * FROM `user` WHERE oid='self pro' ");
         
        }catch(Exception ex){System.out.println("Programmmmmmmmmm"+ex);}
     return rs;
    
    }
      public  ResultSet showAnyThing(String dbname,String tbname,String cid,int cnid) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from `"+tbname+"` where `"+cid+"`='"+cnid+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
      public  ResultSet showAnyThing(String dbname,String tbname,String cid,String cnid) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from `"+tbname+"` where `"+cid+"`='"+cnid+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
     
     
   
    public int updateOrgStatus(String dbname)
   {
       int n=0;
     try
       {
     con=getCon("");
      n=con.createStatement().executeUpdate("create   DATABASE IF NOT EXISTS `"+getOid()+"`  ")+n;
      con=getCon(oid);
    n=con.createStatement().executeUpdate("create table IF NOT EXISTS accessor(aid int(3) primary key auto_increment,aname varchar(40))")+n;
     n=con.createStatement().executeUpdate("create table IF NOT EXISTS category(cid int(3) primary key auto_increment,cname varchar(40))")+n;
     n=n+con.createStatement().executeUpdate(" CREATE TABLE IF NOT EXISTS `notices` ( `nid` int(5) primary key auto_increment, `title` varchar(500) NOT NULL, `text` varchar(2000) NOT NULL, `aname` varchar(50) NOT NULL, `cname` varchar(50) NOT NULL, `status` varchar(20) NOT NULL, `send` varchar(10) NOT NULL, `img` longblob NOT NULL, `fname` varchar(100) NOT NULL, `fdata` longblob NOT NULL, `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP )");
     n=n+con.createStatement().executeUpdate(" CREATE TABLE  IF NOT EXISTS `user` ( `id` int(5)  primary key auto_increment, `uid` varchar(10) NOT NULL, `fname` varchar(130) NOT NULL, `lname` varchar(30) NOT NULL, `password` varchar(30) NOT NULL, `email` varchar(60) NOT NULL, `city` varchar(30) NOT NULL, `cno` varchar(15) NOT NULL, `aname` varchar(60) NOT NULL, `cname` varchar(60) NOT NULL, `status` varchar(20) NOT NULL, `problem` varchar(300) NOT NULL, `notes` varchar(2000) NOT NULL, `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP, `update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ) ");
     String sql="UPDATE organization SET status=? WHERE oid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getStatus());
     ps.setString(2,getOid());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
   
    public boolean findUser(String dbname)
    {
        
     boolean found=false;
     
    try{ 
      con=getCon(dbname);
      rs=con.createStatement().executeQuery("select * from myadmin where myid='"+getUid()+"'");
      if(rs.next())
      {found=true;}
     }catch(Exception ex){System.out.println(ex);}
     
    
    
      return  found;
    }
     
    public String getMyAdminId()
    {
    String temp="";
    int n=0; 
    try{
     
     con=getCon("notifymepro");
     rs=con.createStatement().executeQuery("select max(id) from myadmin");
    if(rs.next())
    {
        n=rs.getInt(1);
    }
    n++;
     temp=new String("my@"+n);
    
    
    }catch(Exception ex){System.out.println(ex);}
     return temp;
    }
    
    
     public int updateMyStatus(String dbname)
   {
       int n=0;
     try
       {
      boolean found=findUser(dbname);   
     if(!found)
     {con=getCon(dbname);
    String sql="INSERT INTO `myadmin` VALUES (NULL,?,?,?,?,?,?,?,?,?, 'active', 'Not Problem Yet !!!', 'My Notes...,', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);";
        ps=con.prepareStatement(sql);
        setMyid(getMyAdminId());
        ps.setString(1,getMyid());
        ps.setString(2,getFname());
        ps.setString(3,getLname());
        ps.setString(4,getPassword());
        ps.setString(5,getEmail());
        ps.setString(6,getCity());
        ps.setString(7,getCno());
        ps.setString(8,getAname());
        ps.setString(9,getCname());
        n=ps.executeUpdate();
      sql="UPDATE user SET uid=? WHERE uid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getMyid());
     ps.setString(2,getUid());
      n=ps.executeUpdate()+n;
     setUid(getMyid());
      }
      
     String sql="UPDATE user SET status='active' WHERE uid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getUid());
     n=ps.executeUpdate()+n;
    
       sql="UPDATE myadmin SET status='active' WHERE myid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getUid());
     n=ps.executeUpdate()+n;
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
     
   public  int updateMyProblem(String dbname)
   {
    int n=0;
     try
       {
     con=getCon(dbname);
     n=con.createStatement().executeUpdate("update myadmin set problem='"+getProblem()+"' where myid='"+getMyid()+"'");
     con=getCon(dbname);
     n=con.createStatement().executeUpdate("update user set problem='"+getProblem()+"' where uid='"+getMyid()+"'")+n;
      
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   
   
   
   
   }    
   
    
    public int updateMyAdmin(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE myadmin SET fname=?,lname=?,email=?,city=?,cno=?,status=?,problem=?,password=? WHERE myid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getStatus());
     ps.setString(7,getProblem());
     ps.setString(8,getPassword());
     ps.setString(9,getMyid());
     
     n=ps.executeUpdate();
       sql="UPDATE user SET fname=?,lname=?,email=?,city=?,cno=?,status=?,problem=?,password=? WHERE uid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getStatus());
     ps.setString(7,getProblem());
     ps.setString(8,getPassword());
     ps.setString(9,getMyid());
     
     n=ps.executeUpdate()+n;
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
    
   public int updateNotices(String dbname)
   {
       int n=0;
     try
       {
     
     con=getCon(dbname);
     n=con.createStatement().executeUpdate("update notices set send='SENDED' where nid='"+getId()+"'");
      
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   
   
   
   
   
   }
     public int updateUser(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE user SET fname=?,lname=?,email=?,city=?,cno=?,status=?,problem=?,aname=?,cname=? WHERE uid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getStatus());
     ps.setString(7,getProblem());
     ps.setString(8,getAname());
     ps.setString(9,getCname());   
     ps.setString(10,getUid());
     n=ps.executeUpdate();
     sql="UPDATE user SET fname=?,lname=?,email=?,city=?,cno=?,status=?,problem=?,aname=?,cname=? WHERE uid=?";
     con=getCon("notifymepro");
     ps=con.prepareStatement(sql);
     ps.setString(1,getFname());
     ps.setString(2,getLname());
     ps.setString(3,getEmail());
     ps.setString(4,getCity());
     ps.setString(5,getCno());
     ps.setString(6,getStatus());
     ps.setString(7,getProblem());
     ps.setString(8,getAname());
     ps.setString(9,getCname());   
     ps.setString(10,getUid());
     n=ps.executeUpdate()+n;
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   } 
   public int updateOrg(String dbname)
   {
       int n=0;
     try
       {
     
     String sql="UPDATE organization SET oname=?,email=?,city=?,cno=?,status=?,problem=? WHERE oid=?";
     con=getCon(dbname);
     ps=con.prepareStatement(sql);
     ps.setString(1,getOname());
     ps.setString(2,getEmail());
     ps.setString(3,getCity());
     ps.setString(4,getCno());
     ps.setString(5,getStatus());
     ps.setString(6,getProblem());
     ps.setString(7,getOid());
     n=ps.executeUpdate();
    
       }catch(Exception ex)
       {System.out.println(ex);}
   
    return n;
   }
   public int updateMyOrg(String dbname)
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
    
     public  ResultSet showAllMyAdmin(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from myadmin where myid='"+getMyid()+"'");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
     
     
      
    public  void loadOneUser(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where uid='"+getUid()+"' ");
         while(rs.next())
         {
             setUid(rs.getString("uid"));
             setFname(rs.getString("fname"));
             setLname(rs.getString("lname"));
             setEmail(rs.getString("email"));
             setCity(rs.getString("city"));
             setCno(rs.getString("cno"));
             setPassword(rs.getString("password"));
             setProblem(rs.getString("problem"));
              
        
              
             
         
         }
        }catch(Exception ex){System.out.println(ex);}
     
    
    } 
     
    public  void loadOneAdmin(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from myadmin where myid='"+getMyid()+"' ");
         while(rs.next())
         {
             setUid(rs.getString("myid"));
             setEmail(rs.getString("email"));
             setCity(rs.getString("city"));
             setCno(rs.getString("cno"));
             setStatus(rs.getString("status")); 
             setFname(rs.getString("fname"));
             setLname(rs.getString("lname"));
        
              
             
         
         }
        }catch(Exception ex){System.out.println(ex);}
     
    
    } 
     public  void loadOneOrg(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from organization where oid='"+getOid()+"' ");
         while(rs.next())
         {
             setOid(rs.getString("oid"));
             setEmail(rs.getString("email"));
             setCity(rs.getString("city"));
             setCno(rs.getString("cno"));
             setOname(rs.getString("oname"));
             setStatus(rs.getString("status"));
             setProblem(rs.getString("problem"));
             
              
             
         
         }
        }catch(Exception ex){System.out.println(ex);}
     
    
    } 
     
    public  ResultSet showAllOrganization(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from organization");
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
   public  ResultSet showOneUser(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where uid='"+getUid()+"'");
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
   public  ResultSet sendMailWithUser(String dbname,String acr,String ctr) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user where aname='"+acr+"' and cname='"+ctr+"' ");
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
   public  ResultSet showOneOrg(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from organization where oid='"+getOid()+"'");
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
   
    public  ResultSet showAllUser(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from user");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    public  ResultSet showAccessor(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from accessor");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }public  ResultSet showCategory(String dbname) 
    {
       
        try{
        con=getCon(dbname);
        rs=con.createStatement().executeQuery("select * from category");
         
        }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    }
    
    
    

    public My() {
    }

    public String getMyid() {
        return myid;
    }

    public void setMyid(String myid) {
        this.myid = myid;
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

    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }
    
    
    
    public Connection getCon(String dbname)
    {
        
     try{
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname  ,"root","");
     }catch(Exception ex){System.out.println(ex);}
    
      return con;
    }
    
    
    
}
