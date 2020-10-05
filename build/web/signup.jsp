<%
    
String btn=request.getParameter("btn");
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NotifyMe | SignUp</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    <link href="assets/css/signup.css"  rel="stylesheet"> 
    <script  src="assets/js/myjs.js"></script>
    </head>
    <body>
         <%@include file="includes/dashboard.jsp"%> 
       <div class="container">
           <div class="container">
               <%if(btn.equalsIgnoreCase("user")){%>         
  <div class="form">
 
        <div id="signup">   
          <div class="pr"><h3>&nbsp;User Sign Up  </h3></div>
          
          <form action="signup" method="post">
            <div class="table-responsive">
          
      <div class="tab-content">
         <div class="field-wrap"></div>

          
          <div class="field-wrap">
            <label>First Name<span class="req">*</span>   </label>
            <input type="text" name="fname" id="name"  autocomplete="off" required />
          </div>
            <div class="field-wrap">
            <label>
              Last Name<span class="req">*</span>
            </label>
             <input type="text" name="lname" id="name"  autocomplete="off" required />
          </div>
		     

         
       <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
             <input type="password" name="password" id="name"  autocomplete="off" required />
          </div>
         
          
          <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" id="email"  autocomplete="off" required />
            <br>
            <button type="button" class="btn btn-outline-light btn-lg"  onclick="sendMail()">
                Send Verify Code
              </button>
          </div> 
         
          <div class="field-wrap">
            <label>
              Verify Code<span class="req">*</span>
            </label>
            <input type="text" name="vcode" id="name"  autocomplete="off" required />
            
          </div> 
         
         
            

           <div class="field-wrap">
            <label>
              City<span class="req">*</span>
            </label>
            <input type="text" name="city" id="name"  autocomplete="off" required />
          </div> 
        
            <div class="field-wrap">
              <label>
              Contact No.<span class="req">*</span>
              </label>
               <input type="text" name="cno" maxlength="10" id="name"   autocomplete="off" required />
            </div>
         
          <div class="field-wrap">
              <label>
              Org Key If You are Member of organization<span class="req">*</span>
              </label>
               <input type="password" name="oid" id="name"   autocomplete="off"  />
            </div>
         
      <div class="field-wrap">
        
		
      </div>
      
	  
      
     <button type="button" class="btn btn-outline-light btn-lg " onclick="window.location.href='index.jsp'">
             Back
          </button>

          <button type="submit"  name="btn" value="user" class="btn btn-outline-light btn-lg">
             SignUp
          </button>
 </form>
</div>
 
</div>
<%

}
else
{%>

<div class="form">
 
        <div id="signup">   
          <div class="pr"><h3>&nbsp;Organization Sign Up</h3></div>
          
          <form action="signup" method="post">
            <div class="table-responsive">
          
      <div class="tab-content">
         <div class="field-wrap"></div>

          
          <div class="field-wrap">
            <label>Organization Name<span class="req">*</span>   </label>
            <input type="text" name="fname" id="name"  autocomplete="off" required />
          </div>
             

         
       <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
             <input type="password" name="password" id="name"  autocomplete="off" required />
          </div>
         
          
           <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <input type="email" name="email" id="email"  autocomplete="off" required />
            <br>
            <button type="button" class="btn btn-outline-light btn-lg" onclick="sendMail()">
                Send Verify Code
              </button>
          </div> 
         
          <div class="field-wrap">
            <label>
              Verify Code<span class="req">*</span>
            </label>
            <input type="text" name="vcode" id="name"  autocomplete="off" required />
            
          </div> 
         

           <div class="field-wrap">
            <label>
              City<span class="req">*</span>
            </label>
            <input type="text" name="city" id="name"  autocomplete="off" required />
          </div> 
        
            <div class="field-wrap">
              <label>
              Contact No.<span class="req">*</span>
              </label>
               <input type="text" name="cno" maxlength="10" id="name"   autocomplete="off" required />
            </div>
      <div class="field-wrap">
        
		
      </div>
      
	  <button type="button" class="btn btn-outline-light btn-lg " onclick="window.location.href='index.jsp'">
             Back
          </button>

          <button type="submit" value="org" name="btn" class="btn btn-outline-light btn-lg">
             SignUp
          </button>
      
     
 </form>
</div>
</tbody>
</table>
</div>

<%}
%>
         </div>
        
      </div>
      
            </div>
        
      </div>
      
          

      
    <%@include file="includes/footer.jsp"%>
   <script src='assets/js/jquery.js'></script>
<script  src="assets/js/index.js"></script>

  </body>
</html>
