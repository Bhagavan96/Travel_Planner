<%-- 
    Document   : bookcab1
    Created on : Jun 21, 2017, 10:05:12 AM
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
    String email = request.getParameter("email");
    //String password=request.getParameter("password");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select source,destination from bookcabs where email='" + email + "'");
        if (rs.next()) {
%>
<script lang="javascript">
    alert("Details Saved!");
    <%
        session.setAttribute("source", rs.getString(1));
        session.setAttribute("destination", rs.getString(2));
    %>
    window.location.href = "paymentmode.jsp";
</script>
<%
    }
    } catch (Exception e) {
        System.out.println(e);
    }

%>

