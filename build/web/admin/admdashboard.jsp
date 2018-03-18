<%-- 
    Document   : admdashboard
    Created on : Jun 21, 2017, 3:52:29 PM
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
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");

        Statement stmt = con.createStatement();
        String nme = (String) session.getAttribute("user");
        ResultSet rs = stmt.executeQuery("select * from regis");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .re{
                font-size: 30px;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Cab Router</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="admdashboard.jsp">Registrations</a></li>      
                    <li><a href="transaction.jsp">Payment Transactions</a></li>
                    <li><a href="complaint.jsp">Complaints</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Mobile</th>
                        <th>Gender</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        int i = 0;
                        while (rs.next()) {
                            i++;
                            out.println("<tr><td>" + rs.getString("lname") + "</td><td>" + rs.getString("fname") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("password") + "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("gender") + "</td></tr>");
                        }
                    %>
                <div class="re">
                    <%      out.println("No of registrations: " + i); %>
                </div>
                <%
                    } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
                </tbody>
            </table>
        </div>

    </body>
</html>

