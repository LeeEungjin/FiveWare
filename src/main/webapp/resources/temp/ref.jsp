<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />


 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<<<<<<< HEAD
=======
<<<<<<< HEAD

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link href="${url }/resources/css/header/header.css" rel="stylesheet">
  <link href="${url }/resources/css/header/sample.css" rel="stylesheet">
=======
<<<<<<< HEAD
<<<<<<< HEAD
 
=======
>>>>>>> 779b022b392f5c2a87064be97071d80264e9c55e


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <link href="${url }/resources/css/header/header.css" rel="stylesheet">
  <link href="${url }/resources/css/header/sample.css" rel="stylesheet">
  
   
 <link href="${url }/resources/css/header/sample.css" rel="stylesheet">

 <link href="${url }/resources/css/header/header.css" rel="stylesheet">
  <link href="${url }/resources/css/header/sample.css" rel="stylesheet">


>>>>>>> 92a15b8d6551e5e8e01f796442b7deaa7773f524

<script type="text/javascript">
	$(function() {
		$("#ej_sidebar").css("height", window.innerHeight);
		$("#fw_container").css("height", window.innerHeight);
		$("#fw_mainwrap").css("width", "70%");
		$("#fw_mainwrap").css("margin-left", "1%");
		$("#fw_subcontainer").css("height", "100%");
		
		var menu = true;
		$("#ej_menu").click(function(){
			
			if(menu) {
				menu = false;
				$("#ej_sidebar").css("width", "59px");
				$("#fw_container").css("width", (window.innerWidth - 60)+'px');
				$("#fw_mainwrap").css("width", "84%");
				$("#fw_mainwrap").css("margin-left", "1%");
				$("#fw_container").css("margin-left", "60px");
				$("#fw_subcontainer").css("width", "15%");
				$(".ej_default_img").css("margin-left", "0px");
				$("#ej_icon_contents").hide();
			} else {
				menu = true;
				$("#ej_sidebar").css("width", "195px");
				$("#fw_container").css("width", (window.innerWidth - 195)+'px');
				$("#fw_mainwrap").css("width", "82%");
				$("#fw_container").css("margin-left", "195px");
				$("#fw_subcontainer").css("width", "17%");
				$(".ej_default_img").css("margin-left", "10px");
				$("#ej_icon_contents").show();
			}
		});
		
	});
	
</script>

<!-- sample -->
<script type="text/javascript">

	$(function(){
		
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
	});
</script>