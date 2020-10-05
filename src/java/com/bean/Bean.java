 
package com.bean;
import com.nmp.*;
import java.sql.*;
 
public class Bean {
    
    String fname,lname,oid,uid,email,city,cno,status,problem,notes,oname,password,cname,aname,feedback ;
    Connection con=null;
    PreparedStatement ps;
    ResultSet rs;
    
    
    public boolean findUser(String dbname,String tbname,String cid,String cnid,String cemail)
    {
        boolean b=false;
    try{
    con=getCon(dbname);
    rs=con.createStatement().executeQuery("select * from "+tbname+" where "+cid+"='"+cnid+"' and email='"+cemail+"'");
    
        while(rs.next())
        {
        b=true;
        }
        
    }catch(Exception ex){System.out.println(ex);}
    
    
     return b;  
    }
    
    public int  deleteFeedback(int fid)
    {
     int n=0;
    try{
    con=getCon("notifymepro");
    n=con.createStatement().executeUpdate("delete from feedback where fid='"+fid+"'");
    }catch(Exception ex){System.out.println(ex);}
     return n;
    
    
    
    }
    public ResultSet showFeedback()
    {
     int n=0;
    try{
    con=getCon("notifymepro");
    rs=con.createStatement().executeQuery("select * from feedback");
    }catch(Exception ex){System.out.println(ex);}
     return rs;
    
    
    
    }
    
    public int addFeedback(String dbname)
    {
     int n=0;
    try{
    con=getCon(dbname);
    String sql="INSERT INTO `feedback` VALUES (NULL, ?, ?, CURRENT_TIMESTAMP);";
    ps=con.prepareStatement(sql);
        ps.setString(1,getEmail());
        ps.setString(2,getFeedback());
        n=ps.executeUpdate();
    
    }catch(Exception ex){System.out.println(ex);}
     return n;
    
    
    
    }
    
    public Connection getCon(String dbname)
    {
        
     try{
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname,"root","");
     }catch(Exception ex){System.out.println(ex);}
    
