<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
  	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
	<link href="resources/css/sample.css" rel="stylesheet">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Clustering</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 50%;
        width: 50%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
    

	
	
    
  </head>
  <body>
<%-- 
	<c:forEach items="${geoList}" var="list" varStatus="i">
		<c:choose>
			<c:when test="${i.last}">
  		test
  		</c:when>
			<c:otherwise>
				<input type="text" value="${list[0]}" class="lat">
				<input type="text" value="${list[1]}" class="lng">

			</c:otherwise>
		</c:choose>
	</c:forEach> --%>

	<div id="map"></div>
    <script>
     	/* var los =[]
    	var lats = document.getElementsByClassName("lat");
    	var lngs = document.getElementsByClassName("lng");
    	for(var i=0;i<lats.length;i++){
			los.put({"lat": lat[i].value}, {"lng": lng[i].value})
    	}  */
    

	      function initMap() {
	    	  
	
	        var map = new google.maps.Map(document.getElementById('map'), {
	          zoom: 7,
	          center:  {lat: 36.619953, lng: 127.52579} 
	        });
	
	        // Create an array of alphabetical characters used to label the markers.
	        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	
	        // Add some markers to the map.
	        // Note: The code uses the JavaScript Array.prototype.map() method to
	        // create an array of markers based on a given "locations" array.
	        // The map() method here has nothing to do with the Google Maps API.
	        var markers = locations.map(function(location, i) {
	          return new google.maps.Marker({
	            position: location,
	            label: labels[i % labels.length]
	          });
	        });
	
	        // Add a marker clusterer to manage the markers.
	        var markerCluster = new MarkerClusterer(map, markers,
	            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
	      
	      }
	      
	      var locations =${json};
		     

	      
    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script async defer
    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZNIdUdKfeEE30bQNdKCBrGkptE2YuE_U&callback=initMap">
    </script>
  </body>
</html>