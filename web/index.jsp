<%-- 
    Document   : index
    Created on : May 16, 2017, 2:01:43 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
        <style>
            body{
                background-image: url("back.jpg");
                font-size: 20px;   
            }
            .topnav {
                background-color: #990000;
                color: white;
                overflow: hidden;
            }
            .topnav a {
                float: left;
                display: block;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 19px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
            .log{
                float:right;
            }
            .wel{
                float:right;
                text-align: center;
                padding: auto;
                display:block;
            }
            input{
                width: 300px;
                font-family: cursive;
                font-size: 20px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border-radius: 4px;
            }
            img{
                margin-left: 525px;
            }
            .myform{
                margin-left: 200px;
            }
            h2{
                margin-left: 320px;
                //text-align: center;
                color: white;
                margin-top: 100px;
                font-family: Calibri;
            }
            
            .text{
                font-family: fantasy;
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
            }
            
            input::placeholder{
                color:#990000;
            }
            
        </style>
    </head>
    <body>
        <img src="logo3.JPG" alt="logo" style="width:400px;height:150px;">
        <div class="topnav" id="myTopnav">
            <a href="index.jsp"> Home</a>
            <a href="about.jsp"> About</a>
            <a href="contact.jsp"> Contact us</a> 
            
            <div class=log>
                <a href="signup.jsp"> Signup</a>
            </div>
        </div>
        <h2>Login</h2>
        <form class="myform" action="login.jsp" method="post">
            <table>
                <tr> <td> <input type="text" name="email" id="mailid" placeholder="Email Address"> </td> </tr>
                <tr> <td> <input type="password" name="password" id="pwdid" placeholder="Password"> </td> </tr>
                <tr> <td> <input type="submit" class="button" value="Login"> </td> </tr>
            </table>
            
        </form>
    </body>

</html>
