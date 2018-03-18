<%-- 
    Document   : samplemaps
    Created on : May 21, 2017, 6:58:05 PM
    Author     : bhagavan    
--%>
<html>
  
    <head>
          <title>Sample Maps</title> 
          <style>
               #map {
                height: 400px;
                width: 800px;
            }
            /* Optional: Makes the sample page fill the window. */
            html, body {
                //height:100%;
                margin: 0;
                padding: 0;
            }
            #description {
                font-family: Roboto;
                font-size: 15px;
                font-weight: 300;
            }

            #infowindow-content .title {
                font-weight: bold;
            }

            #infowindow-content {
                display: none;
            }

            #map #infowindow-content {
                display: inline;
            }

            .pac-card {
                margin: 10px 10px 0 0;
                border-radius: 2px 0 0 2px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                outline: none;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
                background-color: #fff;
                font-family: Roboto;
            }

            #pac-container {
                padding-bottom: 12px;
                margin-right: 12px;
            }

            .pac-controls1 {
                display: inline-block;
                padding: 5px 11px;
            }

            .pac-controls1 label {
                font-family: Roboto;
                font-size: 13px;
                font-weight: 300;
            }

            #pac-input {
                background-color: #fff;
                font-family: Roboto;
                font-size: 15px;
                font-weight: 300;
                margin-left: 12px;
                padding: 0 11px 0 13px;
                text-overflow: ellipsis;
                width: 400px;
            }

            #pac-input:focus {
                border-color: #4d90fe;
            }

            #title {
                color: #fff;
                background-color: #4d90fe;
                font-size: 25px;
                font-weight: 500;
                padding: 6px 12px;
            }
            #target {
                width: 345px;
            }


          </style>
    </head>
    <body>
<h2> Book a Cab </h2>
            <form class="bookcab" action="cab.jsp" method="post">
                <table>
                    <tr>
                         <td><input id="pac-input" name="source" class="controls1" type="text" placeholder="Source Address"></td>
                    </tr>   
                    <div id="map1"></div>
                    <script>
                        // This example adds a search box to a map1, using the Google Place Autocomplete
                        // feature. People can enter geographical searches. The search box will return a
                        // pick list containing a mix of places and predicted search terms.

                        // This example requires the Places library. Include the libraries=places
                        // parameter when you first load the API. For example:
                        // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

                        function initAutocomplete() {
                            var map1 = new google.maps.Map(document.getElementById('map1'), {
                                center: {lat: 20.5937, lng: 78.9629},
                                zoom: 13,
                                mapTypeId: 'roadmap'
                            });

                            // Create the search box and link it to the UI element.
                            var input = document.getElementById('pac-input');
                            var searchBox = new google.maps.places.SearchBox(input);
                            map1.controls1[google.maps.ControlPosition.TOP_LEFT].push(input);

                            // Bias the SearchBox results towards current map's viewport.
                            map1.addListener('bounds_changed', function () {
                                searchBox.setBounds(map1.getBounds());
                            });

                            var markers = [];
                            // Listen for the event fired when the user selects a prediction and retrieve
                            // more details for that place.
                            searchBox.addListener('places_changed', function () {
                                var places = searchBox.getPlaces();

                                if (places.length == 0) {
                                    return;
                                }

                                // Clear out the old markers.
                                markers.forEach(function (marker) {
                                    marker.setMap(null);
                                });
                                markers = [];

                                // For each place, get the icon, name and location.
                                var bounds = new google.maps.LatLngBounds();
                                places.forEach(function (place) {
                                    if (!place.geometry) {
                                        console.log("Returned place contains no geometry");
                                        return;
                                    }
                                    var icon = {
                                        url: place.icon,
                                        size: new google.maps.Size(71, 71),
                                        origin: new google.maps.Point(0, 0),
                                        anchor: new google.maps.Point(17, 34),
                                        scaledSize: new google.maps.Size(25, 25)
                                    };

                                    // Create a marker for each place.
                                    markers.push(new google.maps.Marker({
                                        map: map1,
                                        icon: icon,
                                        title: place.name,
                                        position: place.geometry.location
                                    }));

                                    if (place.geometry.viewport) {
                                        // Only geocodes have viewport.
                                        bounds.union(place.geometry.viewport);
                                    } else {
                                        bounds.extend(place.geometry.location);
                                    }
                                });
                                map1.fitBounds(bounds);
                            });
                        }

                    </script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5dI-JeB5hlI5trGOsDZimHgx24RQnQWE&libraries=places&callback=initAutocomplete"
                    async defer></script>
                    
                    
                        <td> <input type="submit" class="b1" value="Book Cab"</td>
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









