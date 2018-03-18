<%-- 
    Document   : distance1
    Created on : Jun 9, 2017, 12:20:21 PM
    Author     : bhagavan
--%>
<html>
    <head>
        <title>CAB ROUTER</title>
        <style>
            body{
                font-size: 20px;
                color: #990000;
                //background-color: #141414;
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
                margin-left: 500px;
                margin-bottom: 10px;
            }
            input[type=text]{
                font-family: cursive;
                font-size: 20px;
                width: 300px;
                padding: 12px 20px;
                margin: 8px 0;
                box-sizing: border-box;
                border-radius: 8px;
            }
            input[type=radio]{
                width:50px;
                text-align: center;
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
        </style>
    </head>
    <body>
            <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
            %>
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
                <%if(!(nme.equals("null"))){ %> <a href="index.jsp"> Logout</a> <% ;} 
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
<form action="bookcab.jsp">

        <table border="0" cellpadding="0" cellspacing="3">
            <tr>
                <td colspan="2">

                    <input type="text" id="txtSource" name="source" value="" placeholder="Source Address" style="width: 200px" required />
                    &nbsp; 
                    <input type="text" id="txtDestination" name="destination" value="" placeholder="Destination Address" style="width: 200px" required/>
                    &nbsp; 
                    <input type="button" class="button" value="Get Route" onclick="GetRoute()"/>

                    <div>
                            <input type="submit" class="button" value="Request Cab"/>
                        </form>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="dvDistance">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="dvMap" style="width: 500px; height: 500px">
                    </div>
                </td>
                <td>
                    <div id="dvPanel" style="width: 500px; height: 500px">
                    </div>
                </td>
            </tr>
        </table>
        <p id="dvDistance"> </p>
        <!--<button type="button" onclick="myFunction()">Click Me!</button>-->
        <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyA5dI-JeB5hlI5trGOsDZimHgx24RQnQWE&sensor=false&libraries=places"></script>
        <script type="text/javascript">
    var source, destination;
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    google.maps.event.addDomListener(window, 'load', function () {
        new google.maps.places.SearchBox(document.getElementById('txtSource'));
        new google.maps.places.SearchBox(document.getElementById('txtDestination'));
        directionsDisplay = new google.maps.DirectionsRenderer({'draggable': true});
    });

    function GetRoute() {
        var hyderabad = new google.maps.LatLng(17.3850, 78.4867);
        var mapOptions = {
            zoom: 7,
            center: hyderabad
        };
        map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
        directionsDisplay.setMap(map);
        // directionsDisplay.setPanel(document.getElementById('dvPanel'));

        //*********DIRECTIONS AND ROUTE**********************//
        source = document.getElementById("txtSource").value;
        destination = document.getElementById("txtDestination").value;

        var request = {
            origin: source,
            destination: destination,
            travelMode: google.maps.TravelMode.DRIVING
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });

        //*********DISTANCE AND DURATION**********************//
        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix({
            origins: [source],
            destinations: [destination],
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC,
            avoidHighways: false,
            avoidTolls: false
        }, function (response, status) {
            if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                var distance = response.rows[0].elements[0].distance.text;
                var duration = response.rows[0].elements[0].duration.text;
                document.getElementById("dvDistance").innerHTML = distance;
                var dvDistance = document.getElementById("dvDistance");
                dvDistance.innerHTML = "";
                dvDistance.innerHTML += "Distance: " + distance + "<br />";
                dvDistance.innerHTML += "Duration:" + duration;
                var dist=document.getElementById("dvDistance.distance");
            } else {
                alert("Unable to find the distance via road.");
            }
        });
    }
        </script>

    </body>
</html>