<%-- 
    Document   : paymentmode
    Created on : Jun 15, 2017, 12:05:05 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>About</title>
        <style>
            body{
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
                margin-top: 13px;
            }
            .logo{
                margin-left: 525px;
                margin-bottom: 10px;
            }

            .mySlides{
                margin-top: 50px;
                display:none;
                height: 400px;
            }
            table{
                margin-top: 100px;
                color: black;    
            }
            .howit{
                text-align: center;
                color: black;
                text-decoration-line: underline;
                margin-top: 100px;
            }
            h2,p{
                text-align: center;
            }
        </style>
    </head>
    <body>
                <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
        <div class="im">
            <img src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
        </div>
        <div class="topnav" id="myTopnav">
          <% try{
                String nme = (String) session.getAttribute("user");
                          
            %>
             <%if(!(nme.equals("null"))){ %> <a href="dashboard.jsp"> Home</a> <% ;} 
                 else { %> <a href="index.jsp"> Home</a> <% ;} %>
            <a href="about.jsp"> About</a>
            <a href="contact.jsp"> Contact us</a> 
            <div class="wel"> <%if(!(nme.equals("null"))) out.print("Welcome " + nme);%> </div>
            <div class=log>
                <%if(!(nme.equals("null"))){ %> <a href="logout.jsp"> Logout</a> <% ;} 
                 else { %> <a href="index.jsp"> Login</a> <% ;} 
                 }
                 catch(Exception e)
                 {
                     %>
                     <a href="index.jsp"> Home</a>
                     <a href="about.jsp"> About</a>
                     <a href="contact.jsp"> Contact us</a> 
                     <div class=log>
                        
                         <a href="index.jsp"> Login</a>
                     </div>
                     <%
                 }
                 %>  
            </div>
        </div>
        <% String sourc= (String) session.getAttribute("source");
         String dest= (String) session.getAttribute("destination");
        %>
        <p> <% out.print("Welcome " + dest);%></p>
        <p>Your Payment Type</p>
        <form action="">
    <center>
        <input type="radio" value="cash" name="mode" onclick="document.location.href='payment.jsp'"> Cash
            <input type="radio" value="Online Payment" name="mode" onclick="document.location.href='payment.jsp'" > Online Payment
            <!--<input type="radio" name="mode" value="Paytm" onclick="document.location.href='paytm.jsp'" > Paytm-->
    </center>
    
</body>
</html>
