
<%
 String oid2=(String)session.getAttribute("oid");
com.bean.Org c=new com.bean.Org();

int totaluser=c.count(oid2,"user");
int totalnotices=c.count(oid2,"notices");
int aname=c.count(oid2,"accessor");
int cname=c.count(oid2,"category");


%>

<div class="container">
  <div class="row">
         
                 <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro">
                <%if(aname>0 && cname>0){%>             
                <a class="icon fa-4x pro" href="showuser.jsp">  User </a>
                 <%}else{%>
                <a class="icon fa-4x pro" href="addprivilege.jsp">  Add Privilege </a>
                 <%}%>        
                         
                         </div>
                         <h3><p style="color:white;"><%=totaluser%> </h3>
                      </div></div>
      <div class="col-md-4 col-sm-4 col-xs-8">
                <div class="alert alert-sucesses back-widget-set text-center">
                    <div class="pro"><a class="icon fa-4x pro" href="shownt.jsp">Notices </a></div>
                    <h3><p style="color:white;"><%=totalnotices%> </h3>
                      </div></div>
			
                      <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="show.jsp">My Profile </a></div>
                         <h3><p style="color:white;"><%=oid%> </h3>
                      </div></div>
                      
                      <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="showa.jsp">Accessor </a></div>
                         <h3><p style="color:white;"><%=aname%> </h3>
                      </div></div>
                         <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="uproblem.jsp"> Problems</a></div>
                         <h3><p style="color:white;"><%=totaluser%>  </h3>
                      </div></div>
      
                        <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="showc.jsp">Category</a></div>
                         <h3><p style="color:white;"><%=cname%> </h3>
                      </div></div>
                    
       
			 
                  </div>          

                          

  </div>
   </div>
