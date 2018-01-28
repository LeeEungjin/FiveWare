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
<link href="${pageContext.request.contextPath}/resources/css/community/communityView.css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		
		var message = '${message}';
		if(message != ""){
			swal(message);
		}
		
		$("#report_btn").click(function(){
			
			var num='${view.num}';
			var names=',${member.code}';
			var writer='${view.writer}'
			
			$.ajax({
				type : "GET",
				url : "reportInsert",
				data : { num : num,
						names : names,
						writer : writer},
				success : function(data){
					swal(data);
					location.reload();
				},error : function(){
					swal("실패");
					location.reload();
				}
			});
		});
		
	});

</script>


</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 
	<div id="fw_container">
	
		<div id="com_header">
			<div id="com_icon"></div><div id="com_title"></div>	
		</div>
		
		<div id="com_middle">
			<div id="com_sub_title"><button id="report_btn" type="button" class="btn btn-danger">신고(${report})</button></div>
			<div id="com_contents">
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
			
		<div id="com_footer">
			<c:forEach items="${view.fileNames}" var="file">
				<P class="comViewImgs">첨부 파일 : <a href="../file/fileDown?filename=${file.fileName}&oriname=${file.oriName}">${file.oriName}</a></P>
			</c:forEach>
			
			<a href="communityList"><button id="comviewBtn1" type="button" class="btn btn-default comViewBtns">목록</button></a>
			<a href="communityDelete?num=${view.num}"><button id="comviewBtn2" type="button" class="btn btn-default comViewBtns">삭제</button></a>
			<a href="communityUpdate?num=${view.num}"><button type="button" id="comviewBtn3" class="btn btn-default comViewBtns com_update_btn">수정</button></a>
		</div>
	
	</div>
</body>
</html>