<%-- 
    Document   : success
    Created on : Jun 13, 2017, 2:20:12 PM
    Author     : bhagavan
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
                <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>

        <%
            String txnid = request.getParameter("txnid");
            String amount = request.getParameter("amount");
            String mobile = (String) session.getAttribute("mobile");
            String email = (String) session.getAttribute("email");
            String source = (String) session.getAttribute("source");
            String destination = (String) session.getAttribute("destination");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

                Statement stmt = con.createStatement();
                int i = stmt.executeUpdate("insert into orders(txnid,amount,mobile,email,source,destination) values('" + txnid + "','" + amount + "','" + mobile + "','" + email + "','" + source + "','" + destination + "')");
                if (i > 0) {
        %>
        <script lang="javascript">
            alert("Payment Done! Your ride gets near to you.");
            window.location.href="success1.jsp";
        </script>
        <%                }
            } catch (Exception e) {
                out.print(e);
            }
        %>

    </body>
</html>
