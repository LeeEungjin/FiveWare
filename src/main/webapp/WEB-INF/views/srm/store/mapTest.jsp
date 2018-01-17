<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${url}/resources/css/srm/allStoreInfo.css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">
</script>

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
					<div id="map_title"></div>
					
					<div id="table_title">
						
					</div>
				</div>
				
				<div id="all_store_map">
				</div>
				
				<div id="all_store_table">
					
				</div>
			</div>
			
		</div>
			
		<div id="all_store_footer">
		</div>
	
	</div>
</body>
</html>