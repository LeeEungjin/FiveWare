<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="resources/css/sample.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/free/replyWrite.css" rel="stylesheet">
<title>Insert title here</title>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(function() {
		
		//SmartEditor start 
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			//textarea ID
			elPlaceHolder : "contents",
			/* 주소 바꿀껏  */
			sSkinURI : "../resources/SE2/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
			}
		});

		//전송버튼 클릭이벤트
		$(".free_reply_btn").click(
			function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
				editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

			//폼 submit
			$("#reply_frm").submit();
		});
		
		var index = 0;
		var count = 0;
		
		$("#reply_file_add").click(function() {
				if (index < 3) {
				var s = '<div class="reply_file_sdiv" id="d'+count+'">';
					s = s+ '<input class="reply_file_sdiv" type="file" name="files"><span class="reply_file_del" title="d'+count+'"><i class="fa fa-close"></i></span></div>';
				
				$("#reply_file_div").append(s);
					count++;
					index++;
				} else {
					swal("파일은 3개까지 업로드 할 수 있습니다.");
				}
		});

		$("#reply_file_add").on("click", ".reply_file_del", function() {
			var id = $(this).attr("title");
			$("#" + id).remove();
			index--;
		});
	});
</script>

</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import>  

	<div id="fw_container">
	
		<div id="reply_header">
			<div id="reply_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			<div id="reply_title">게시판</div>	
		</div>
		
		<form id="reply_frm" action="freeReply" method="post"  enctype="multipart/form-data">
		
		<input type="hidden" name="ref" value="${reply.num}">
		
		<div id="reply_middle">
			<div id="reply_sub_title"></div>
			<div id="reply_contents">
				<table class="table">
				    <thead>
				      <tr>
				      	<th>target</th>
				      	<th><input name="target" type="text" value="${reply.temp}" readonly="readonly" class="form-control reply_write_input"></th>
				      
				        <th>작성자</th>
				        <th><input value="${member.name}" readonly="readonly" name="writer" type="text" class="form-control reply_write_input"></th>
				        
				        <c:if test="${kind eq 'member'}">
				        	<th>부서</th>
				        	<th><input value="${member.temp}" readonly="readonly" name="temp" type="text" class="form-control reply_write_input"></th>
				        </c:if>
				        
				        <c:if test="${kind eq 'store'}">
				        	<th>지점</th>
				        	<th><input value="${member.store}" readonly="readonly" name="temp" type="text" class="form-control reply_write_input"></th>
				        </c:if>
				        
				        
				      </tr>
				      
				      <tr>
				      	<th>제목</th>
				      	<th colspan="3">
				      		<input value="${reply.num}번째 글 - '${reply.title}'의 답글" name="title" type="text" class="form-control reply_write_input">
				      	</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
						<td colspan="8">
							<textarea name="contents" class="reply_textarea" id="contents"></textarea>
						</td>
				      </tr>
				      
				    </tbody>
				 </table>				
			</div>
		</div>
			
		<div id="reply_footer">
			<input type="button"  class="btn btn-default" value="file" id="reply_file_add">
			<div id="reply_file_div"></div>
			<button type="button" class="btn btn-default free_reply_btn">등록</button>
		</div>
		</form>
		
	</div>
</body>
</html>