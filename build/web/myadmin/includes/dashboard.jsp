<%@include file="header.jsp"%>
<% 

int nn=0;
com.bean.My m1=new com.bean.My();
nn=m1.countSelfPro();
 %>
<nav class="navbar  fixed navbar-expand-lg navbar-dark bg-dark ">
  <a class="navbar-brand" href="index.jsp">DASHBOARD</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown" >
    <p style="text-align:20px;  ">
    <ul class="navbar-nav " style="padding-left:28%;">
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

      
      <%if(nn>0){%>
      <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  My&nbsp;Admin
        </a>  
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="showalluser.jsp">Show All User</a>  
          <a class="dropdown-item" href="showmyadmin.jsp">Show My Admin</a>
          
          
        </div>	
          
      </li> <%}%>
      
      
   
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Notices
        </a>

        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         <a class="dropdown-item" href="showrnt.jsp">Recent Notices </a>
         <a class="dropdown-item" href="showorg.jsp">Show Notices</a>
         
	 
    
        </div>

      </li>
       
          <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
           Organization
        </a>

        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="showorg.jsp">Show Organization</a>
         <!-- <a class="dropdown-item" href="searchstudent.jsp">Search User</a>-->
    
        </div>

      </li>
	  
 
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Problems
        </a>

        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
         <a class="dropdown-item" href="myproblem.jsp">Add My Problem </a>
         <a class="dropdown-item" href="uproblem.jsp">Show User Problem</a>
         
	 
    
        </div>

      </li>
      
      
       <li class="nav-item">
        <a class="nav-link" href="feedback.jsp">Feedback   </a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="mynote.jsp">My&nbsp;Notes   </a>
      </li>
        </div>

      </li>
      
       
	  
    </ul>
  </p>
  </div>
</nav>
