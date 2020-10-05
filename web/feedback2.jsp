<%

  
String email=request.getParameter("email");
String feedback=request.getParameter("feedback");
com.bean.Bean b=new com.bean.Bean();
b.setEmail(email);
b.setFeedback(feedback);
int n=0;
 com.nmp.JEmail e=new com.nmp.JEmail();
       String[] toemail={email+""};
       String text="<html><body><h2>NotifyMe </h2><h4>Thank you for your feedback.</h4></body></html>";
      boolean v=e.EmailCaller(request, toemail,text);
       if(v)
       {
             n= b.addFeedback("notifymepro");
         if(n>0)
            {out.println("<script>alert(\" Sended  Feedback Sucessfully  !!!   \");" +
               "	window.open('index.jsp','_self');" +
              "	</script>");
            }else
            {
                    out.println("<script>alert(\" Sorry, Not Send Yet  !!! \");" +
               "	window.open('feedback.jsp','_self');" +
              "	</script>");  
            }
       }else
            {
                    out.println("<script>alert(\" Sorry, Not Send Yet  !!! \");" +
               "	window.open('feedback.jsp','_self');" +
              "	</script>");  
            } 
 

 out.println(email+"----"+feedback);
out.println("dara are"+n);


%>
