<%-- 
    Document   : contact
    Created on : May 16, 2017, 1:44:15 PM
    Author     : bhagavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
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
            img{
                margin-left: 525px;
                margin-bottom: 10px;
            }
            input{
                font-family: cursive;
                font-size: 18px;
                width: 300px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border-radius: 8px;
            }
            .cont{
                margin-left: 400px;
            }
            .text{
                font-family: fantasy;
            }
            .b1{
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
            h2{
                font-family: cursive;
                text-align: center;
            }
            #map{
                margin-left: 350px;
                height: 400px;
                width: 800px;
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
         <h2>LOCATION</h2>
        <div id="map"></div>
    <script>
      function initMap() {
        var uluru = {lat: 17.486423, lng: 78.387395};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5dI-JeB5hlI5trGOsDZimHgx24RQnQWE&callback=initMap">
    </script>
    
    <h2> Get in touch with us! </h2>
        <form class="cont" action="conta.jsp" methd="post">
        <table>
            <tr>
                <td><input type="text" name="name" id="nameid" placeholder="Name" required></td>
            
                <td><input type="email" name="email" id="mailid" placeholder="Email address" required></td>
            </tr>
            <tr>
                <td><input type="number" name="mobile" id="mobileid" placeholder="Mobie Number" required></td>
            
                <td> <input type="text" name="message" rows="5" columns="50" placeholder="Message"></td>
            </tr>
            <tr>  
                <td> <input type="submit" class="b1" value="Submit"></td>
            </tr>
        </table>
        </form>
    </body>
</html>
