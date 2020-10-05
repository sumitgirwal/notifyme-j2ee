    <%

String oid=(String)session.getAttribute("oid");
int aid=Integer.parseInt(request.getParameter("aid"));
String aname=request.getParameter("aname");

session.setAttribute("aid",aid);

%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Organization DashBoard | Edit Accessor</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel= "stylesheet">
    </head>
    <body>
       <%@include file="includes/dashboard.jsp"%>
       <div class="container"><br>
	   <div class="row">
	   <div class="col-md-3 col-md-offset-3 ">
	   </div>
	
	   <div class="col-md-6 col-md-offset-3 ">
	   <br> <br> <br> <br>

                 <div class="alert alert-info" role="alert">
                   <h4 class="alert-heading">Edit Accessor :</h4><hr> 
                 
                               <form method="post"  action="updatea.jsp">
                               <label><b>AID : <%=aid%></b></label><br>
                               <label><b>Accessor Name </b></label><br>
                                   <input type="text" class="form-control" name="aname" placeholder="<%=aname%>"  required  autocomplete="off"><br>
                                       <a class="btn btn-outline-info btn-lg " href="index.jsp" role="button"   >BACK</a> 
                     <a class="btn btn-outline-info btn-lg" href="deletea.jsp?aid=<%=aid%>" role="button"  onclick="return confirm('Are You Sure To Delete Accessor That Deactive All Users ?');" >DELETE</a> 
 
                               <button type="submit" class="btn btn-outline-info btn-lg">
                                UPDATE
                              </button>
                             </form>
                             </div>
							 
							 
        </div>                           
		<div class="col-md-3 col-md-offset-3 ">
		</div>				
						
						
						
         </div>  
					  
         
          

      </div>
	  <br><br><br>
  <%@include file="includes/footer.jsp"%>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.js"></script>
  </body>
</html>













































