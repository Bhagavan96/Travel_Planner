<%-- 
    Document   : bookcab
    Created on : Jun 21, 2017, 9:25:55 AM
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
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");
    String email = (String)session.getAttribute("email");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

        Statement stmt = con.createStatement();
        int i = stmt.executeUpdate("insert into bookcabs(source,destination,email) values('" + source + "','" + destination + "','" + email + "')");
        ResultSet rs = stmt.executeQuery("select source,destination from bookcabs where email='" + email + "'");
        while (rs.next()) {
%>
<script lang="javascript">
    alert("We reserved a Cab for you!");
     <%
        session.setAttribute("source", rs.getString(1));
        session.setAttribute("destination", rs.getString(2));
    %>
    window.location.href = "paymentmode.jsp";
</script>
<%
        }
    } catch (Exception e) {
        out.print(e);
    }
%>
