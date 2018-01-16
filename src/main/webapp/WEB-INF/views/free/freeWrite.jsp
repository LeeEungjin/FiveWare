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
<link href="${pageContext.request.contextPath}/resources/css/free/freeWrite.css" rel="stylesheet">
<title>Insert title here</title>
<script src="../resources/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	$(function() {
		
		$.ajax({
			type : "GET",
			url : "./storeList",
			success:function(data){
				var i=0;
				$(data).each(function(){
					$("#free_store_list").append("<option value="+data[i]+">"+data[i]+"</option>");
					i++;
				});
			}
		});
		
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
		$(".free_write_btn").click(
			function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
				editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

			//폼 submit
			$("#free_frm").submit();
		});
		
		var index = 0;
		var count = 0;
		
		$("#free_file_add").click(function() {
				if (index < 3) {
				var s = '<div class="free_file_sdiv" id="d'+count+'">';
					s = s+ '<input class="free_file_sdiv" type="file" name="files"><span class="free_file_del" title="d'+count+'">X</span></div>';
				
				$("#free_file_div").append(s);
					count++;
					index++;
				} else {
					alert("파일은 3개까지 업로드 할 수 있습니다.");
				}
		});

		$("#free_file_add").on("click", ".free_file_del", function() {
			var id = $(this).attr("title");
			$("#" + id).remove();
			index--;
		});
		
		
	});
</script>

</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

	<div id="fw_container">
	
		<div id="free_header">
			<div id="free_icon"></div><div id="free_title"></div>	
		</div>
		
		<form id="free_frm" action="freeWrite" method="post"  enctype="multipart/form-data">
		
		<div id="free_middle">
			<div id="free_sub_title"></div>
			<div id="free_contents">
				<table class="table">
				    <thead>
				      <tr>
				      	<th>target</th>
				      	
				      	<c:if test="${kind eq 'store'}">
					        <th>
					        	<select name="target" class="form-control free_temp_select">
					        	   <option value="전체">전체공개</option>
							       <option value="회계부">회계부</option>
							       <option value="총무부">총무부</option>
							       <option value="인사부">인사부</option>
							       <option value="영업/구매부">영업/구매부</option>
							       <option value="마케팅부">마케팅부</option>
							    </select>
							    <input value="${member.store}" name="temp" type="hidden">
					        </th>
				        </c:if>
				        
				        <!-- 나중에 전체 지점정보에서 리스트 가져와서 option값으로 뿌려주기 -->
				        <c:if test="${kind eq 'member'}">
					        <th>
					        	<select id="free_store_list" name="target" class="form-control free_temp_select">
							    	<option value="전체">전체공개</option>
							    </select>
							    <input value="${member.temp}" name="temp" type="hidden">
					        </th>
				        </c:if>
				        
				        
				        <th>작성자</th>
				        <th><input value="${member.name}" readonly="readonly" name="writer" type="text" class="form-control free_write_input"></th>
				        
				      	<th>제목</th>
				      	<th colspan="3">
				      		<input name="title" type="text" class="form-control free_write_input">
				      	</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
						<td colspan="6">
							<textarea name="contents" class="free_textarea" id="contents"></textarea>
						</td>
				      </tr>
				      
				    </tbody>
				 </table>				
			</div>
		</div>
			
		<div id="free_footer">
			<input type="button"  class="btn btn-default" value="file" id="free_file_add">
			<div id="free_file_div"></div>
			<button type="button" class="btn btn-default free_write_btn">등록</button>
			<a href="freeList"><button type="button" class="btn btn-default">목록</button></a>
		</div>
		</form>
		
	</div>
</body>
</html>