<%-- 
    Document   : success1
    Created on : Jun 21, 2017, 3:18:57 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        String destination = (String) session.getAttribute("destination");
        String source = (String) session.getAttribute("source");
        String nme = (String) session.getAttribute("user");
        ResultSet rs = stmt.executeQuery("select * from orders where email='" + email + "' and destination='" + destination + "' and source='" + source + "'");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success Payment</title>
        <style>
            body{
                font-size: 20px; 
                //background-image: url("bck1.jpg");
                background-color: #141414;
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
            table{
                color: white;
                font-family: cursive;
                text-align: center;
                border-color: white;
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
        <div class="pro">
            <h2> Profile </h2>
            <form>
                <table border="2" width=100%>
                    <thead>
                        <tr> <th> Transaction Id </th> 

                            <th> Amount </th> 

                            <th> Mobile</th> 

                            <th> Email </th> 

                            <th> Source </th>  

                            <th> Destination </th> 
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                while (rs.next()) {
                                    out.println("<tr><td>" + rs.getString("txnid") + "</td><td>" + rs.getString("amount") + "</td><td>" + rs.getString("mobile") + "</td><td>" + rs.getString("email") + "</td><td>" + rs.getString("source") + "</td><td>" + rs.getString("destination") + "</td></tr>");
                                }

                            } catch (Exception e) {
                                System.out.println(e);
                            }
                        %>
                    </tbody>
                </table>
            </form>
        </div>
       
    </body>
</html>

