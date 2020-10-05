
<%
 String oid2=(String) session.getAttribute("oid");
com.bean.Org c=new com.bean.Org();
 String temp=(String) session.getAttribute("uid");
 String uid2=temp.toUpperCase();
int totaluser=c.count(oid2,"user");
int totalnotices=c.count(oid2,"notices");
int aname=c.count(oid2,"accessor");
int cname=c.count(oid2,"category");


%>

<div class="container">
  <div class="row">
         
                 <div class="col-md-6 col-sm-6 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="show.jsp"> My Profile </a></div>
                         <h3><p style="color:white;"><%=uid2%></h3>
                      </div></div>
      <div class="col-md-4 col-sm-4 col-xs-8">
                <div class="alert alert-sucesses back-widget-set text-center">
                    <div class="pro"><a class="icon fa-4x pro" href="shownt.jsp">My Notices </a></div>
                    <h3><p style="color:white;"><%=totalnotices%> </h3>
                      </div></div>
					
                      <div class="col-md-6 col-sm-6 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="mynote.jsp">My Notes </a></div>
                         <h3><p style="color:white;">  </h3>
                      </div></div>
                      
                        <div class="col-md-4 col-sm-4 col-xs-8">

                      <div class="alert alert-sucesses back-widget-set text-center">
                         <div class="pro"><a class="icon fa-4x pro" href="myproblem.jsp">My Problem</a></div>
                         <h3><p style="color:white;">  </h3>
                      </div></div>
      
       
			 
                  </div>          

                          

  </div>
   </div>
