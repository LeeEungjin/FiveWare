<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />


</head>
<body>



<div id="eb_container" >

	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
		<img alt="" src="${url}/resources/images/logo/smallLogo.png">
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap" style=" width: 70%; height: 90%; margin-left: 15%;">
				 
				
					
					
					<img alt="" src="${url}/resources/images/404.png" style="margin-top: 12%; margin-left: 8%;">
					<a href="${pageContext.request.contextPath}/"><img alt="" src="${url}/resources/images/return.png" style="margin-left: 20%; margin-top: 5%;"></a>
		
					      
			 
			 
		
		</div>
	</div>
   </div>


</body>
</html>