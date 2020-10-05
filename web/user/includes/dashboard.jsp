
<%@page import="java.sql.ResultSet"%>
<%@page import="com.bean.*"%>
 <%@include  file="header.jsp" %>
 <% int nn=0;
         String oidn=(String)session.getAttribute("oid");
         com.bean.Org on=new com.bean.Org();
         String uidn=(String)session.getAttribute("uid");
         com.bean.Org o1=new  com.bean.Org();
         o1.setUid(uidn);
         java.sql.ResultSet rso1=o1.showOneUser(oidn);
         rso1.next();
         String statuso1=rso1.getString("status");
         %>

<div class="contianer">

 <nav class="navbar  fixed navbar-expand-lg navbar-dark bg-dark ">
  <a class="navbar-brand" href="index.jsp">DASHBOARD</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <p style="text-align:20px;">
    <ul class="navbar-nav " style="padding-left:50%;">
      <li class="nav-item active">
        <a class="nav-link" href=" index.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
	  &nbsp;

     <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  My&nbsp;Profile
        </a>  
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="show.jsp">Show Profile</a>
           <a class="dropdown-item"  href="sendmail.jsp">Change Profile</a>
          
        </div>	  
      </li>
      
        &nbsp;

     <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  My&nbsp;Notices
        </a>  
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <%if(statuso1.equalsIgnoreCase("access")){%>
       <%nn=0;nn=nn=on.count(oidn,"category");if(nn>0){%><a class="dropdown-item" href="addnt.jsp">Add Notices</a><%}%>
           <%}%>
          <a class="dropdown-item" href="shownt.jsp">Show All Notices</a>
          <a class="dropdown-item" href="mynotices.jsp">Show My Notices</a>
 
         
        </div>
      </li>
      
      
      
      
      
      
      
              &nbsp;
       
	   <li class="nav-item ">
        <a class="nav-link" href="mynote.jsp">My&nbsp;Notes <span class="sr-only"></span></a>
      </li>&nbsp;
	   <li class="nav-item ">
        <a class="nav-link" href="myproblem.jsp">My&nbsp;Problem<span class="sr-only"></span></a>
      </li>
	    
    </ul>
  </p>
  </div>
</nav>
</div>
 
 
 
 
 
 
 
 