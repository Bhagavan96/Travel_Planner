<%-- 
    Document   : about
    Created on : May 24, 2017, 2:24:08 PM
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

        <img class="logo" src="logo3.JPG" alt="Logo" style="width:400px;height:150px;">
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
        <div class="w3-content w3-display-container">
            <img class="mySlides" src="slide1.png" style="width:100%" >
            <img class="mySlides" src="slide4.jpg" style="width:100%">
            <img class="mySlides" src="slide2.jpg" style="width:100%">
            <center>    <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
            <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
            </center> 
        </div>

        <script>
            var slideIndex = 1;
            showDivs(slideIndex);

            function plusDivs(n) {
                showDivs(slideIndex += n);
            }

            function showDivs(n) {
                var i;
                var x = document.getElementsByClassName("mySlides");
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x[slideIndex - 1].style.display = "block";
            }
        </script>
        <h2 class="howit"> How it works</h2>
        <table class="col" width=100% height=100%><tr>
                <td width=30%>
                    <div>
                        <h2> 1. Request </h2>
                        <p>  Tap on <strong>book a cab</strong> option in <br>dashboard to book a cab.<br>
                            Then enter your pickup location, <br>destination location and tap 
                            request—<br>your driver will arrive in minutes.</p>
                    </div>
                </td>
                <td width=33%>
                    <div>
                        <h2> 2. Ride </h2>
                        <p> Your car comes to you. You can view your <br>driver’s contact information
                            and vehicle <br>details in your phone, so you know<br> 
                            you’re getting in the right car.<br>
                            Get to your place safely. 
                        </p>
                    </div>
                </td>
                <td width=33%>
                    <div>
                        <h2> 3. Payment </h2>
                        <p> Pay the amount fare to the driver <br>and go back to your work.<br>
                            We have various payment options<br> like cash, card facility, 
                            net banking, etc. <br> <br>
                        </p>
                    </div>
                </td>
            </tr></table>


    </body>

</html>
