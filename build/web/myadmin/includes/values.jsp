
<%
String dbname="notifymepro";   
com.bean.Org c=new com.bean.Org();
int user=c.count(dbname,"user");
int org=c.count(dbname,"organization");
int myadmin=c.count(dbname,"myadmin");
int feedback=c.count(dbname,"feedback");




%>

<div class="container">
  <div class="row">
         
                 <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="showmyadmin.jsp">My Admin </a></div>
                         <h3><p style="color:white;"><%=myadmin%> </h3>
                      </div></div>
                      
      <div class="col-md-4 col-sm-4 col-xs-8">
                <div class="alert alert-sucesses back-widget-set text-center">
                    <div class="pro"><a class="icon fa-4x pro" href="showalluser.jsp">Users </a></div>
                    <h3><p style="color:white;"><%=user%> </h3>
                      </div></div>
					
                      <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="showorg.jsp">Organization </a></div>
                         <h3><p style="color:white;"><%=org%> </h3>
                      </div></div>
                      <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="showrnt.jsp">Recent Notices</a></div>
                         <h3><p style="color:white;"><%=org%> </h3>
                      </div></div>
                    
                      <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="feedback.jsp">Feedback</a></div>
                         <h3><p style="color:white;"><%=feedback%></h3>
                      </div></div>
                      
                        
                       <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="uproblem.jsp">User Problem</a></div>
                         <h3><p style="color:white;"><%=org%> </h3>
                      </div></div>
                      
                  </div>          

                       

  </div>
   </div>
