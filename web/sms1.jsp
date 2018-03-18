<%-- 
    Document   : sms1
    Created on : Jun 9, 2017, 3:52:49 PM
    Author     : bhagavan
--%>

<html>
    <body>
        
        
        <form action="sendsms1.jsp" method="post">
               
    Number:
    <input type="number" name="number"><br>
    
        Message:
    <input type="text" name="MSG"><br>
    
    <input type="submit" value="submit">
        </form>
 </body>
         <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
    
    
</html>