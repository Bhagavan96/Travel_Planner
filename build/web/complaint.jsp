<%-- 
    Document   : complaint
    Created on : Jun 21, 2017, 10:07:13 PM
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


<!DOCTYPE html>
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

        <form method="post" action="complaint1.jsp">
            <table>
            <tr>
                <td>How would you rate our Website for its information, ease of use and appearance?</td>
            </tr>
            <tr>
                <td><input type="radio" value="excellent" name="a1" required> Excellent
                    <input type="radio" value="good"  name="a1" required> Good
                    <input type="radio" value="average" name="a1" required> Average
                    <input type="radio" value="poor" name="a1" required> Poor
                </td>
            </tr>
            <tr>
                <td>Please rate how your Drivers road skills were, did you feel safe and comfortable?</td>
            </tr>
            <tr>
                <td><input type="radio" value="excellent" name="b1" required> Excellent
                    <input type="radio" value="good"  name="b1" required> Good
                    <input type="radio" value="average" name="b1" required> Average
                    <input type="radio" value="poor" name="b1" required> Poor
                </td>
            </tr>
            <tr>
                <td>When the taxi arrived, how would you rate the taxi cleanliness, driver attitude and presentation in general?</td>                
            </tr>
            <tr>
                <td><input type="radio" value="excellent" name="c1" required> Excellent
                    <input type="radio" value="good"  name="c1" required> Good
                    <input type="radio" value="average" name="c1" required> Average
                    <input type="radio" value="poor" name="c1" required> Poor
                </td>
            </tr>
            <tr>
                <td>Would you travel with Cab Router in the future?</td>
            </tr>
            <tr>
                <td><input type="radio" value="yes" name="d1" required> Yes
                    <input type="radio" value="no"  name="d1" required> No   
            </tr>
            <tr>
                <td>Would you recommend Cab Router to others?</td>
            </tr>
            <tr>
                <td><input type="radio" value="yes" name="e1" required> Yes
                    <input type="radio" value="no"  name="e1" required> No                  
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"</td>                
            </tr>
            </table>
        </form>
            <%
                } catch (Exception e) {
                System.out.println(e);
                }
                %>
    </body>
        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
             %>
</html>
