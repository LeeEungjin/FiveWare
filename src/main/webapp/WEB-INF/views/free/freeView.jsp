<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="resources/css/sample.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/free/freeView.css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		
		var message = '${message}';
		if(message != ""){
			swal(message);
		}
		
	});

</script>


</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 
	<div id="fw_container">
	
		<div id="free_header">
			<div id="free_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			<div id="free_title">게시판</div>	
		</div>
		
		<div id="free_middle">
			<div id="free_sub_title"></div>
			<div id="free_contents">
				<table class="table">
				    <thead>
				      <tr>
				        <th>No</th>
				        <th>${view.num}</th>
				        <th>날짜</th>
				        <th>${view.reg_date}</th>
				        <th>작성자</th>
				        <th>${view.writer}</th>
				      </tr>
				      <tr>
				      	<th>부서</th>
				        <th> ${view.temp} </th>
				      	<th>제목</th>
				      	<th colspan="3">
				      		${view.title}
				      	</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
						<td colspan="6">
							${view.contents}
						</td>
				      </tr>
				      
				    </tbody>
				 </table>				
			</div>
		</div>
			
		<div id="free_footer">
			<c:forEach items="${view.fileNames}" var="file">
			<p class="freeViewFiles">첨부 파일 : <a href="../file/fileDown?filename=${file.fileName}&oriname=${file.oriName}">${file.oriName}</a></p>
			</c:forEach>
			
			<a href="freeList"><button id="freeViewBtn4" type="button" class="freeViewBtns btn btn-default">목록</button></a>
			<a href="freeReply?num=${view.num}"><button type="button" class="freeViewBtns btn btn-default">답글</button></a>
			<c:if test="${member.name eq view.writer}">
			<a href="freeUpdate?num=${view.num}"><button type="button" class="freeViewBtns btn btn-default free_update_btn">수정</button></a>
			<a href="freeDelete?num=${view.num}"><button type="button" class="freeViewBtns btn btn-default">삭제</button></a>
			</c:if>
		</div>
	
	</div>
</body>
</html>