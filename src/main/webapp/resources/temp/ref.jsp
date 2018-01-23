<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="${url}/resources/js/jquery-3.1.1.min.js"></script>
	<script src="${url}/resources/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${url}/resources/css/common/bootstrap.min.css">
	<link rel="stylesheet" href="${url}/resources/css/common/bootstrap-theme.min.css">
	<script type="text/javascript" src='${url}/resources/js/sweetalert.min.js?ver=1'></script>
	<link rel="stylesheet" type="text/css" href='${url}/resources/css/common/sweetalert.css?ver=1.2'>

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="${url}/resources/css/header/header.css" rel="stylesheet">
	<link href="${url}/resources/css/header/sample.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$('[data-toggle="tooltip"]').tooltip();
		
		/* $("#ej_sidebar").css("height", window.innerHeight);
		$("#fw_container").css("height", window.innerHeight);
		$("#fw_container").css("width", (window.innerWidth)-(230+'px'));
		$("#fw_mainwrap").css("width", "70%");
		$("#fw_mainwrap").css("margin-left", "1%");
		$("#fw_subcontainer").css("height", "100%"); */
		$("#ej_sidebar").css("height", window.innerHeight);
		$("#fw_container").css("height", window.innerHeight);
		
		/* $("#ej_sidebar").css("width", "195px");
		$("#fw_container").css("width", (window.innerWidth - 195)+'px');
		$("#fw_mainwrap").css("width", "82%");
		$("#fw_container").css("margin-left", "195px");
		$("#fw_subcontainer").css("width", "17%");
		$(".ej_default_img").css("margin-left", "10px");
		$("#fw_mainwrap").css("margin-left", "1%");
		$("#ej_icon_contents").show(); */
		
		$("#ej_sidebar").css("width", "59px");
		$("#fw_container").css("width", (window.innerWidth - 60)+'px');
		$("#fw_mainwrap").css("width", "82%");
		$("#fw_mainwrap").css("margin-left", "1%");
		$("#fw_container").css("margin-left", "60px");
		$("#fw_subcontainer").css("width", "15%");
		$(".ej_default_img").css("margin-left", "0px");
		$("#ej_icon_contents").hide();
		
		var menu = true;
		$("#ej_menu").click(function(){
			
			if(menu) {
				menu = false;
				$("#ej_sidebar").css("width", "59px");
				$("#fw_container").css("width", (window.innerWidth - 60)+'px');
				$("#fw_mainwrap").css("width", "82%");
				$("#fw_mainwrap").css("margin-left", "1%");
				$("#fw_container").css("margin-left", "60px");
				$("#fw_subcontainer").css("width", "15%");
				$(".ej_default_img").css("margin-left", "0px");
				$("#ej_icon_contents").hide();
			} else {
				menu = true;
				$("#ej_sidebar").css("width", "195px");
				$("#fw_container").css("width", (window.innerWidth - 195)+'px');
				$("#fw_mainwrap").css("width", "81%");
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