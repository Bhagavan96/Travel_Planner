<%-- 
    Document   : update1
    Created on : May 23, 2017, 3:32:13 PM
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
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String mobile = request.getParameter("mobile");
    String gender = request.getParameter("gender");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
        Statement stmt = con.createStatement();
        int i = stmt.executeUpdate("update regis set lname='" + lname + "',fname='" + fname + "',email='" + email + "', password='" + password + "', mobile='" + mobile + "', gender='" + gender + "' where email='" + email + "'");
        if (i > 0) {
%>
<script lang="javascript">
    alert("Your profile has been updated!");
    window.location.href = "profile.jsp";
</script>
<%
} else {
%>
<script lang="javascript">
    alert("Your profile has not been updated!");
    window.location.href = "update.jsp";
</script>
<%
        }
    } catch (Exception e) {
        System.out.println(e);
    }
%>