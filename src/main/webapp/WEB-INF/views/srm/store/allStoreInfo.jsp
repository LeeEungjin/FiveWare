<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${url}/resources/css/srm/allStoreInfo.css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">
$(function() {
	
	
	$.ajax({
		type : "GET",
		url : "../srm/store/allStoreList",
		success:function(data){
			console.log(data);
			$("#all_store_table").html(data);
		}
	});
	
});
	

</script>

<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
/*       #map {
        height: 100%;
        width: 100%;
      } */
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>

</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 
	<div id="fw_container">
	
		<div id="all_store_header">
		
			<div id="all_store_icon"></div><div id="all_store_title"></div>	
		</div>
		
		<div id="all_store_middle">
			
			<div id="all_store_blank"></div>
			
			<div id="all_store_contents">
				<div id="all_store_sub_title">
					<div id="map_title"><span class="allStoreTestMargin">전체 지점 위치</span></div>
					
					<div id="table_title"><span class="allStoreTestMargin">전체 지점 정보</span></div>
				</div>
				
				<div id="map" class="all_store_map">
				</div>
				
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
		            label: labels[i % labels.length],
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
				
				
				<div id="all_store_table">
					
					
				</div>
			</div>
			
		</div>
			
		<div id="all_store_footer">
		</div>
	
	</div>
</body>
</html>