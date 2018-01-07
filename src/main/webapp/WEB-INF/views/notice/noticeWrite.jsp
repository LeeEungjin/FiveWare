<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set
	value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"
	var="url" />
<c:import url="${url}/resources/temp/ref.jsp" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../resources/SE2/js/HuskyEZCreator.js"></script>
<link href="${url}/resources/css/notice/noticeWrite.css"
	rel="stylesheet">
<script type="text/javascript">
	$(function(){
		//SmartEditor start
		//전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        //textarea ID
        elPlaceHolder: "contents",
        sSkinURI: "../resources/SE2/SmartEditor2Skin.html", 
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
    $("#writeBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    });

		var index = 0;
		var count = 0;
		$("#add").click(function(){
			if(index < 5) {
				var s = '<div id="d'+count+'">';
				s = s+'<input type="file" name="files"><span class="del" title="d'+count+'">X</span></div>';
				$("#files").append(s);
				count++;
				index++;
			}else	{
				alert("더 이상 생성할 수 없습니다.");
			}
		});
		
		$("#files").on("click", ".del", function(){
			var id = $(this).attr("title");
			$("#"+id).remove();
			index--;
		});
		
		
	});
</script>
</head>
<body>
	<c:import url="${url}/resources/temp/headerExample.jsp" />

	<div id="fw_container">

		<div id="login_after_wrap">
			<div id="lofin_after_header">
				<!-- 공지사항 글씨 -->

				<span class="notice_jk_title">공지 사항</span> <span
					class="notice_jk_subTitle">|</span> <span
					class="notice_jk_subTitle">각 부서별 소식을 알려드립니다.</span>

			</div>
			<form action="./noticeWrite" method="POST" name="frm" id="frm" enctype="multipart/form-data">
				<div id="login_after_middle">
					<div id="menu_wrap">
						<div class="notice_jk_tableBox">
							<p class="notice_jk_matters">각 부서별로 부서를 선택하고,<br>
							전달사항 및 공지사항만 올리시기 바랍니다.</p>
						
							<table class="table table-hover" id="notice_jk_table">
								<tr>
									<td>부서</td>
									<td><select name="part">
											<option selected="selected" value="회계부">회계부</option>
											<option value="총무부">총무부</option>
											<option value="인사부">인사부</option>
											<option value="영업/구매부">영업/구매부</option>
											<option value="마케팅부">마케팅부</option>
									</select></td>
									<td>작성자</td>
									<td><input type="text" name="writer" id="writer"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" id="title"></td>
									
								</tr>
								<tr>
									<td id="textarea" colspan="4">
										<div class="notice_jk_textarea">
											
											<textarea id="contents" name="contents" draggable="false">${view.contents}</textarea>
											<!-- 글 내용, contents -->
										</div>
									</td>
								</tr>
								<tr>
									
									<td>첨부파일</td>
									<td colspan="3">
										<input type="button" value="file Add" id="add">
										<div  id="files"></div>
									</td><!-- 추가파일 올릴 수 있게
									배웠던거 이용해서 -->
								</tr>
							</table>
							
								<input type="reset" value="취소" class="btn btn-default"
									id="deleteBtn"><!-- 버튼을 누르면 썼던 내용이 다 사라지게 -->
								<input type="button" value="등록" class="btn btn-default"
									id="writeBtn">
						</div>
					</div>
				</div>
			</form>
			<div id="login_after_footer"></div>
		</div>
	</div>
</body>
</html>