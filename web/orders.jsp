<%-- 
    Document   : orders
    Created on : May 18, 2017, 11:52:37 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        String email = (String) session.getAttribute("email");
        String nme = (String) session.getAttribute("user");
        ResultSet rs = stmt.executeQuery("select * from orders where email='" + email + "'");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Success Payment</title>
        <style>
            body{
                font-size: 20px; 
                //background-image: url("bck1.jpg");
                background-color: whitet;
            }
            .topnav {
                background-color: #990000;
                color: white;
                overflow: hidden;
                font-family: inherit;
            }
            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color:green;
                color: white;
            }
            .log{
                float:right;
                float:end;
            }
            .wel{
                float: right;
                text-align: center;
                margin-top: 13px;
                padding: auto;
                display:block;
            }
            img{
                margin-left: 500px;
                margin-bottom: 10px;
            }

            h2{
                text-align: center;
                color: white;
                margin-top: 50px;
                text-height: 10px;
            }
            .button{
                background-color: #990000;
                padding: 15px 32px;
                text-align: center;
                border: none;
                text-decoration: none;
                color: white;
                display: inline-block;
                border-radius: 4px;
                font-size: 16px;
                margin-left: 670px;
            }
            .re{
                margin-top: 50px;
                margin-bottom: 30px;
            }
            input::placeholder{
                color:#990000;
            }
            p{
                text-align: center;
                color: white;
            }
            .pro{
                margin-top: 30px;
                border-style: solid;
                border-color: #990000;
            }
            .up{

                border-style: solid;
                border-color: #990000;
            }
        </style>
    </head>
    <body>
        <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        <div class="topnav" id="myTopnav">
            <a href="dashboard.jsp"> Home</a>
            <a href="about.jsp"> About</a>
            <a href="contact.jsp"> Contact us</a>

            <div class="wel"> <% out.print("Welcome " + nme);%> </div>
            <div class=log>
                <a href="loginform.jsp"> Logout</a>

            </div>
        </div>


        <div class="container">
            <table class="table table-striped">
                <thead>
                    <tr> 
                        <th> Transaction Id </th> 

                        <th> Amount </th> 

                        <th> Mobile</th> 

                        <th> Email </th> 

                        <th> Source </th>  

                        <th> Destination </th> 
                </thead>
                <tbody>
                    <%
                        int i = 0;
                        while (rs.next()) {
                            i++;
                            out.println("<tr><td>" + rs.getString("txnid") + "</td><td>" + rs.getString("amount") + "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("source") + "</td><td>" + rs.getString("destination") + "</td></tr>");
                        }%>
                <div class="re">
                    <%      out.println("Number of Rides: " + i);%>
                </div>
                <%
                } catch (Exception e) {
                System.out.println(e);
                }
                %>
            </table>

        </div>
             <div class="feedback">
            <h2>Give your Valuable Feedback</h2>
            <form method="post" action="complaint.jsp">
            <input type="submit" value="Feedback Form">
            </form>
        </div>
    </body>
</html>

