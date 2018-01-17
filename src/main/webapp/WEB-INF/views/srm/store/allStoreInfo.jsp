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
					
					<c:forEach items="${allStoreList}" var="list">
						<div class="all_store_div">
							<div class="store_title_div">
								<span>&nbsp;[${list.code}]&nbsp;${list.store}</span>
							</div>
							
							<table class="table all_table">
							   	<tr>
							   		<td class="rb" colspan="2">사업자 등록 번호</td>
							   		<td class="rb" colspan="2">${list.storeNum}</td>
							   		
							   		<td class="rb">대표자명</td>
							   		<td class="rb">${list.name}</td>
							   	</tr>
							   	
							   	<tr>
									<td class="rb">주소</td>
									<td class="rb" colspan="5">${list.addr}</td>							   	
							   	</tr>
							   	
							   	<tr>
							   		<td class="rb">이메일</td>
							   		<td class="rb">${list.email}</td>
							   		
							   		<td class="rb">전화번호</td>
							   		<td class="rb">${list.tel}</td>
							   		
							   		<td class="rb">운영 시간</td>
							   		<td class="rb">${list.time}</td>
							   	</tr>
							   	
							   	<tr>
							   		<td class="rb">계좌 정보</td>
							   		<td class="rb" colspan="5">${list.bank}은행 계좌번호 : ${list.account}</td>
							   	</tr>
							  
							 </table>				
						</div>
					</c:forEach>
					
				</div>
			</div>
			
		</div>
			
		<div id="all_store_footer">
		</div>
	
	</div>
</body>
</html>