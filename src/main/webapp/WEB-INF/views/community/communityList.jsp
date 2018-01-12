<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${pageContext.request.contextPath}/resources/css/community/community.css" rel="stylesheet">
<title>Insert title here</title>

</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">

	<div id="com_header">
		<div id="com_icon"></div><div id="com_title"></div>	
	</div>
	
	<div id="com_middle">
		<div id="com_sub_title"></div>
		
		<div id="com_contents"></div>
		
		<div id="com_pager"></div>
	</div>
	
	<div id="com_footer">
	</div>

</div>


</body>
</html>