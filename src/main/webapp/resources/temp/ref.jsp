<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
 <link href="${url }/resources/css/header/header.css" rel="stylesheet">
  <link href="${url }/resources/css/header/sample.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		var menu = true;
		$("#ej_menu").click(function(){
			if(menu) {
				menu = false;
				$("#ej_sidebar").css("width", "3.35%");
				$("#fw_container").css("width", "96.95%");
				$("#fw_container").css("margin-left", "3.35%");				
				$("#fw_subcontainer").css("#fw_subcontainer", "15%");
				$("#ej_icon_contents").hide();
			} else {
				menu = true;
				$("#ej_sidebar").css("width", "10%");
				$("#fw_container").css("width", "90%");
				$("#fw_container").css("margin-left", "10%");	
				$("#fw_subcontainer").css("#fw_subcontainer", "17%");
				$("#ej_icon_contents").show();
			}
		});
		
		$("#ej_sidebar").css("height", window.innerHeight);
		$("#fw_container").css("height", window.innerHeight);
		$("#fw_subcontainer").css("height", "100%");
	});
	
</script>