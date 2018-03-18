<%-- 
    Document   : cab
    Created on : May 19, 2017, 3:26:21 PM
    Author     : bhagavan
--%>
    <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
             %>
<%@page import="java.sql.*"%>
<%
    String source=request.getParameter("source");
    String destination=request.getParameter("destination");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
        
        Statement stmt=con.createStatement();
       int i=stmt.executeUpdate("insert into bookcabs(source,destination) values('"+source+"','"+destination+"')");
        if(i>0)
        {
            %>
            <script lang="javascript">
            //alert("We booked a cab for you. Have a safe journey");
            window.location.href="payment.jsp";
            </script>
            <%
        }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>
