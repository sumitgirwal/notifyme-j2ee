<%@include file="header.jsp"%>
<% int nn=0;
         String oidn=(String)session.getAttribute("oid");
         com.bean.Org on=new com.bean.Org();
         %>
 <nav class="navbar  fixed navbar-expand-lg navbar-dark bg-dark ">
  <a class="navbar-brand" href="index.jsp">DASHBOARD</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown" >
    <p style="text-align:10px;  ">
    <ul class="navbar-nav " style="padding-left:40%;">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
       
    <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  My&nbsp;Profile
        </a>  
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="show.jsp">Show Profile</a>
           <a class="dropdown-item"  href="sendmail.jsp">Change Profile</a>
          
        </div>	  
      </li>
      
          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            User
        </a>

        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
       <%nn=0;nn=nn=on.count(oidn,"category");int nn2=0; nn2=on.count(oidn,"accessor");if(nn>0 && nn2>0){%><a class="dropdown-item" href="showuser.jsp">Show User</a><%}else{%><a class="dropdown-item disabled" href="showuser.jsp">Show User</a><%}%>
       
    
        </div>

      </li>
	  
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Notices
        </a>

          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <%nn=0;nn=nn=on.count(oidn,"category");if(nn>0){%><a class="dropdown-item" href="addnt.jsp">Add Notices</a><%}else{%><a class="dropdown-item disabled" href="addnt.jsp">Add Notices</a><%}%>
          <%nn=0;nn=nn=on.count(oidn,"notices");if(nn>0){%><a class="dropdown-item" href="shownt.jsp">Show Notices</a><%}else{%><a class="dropdown-item disabled" href="shownt.jsp">Show Notices</a><%}%>
         
         
         
           
	 
    
        </div>

      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Problems 
        </a>

        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         <a class="dropdown-item" href="myproblem.jsp">Add My Problem </a>
         
         <%nn=0;nn=on.count(oidn,"category"); nn2=0; nn2=on.count(oidn,"accessor");if(nn>0 && nn2>0){%><a class="dropdown-item" href="uproblem.jsp">Show User Problem</a><%}else{%><a class="dropdown-item disabled" href="uproblem.jsp">Show User Problem</a><%}%>
       
       
         
	 
    
        </div>

      </li>
      
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Privilege
        </a>

        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         <a class="dropdown-item" href="addprivilege.jsp">Add Privilege </a>
        <%nn=0;nn=on.count(oidn,"category");if(nn>0){%><a class="dropdown-item" href="showc.jsp">Show Category</a><%}%>
         <%nn=0;nn=on.count(oidn,"accessor");if(nn>0){%><a class="dropdown-item" href="showa.jsp">Show Accessor</a><%}%>
         
    
        </div>

      </li>
      
     <li class="nav-item">
        <a class="nav-link" href="mynote.jsp">My&nbsp;Notes  </a>
      </li>
      
      
      
      
      
       
	  
    </ul>
  </p>
  </div>
</nav>
