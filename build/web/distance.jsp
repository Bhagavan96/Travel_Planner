<%-- 
    Document   : distance
    Created on : Jun 9, 2017, 10:32:19 AM
    Author     : bhagavan
--%>
<html> 
    <head> 
        <script type="text/javascript">
            function calculatefare() {
                // variable declarations
                var subTotal = 0.0;
                var pricePerFifthMile = 0.50;
                var dropOffCharge = 2.50;
                var overTwoPassengerCharge = 2.00;
                var tripDistance = document.getElementById("distance").value);
                var passengers = document.getElementById("passengers").value);
                // if there are over 2 riders, each additional passenger pays $2 
                if (passengers > 2) {
                    subTotal = overTwoPassengerCharge * (passengers - 2);
                }
            }
            // calculate the price based on miles in
            subTotal += parseInt(tripDistance * 5) * pricePerFifthMile;
            subTotal += dropOffCharge;
            // prints the price to the div. toFixed adds cents to integer calculations
            document.getElementById('price').innerHTML = " $" + subTotal.toFixed(2);
            }</script> 
    </head>
    <body> 
        <h1>Calculate Cab Fare</h1> 
        <form method="post" onsubmit="return calculatefare()">
            <table> 
                <tr>
                    <td> 
                        <input id="distance" type="text" name="distance" placeholder="distance in kms"/> 
                    </td>
                    <td><input id="passengers" type="text" name="passengers" placeholder="no of passengers" />
                    </td>
                    <td>
                        <input type="submit" value="calculate">
                    </td>
                    <td>
                        <div id="price" > </div> 
                    </td>
                </tr> 
            </table> 
        </form>
    </body>
        <%
             if(session.getAttribute("user")==null){
                 String redirectURL="index.jsp";
                 response.sendRedirect(redirectURL);
             
             }
    %>
    
</html>