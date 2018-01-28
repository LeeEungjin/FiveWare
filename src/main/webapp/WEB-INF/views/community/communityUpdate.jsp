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
<link href="${pageContext.request.contextPath}/resources/css/community/communityUpdate.css" rel="stylesheet">
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
		$(".com_update_btn").click(
			function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
				editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

			//폼 submit
			$("#com_update_frm").submit();
		});
		
		
		var index = ${fileCount};
		var count = 0;
		
		$("#com_file_add").click(function() {
				if (index < 3) {
				var s = '<div class="com_file_sdiv" id="d'+count+'">';
					s = s+ '<input class="com_file_sdiv" type="file" name="files"><span class="com_file_del" title="d'+count+'"><i class="fa fa-close"></i></span></div>';
				
				$("#com_file_div").append(s);
					count++;
					index++;
				} else {
					swal("파일은 3개까지 업로드 할 수 있습니다.");
				}
		});

		$("#com_file_div").on("click", ".com_file_del", function() {
			var id = $(this).attr("title");
			$("#" + id).remove();
			index--;
		});
		
		//delete
		$(".com_file_del").click(function (){
			var fnum=$(this).attr("title");
			swal("해당 파일이 삭제됩니다.");
			$.post(
					"fileDelete",
					{fnum:fnum},
					function (data) {
						$("#del"+fnum).remove();
						index--;
					});
		});
		
	});
</script>

</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

	<div id="fw_container">
	
		<div id="com_header">
			<div id="com_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			<div id="com_title">공지사항</div>	
		</div>
		
		<form id="com_update_frm" action="communityUpdate" method="POST"  enctype="multipart/form-data">
			<input type="hidden" name="num" value="${update.num}">
			<input type="hidden" name="reg_date" value="${update.reg_date}">
			<input type="hidden" name="writer" value="${update.writer}">
		
		<div id="com_middle">
			<div id="com_sub_title"></div>
			<div id="com_contents">
				<table class="table">
				    <thead>
				      <tr>
				        <th>No</th>
				        <th>${update.num}</th>
				        <th>날짜</th>
				        <th>${update.reg_date}</th>
				        <th>작성자</th>
				        <th>${update.writer}</th>
				      </tr>
				      <tr>
				      	<th>부서</th>
				        <th>
				        	<select name="temp" class="form-control com_temp_select">
						       <option value="회계부">회계부</option>
						       <option value="총무부">총무부</option>
						       <option value="인사부">인사부</option>
						       <option value="영업/구매부">영업/구매부</option>
						       <option value="마케팅부">마케팅부</option>
						    </select>
				        </th>
				      	<th>제목</th>
				      	<th colspan="3">
				      		<input name="title" type="text" class="form-control com_update_input" value="${update.title}">
				      	</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
						<td colspan="6">
							<textarea name="contents" class="com_textarea" id="contents">${update.contents}</textarea>
						</td>
				      </tr>
				      
				    </tbody>
				 </table>				
			</div>
		</div>
			
		<div id="com_footer">
			
			<input type="button"  class="btn btn-default" value="file" id="com_file_add">
			<div id="com_file_div">
				<c:forEach items="${update.fileNames}" var="file">
					<div class="com_file_sdiv" id="${file.fnum }">
					${file.oriName}
					<span class="com_file_del" title="${file.fnum }"><i class="fa fa-close"></i></span>
					</div>
				</c:forEach>
			</div>
			<button type="button" class="btn btn-default com_update_btn">수정</button>
		</div>
		</form>
	</div>
</body>
</html>