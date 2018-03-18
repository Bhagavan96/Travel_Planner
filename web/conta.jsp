<%-- 
    Document   : conta
    Created on : Jun 21, 2017, 8:49:23 AM
    Author     : bhagavan
--%>

<%@page import="java.sql.*"%>
    <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
<%
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String message=request.getParameter("message");
    try
    {
     Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/register","root", "");
     
     Statement stmt=con.createStatement();
     int i=stmt.executeUpdate("insert into contact(name,email,mobile,message) values('"+name+"','"+email+"','"+mobile+"','"+message+"') ");
     if(i>0)
     {
         %>
         <script lang="javascript">
         alert("Details saved will get back to you as soon as possible");
         window.location.href="contact.jsp";
         </script>
         <%
     }
     else
     {
         out.println("Enter the required details");
     }
    }
    catch(Exception e)
    {
        System.out.println(e);
    }
    %>