      return con;
    }
    
    
    
    
    public static void main(String a[])
   {
       Bean b=new Bean();
       
      
   }
     public ResultSet checkWho2(String dbname,String tblname,String field,String cid,String cemail)
    {
    
    try{
    con=getCon(dbname);
    String sql="select * from "+tblname+" where "+field+"='"+cid+"' and email='"+cemail+"';";
    ps=con.prepareStatement(sql);
    rs=ps.executeQuery();
    
    }catch(Exception ex){System.out.println("Error========="+ex);}
     return rs;
    }
     
   public ResultSet checkWho(String dbname,String tblname,String field,String cid,String cpassword)
    {
    
    try{
    con=getCon(dbname);
    String sql="select * from "+tblname+" where ("+field+"='"+cid+"' and password='"+cpassword+"') and (status='active' or status='pending' or status='admin' or status='access');";
    ps=con.prepareStatement(sql);
    rs=ps.executeQuery();
    
    }catch(Exception ex){System.out.println("Error========="+ex);}
     return rs;
    }
   
   /*public int  insertOrg(String dbname)
    {
    int n=0;
    try{
    con=getCon(dbname);
    String sql="INSERT INTO `organization` VALUES (NULL,?,?,?,?,?,?, 'Panding', 'Not Problem Yet !!!', 'My Notes...,', CURRENT_TIMESTAMP, '0000-00-00 00:00:00.000000');";
    ps=con.prepareStatement(sql);
        ps.setString(1,"org@1");
        ps.setString(2,getOname());
        ps.setString(3,getPassword());
        ps.setString(4,getEmail());
        ps.setString(5,getCity());
        ps.setString(6,getCno());
        n=ps.executeUpdate();
    
    }catch(Exception ex){System.out.println(ex);}
     return n;
    }*/ 
    
    public int  insertOrg(String dbname)
    {
    int n=0;
    try{
    con=getCon(dbname);
    String sql="INSERT INTO `organization` VALUES (NULL,?,?,?,?,?,?, 'Pending', 'Not Problem Yet !!!', 'My Notes...,', CURRENT_TIMESTAMP, '0000-00-00 00:00:00.000000');";
    ps=con.prepareStatement(sql);
        ps.setString(1,getOrgID());
        ps.setString(2,getOname());
        ps.setString(3,getPassword());
        ps.setString(4,getEmail());
        ps.setString(5,getCity());
        ps.setString(6,getCno());
        n=ps.executeUpdate();
    
    }catch(Exception ex){System.out.println(ex);}
     return n;
    }
    
     public int  insertUsers(String dbname)
    {
    int n=0;
    try{
    con=getCon(dbname);
    String sql="INSERT INTO `user` VALUES (NULL,?,?,?,?,?,?,?,?, 'pending', 'Not Problem Yet !!!', 'My Notes...,','Aname','Cname', CURRENT_TIMESTAMP, '0000-00-00 00:00:00.000000');";
    ps=con.prepareStatement(sql);
        ps.setString(1,getOid());
        ps.setString(2,getUid());
        ps.setString(3,getFname());
        ps.setString(4,getLname());
        ps.setString(5,getPassword());
        ps.setString(6,getEmail());
        ps.setString(7,getCity());
        ps.setString(8,getCno());
         
         
        n=ps.executeUpdate();
    
    }catch(Exception ex){System.out.println(ex);}
     return n;
    }
    public int  insertUser(String dbname)
    {
    int n=0;
    try{
    con=getCon(dbname);
    String sql="INSERT INTO `user` VALUES (NULL,?,?,?,?,?,?,?,?, 'pending', 'Not Problem Yet !!!', 'My Notes...,','Aname','Cname', CURRENT_TIMESTAMP, '0000-00-00 00:00:00.000000');";
    ps=con.prepareStatement(sql);
        ps.setString(1,getOid());
        ps.setString(2,getUserID());
        ps.setString(3,getFname());
        ps.setString(4,getLname());
        ps.setString(5,getPassword());
        ps.setString(6,getEmail());
        ps.setString(7,getCity());
        ps.setString(8,getCno());
         
         
        n=ps.executeUpdate();
    
    }catch(Exception ex){System.out.println(ex);}
     return n;
    }
    
    
//    public int  insertUser(String dbname)
//    {
//    int n=0;
//    try{
//    con=getCon(dbname);
//    ps=con.prepareStatement("select * from user",ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
//    rs=ps.executeQuery();
//    rs.moveToInsertRow();
//    rs.updateString(1,"12");
//    rs.updateString(2,getOid());
//    rs.updateString(3,getUserID());
//    rs.updateString(4,getFname());
//   rs.updateString(5,getLname());
//    rs.updateString(6,getPassword());
//    rs.updateString(7,getEmail());
//    rs.updateString(8,getCity());
//   rs.updateString(9,getCno());
//    rs.updateString(10,"Panding");
//    rs.updateString(11,"No Problem Yet !!!");
//    rs.updateString(12,"My Notes");
//   
//    }catch(Exception ex){System.out.println(ex);}
//     return n;
//    }
//    
    public  String getOrgID()
    {
        String temp=null;
        try{
        con=getCon("notifymepro");
        rs=con.createStatement().executeQuery("select max(id) from organization");
        rs.next();
        int n=rs.getInt("max(id)")+1;
        temp=new String("org@"+n);
        
        
        }catch(Exception ex){System.out.println(ex);}
     return temp;
    
    }
    
     public  String getUserID()
    {
        String temp=null;
        try{
        con=getCon("notifymepro");
        rs=con.createStatement().executeQuery("select max(id) from user");
        rs.next();
        int n=rs.getInt("max(id)")+1;
        temp=new String("sg@"+n);
        
        
        }catch(Exception ex){System.out.println(ex);}
     return temp;
    
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

    public String getOname() {
        return oname;
    }

    public void setOname(String oname) {
        this.oname = oname;
    }

    public Bean() {
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
    
    
    
    
    
    
    
}
