<%-- 
    Document   : newjsp
    Created on : Jun 13, 2017, 1:51:17 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="wallet.jsp" method="post">
            <%
                String email = (String) session.getAttribute("email");
                String mobile = (String) session.getAttribute("mobile");
            %>
            <table>
                 <tr>                
                    <td><input name="amount" placeholder="Enter the Amount to be Added"/></td>
                </tr> 
                <tr>                
                    <td><input name="email" placeholder="Email address" value="<%= (String) session.getAttribute("email")%>" /></td>
                </tr> 
                <tr>                
                    <td><input name="mobile" placeholder="Mobile" value="<%= (String) session.getAttribute("mobile")%>" /></td>
                </tr> 
                
                <tr>                
                    <td><input type="submit" value="submit"/></td>
                </tr> 
            </table>
        </form>

    </body>
            <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
</html>
