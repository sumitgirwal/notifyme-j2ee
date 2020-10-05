    <%

 int nid=Integer.parseInt(request.getParameter("nid"));
 
 String oid=(String)session.getAttribute("oid") ;
   com.bean.Org o=new  com.bean.Org();
   o.setId(nid);
 java.sql.ResultSet rs=o.showOneNotices(oid);
rs.next();
   java.sql.ResultSet rsa=o.showAccessor(oid);
   java.sql.ResultSet rsc=o.showCategory(oid);
String aname[]=rs.getString("aname").split(",");
String cname[]=rs.getString("cname").split(",");
int i=0;
int j=0;
session.setAttribute("nid",nid);
session.setAttribute("oid",oid);



%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Organization DashBoard | Edit Notice</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <div class="container"><br>
	   <div class="row">
	   
	
	   <div class="col-md-12   ">
	   <br> <br> <br> <br>

                 <div class="alert alert-light" role="alert">
                   <h4 class="alert-heading">Edit Notice Info. :</h4><hr> 
                 
                               <form method="post"  action="updatent.jsp" enctype="multipart/form-data">
                                   

                  
                  <div class="row">
      <div class="form-group col-md-6"> 
          <label><b>Notice ID   </b></label><br>
              <input type="text" class="form-control"  placeholder="<%=rs.getString("nid")%>"   readonly="" autocomplete="off"><br>

      </div>
          
       <div class="form-group col-md-6">
      <div class="form-group">
    <label for="exampleFormControlSelect1"><b>Status </b></label>
    
      <%

                String status=rs.getString("status");  
                String value1=null;
                String value2=null;
                 
                
           if(status.equalsIgnoreCase("deactive"))
           {
             value2="ACTIVE"; 
           
             value1="DEACTIVE"; 
               
          }else if(status.equalsIgnoreCase("active"))
           {
             value2="DEACTIVE"; 
            
             value1="ACTIVE"; 
               
          } 
          

            
       
%>
    <select class="form-control" name="status">

      <option value="<%=value1%>"><%=value1%></option>
      <option value="<%=value2%>"><%=value2%></option>
       

    </select>
  </div>
    </div>
         </div>
                  
                  
                                   
                                <label><b>Title </b></label><br>
             <input type="text" class="form-control" name="title" placeholder="<%=rs.getString("title")%>"    autocomplete="off"><br>
           
         <div class="form-group form-check">
  <label><b>Accessor :</b></label>&nbsp; &nbsp;
 <%while(rsa.next())
{ 
  boolean found=o.findPrivilege(aname,rsa.getString("aname"));      
    if(found)
    {%>
    &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=rsa.getString("aname")%>" checked="">
                  <label class="form-check-label" for="exampleCheck1" ><%=(rsa.getString("aname")).toUpperCase()%></label> &nbsp; &nbsp;
     
    
   <% }else{%>
    &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=rsa.getString("aname")%>"  >
                  <label class="form-check-label" for="exampleCheck1" ><%=(rsa.getString("aname")).toUpperCase()%></label> &nbsp; &nbsp;
     
    
    <%}
    
    
}
  %>  </div>               
                  
         <div class="form-group form-check">
  <label><b>Category :</b></label>&nbsp; &nbsp;
 <%while(rsc.next())
{  boolean found=o.findPrivilege(cname,rsc.getString("cname"));      
    if(found)
    {%>
    &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=rsc.getString("cname")%>" checked="">
                  <label class="form-check-label" for="exampleCheck1" ><%=(rsc.getString("cname")).toUpperCase()%></label> &nbsp; &nbsp;
     
    
   <% }else{%>
    &nbsp; &nbsp;<input type="checkbox" class="form-check-input" name="<%=rsc.getString("cname")%>"  >
                  <label class="form-check-label" for="exampleCheck1" ><%=(rsc.getString("cname")).toUpperCase()%></label> &nbsp; &nbsp;
     
    
    <%}
    }
  %>  </div>            
                     
                     
           
   
    <br>
        <div class="row">
      <div class="form-group col-md-6"> 
           <label><b>Selected Image :</b></label> 
          <img src="ImageLoader.jsp?nid=<%=nid%>"  class="card-img-top" style="height: 280px; width: 430px" ><br><br>
         
      </div>
          
       <div class="form-group col-md-6">
         <br>
             <%
                 String fname=rs.getString("fname");
         if(fname.equalsIgnoreCase("not")){ %>    
      <label><b>Selected File :</b> </label> &nbsp;&nbsp; Not Available&nbsp;&nbsp;
      <a class="btn btn-danger btn-group-sm disabled " href="downto.jsp?nid=<%=nid%>" role="button" >Not Selected</a>
      <%}else{%>
      <label><b>Selected File :</b> </label> &nbsp;&nbsp; <%=rs.getString("fname")%>&nbsp;&nbsp;
      <a class="btn btn-danger btn-group-sm " href="downto.jsp?nid=<%=nid%>" role="button" >View File</a>
      <%}%>
      
      
      
      <br><br><br><br>
      <b>Select New Image  :</b> <input type="file" class="form-control-file" name="img"    autocomplete="off"><br><br> <br>
      
      <b> Select New File  :</b>  
       <input type="file" class="form-control-file" name="fdata"    autocomplete="off"> <br><br></div>
         </div>
    <br>
                      
                
        
                     <div class="row">
      <div class="form-group col-md-6"> 

       <label><b>Add Date and Time </b></label><br>
           <input type="text" class="form-control" name="dt" placeholder="<%=rs.getString("regdate")%>"    autocomplete="off" readonly=""><br>
        
      </div>
          
       <div class="form-group col-md-6">
     
       <label><b>Update Date and Time </b></label><br>
           <input type="text" class="form-control" name="dt" placeholder="<%=rs.getString("update")%>"    autocomplete="off" readonly=""><br>
        
    </div>
         </div>
     
        
        
        
          
   
                     
        <br> <label><b>Text </b></label><br>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"  name="text" placeholder="<%=rs.getString("text")%>" ></textarea>    

   <br><br>      
                                           
                                           
                                           
                                       <a class="btn btn-outline-info btn-lg" href="shownt.jsp" role="button">BACK</a> 
                     <a class="btn btn-outline-info btn-lg" href="deletent.jsp?nid=<%=nid%>&oid=<%=oid%>" role="button"  onclick="return confirm('Do You Went To Delete Notice ?');" >DELETE</a> 
 
                               <button type="submit" class="btn btn-outline-info btn-lg">
                                UPDATE
                              </button>                  
     
                     
                             </form>
                             </div>
							 
							 
        </div>                           
		 			
						
						
						
         </div>  
					  
         
          

      </div>
	  <br><br><br>
  <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>













































