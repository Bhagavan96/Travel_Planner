<%-- 
    Document   : complaint
    Created on : Jun 21, 2017, 8:09:22 PM
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
        ResultSet rs = stmt.executeQuery("select * from feedback");
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
                        <th>How would you rate our Website for its information, ease of use and appearance?</th>
                        <th>Please rate how your Drivers road skills were, did you feel safe and comfortable?</th>
                        <th>When the taxi arrived, how would you rate the taxi cleanliness, driver attitude and presentation in general?</th>
                        <th>Would you travel with Swan Taxis in the future?</th>
                        <th>Would you recommend Swan Taxis to others?</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>

                    <%
                        int i = 0;
                        while (rs.next()) {
                            i++;
                            out.println("<tr><td>" + rs.getString("a1") + "</td><td>" + rs.getString("b1") + "</td><td>" + rs.getString("c1") + "</td><td>" + rs.getString("d1") + "</td><td>" + rs.getString("e1") + "</td><td>" + rs.getString("email") + "</td></tr>");
                        }
                    %>
                <div class="re">
                    <%      out.println("No of Complaints: " + i); %>
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