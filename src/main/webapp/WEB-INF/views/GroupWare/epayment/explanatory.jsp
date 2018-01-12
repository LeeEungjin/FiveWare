<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/GroupWare/epayment/explanatory.css" rel="stylesheet">
 <script src="${url }/resources/SE2/js/HuskyEZCreator.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		// SmartEditor
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			//textarea ID
			elPlaceHolder : "ar_tableTextArea",
			/* 주소 바꿀껏  */
			sSkinURI : "../../resources/SE2/SmartEditor2Skin.html",
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
		$("#savebutton").click(
				function() {
					//id가 smarteditor인 textarea에 에디터에서 대입
					editor_object.getById["contents"].exec(
							"UPDATE_CONTENTS_FIELD", []);

					// 이부분에 에디터 validation 검증

					//폼 submit
					$("#frm").submit();
				})

		//SmartEditorend
	});

</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
			<!-- submenu banner -->
		<div id="fw_subbanner">
			전자결재
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				결재함
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> 미결함 </li>
					<li> 기결함 </li>
					<li> 반려함 </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					발신함
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 기안 상신함</li>
					<li> 임시보관함</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					수신함
				<div class="fw_arrow sub3" >
					
				</div>
			</div>
			
		
</div>
	
<div id="fw_mainwrap">
			<div id="fw_main">
				기안문 작성
			</div>
			
	<div id="ar_explantBtnWrap">
		<div id="ar_explantBtn">
			<input type="button" value="결재선" class="ar_btnStyle" id="ar_signLine">
			<input type="button" value="결재요청" class="ar_btnStyle" id="ar_signLine">
			<input type="button" value="임시저장" class="ar_btnStyle1" id="ar_signLine">
			<input type="button" value="취소" class="ar_btnStyle1" id="ar_signLine">
		</div>
	</div>
	
	<div id="ar_explanTitle">
		사유서
	</div>
	
	<div id="ar_signBoxWrap">
		<div id="ar_signBoxDiv">
				<div id="ar_signText">
					결 <br> 재
				</div>
				<div id="ar_signBoxBasis">
					<div id="ar_signTemp"> 기 안</div>
				</div>
				<!-- for문 돌리기(결재선) -->
				<input type="hidden" name="approval">
				<input type="hidden" name="approvaltemp">
		</div>
	</div>
	
	<div id="ar_signTableWrap">
		<table id="ar_signTable" border="1px">
			<tr>
				<td class="ar_tableTitle">문서번호</td>
				<td class="ar_tableInput">자동채번</td>
				<td class="ar_tableTitle">기안일자</td>
				<td class="ar_tableInput" ><input tyep="text"  name="draftdate" class="ar_draftInput" readonly="readonly" value="오늘날짜"></td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">기안자</td>
				<td class="ar_tableInput"><input tyep="text"  name="draftname" class="ar_draftInput" readonly="readonly" value="session 이름"></td>
				<td class="ar_tableTitle">기안부서</td>
				<td class="ar_tableInput"> <input tyep="text"  name="drafttemp" class="ar_draftInput" readonly="readonly" value="session 부서"></td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">유형</td>
				<td colspan="3" class="ar_tableInput">
				<select name="kind">
					<option value=""></option>
					<option value="지각">지각</option>
					<option value="조퇴">조퇴</option>
					<option value="결근">결근</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">문서제목</td>
				<td colspan="3" class="ar_tableInput"><input type="text" id="ar_docuTitle" name="title"></td>
			</tr>
			
			<tr>
				<td colspan="4" class="ar_tableInput" ><textarea rows="" cols="" id="ar_tableTextArea" name="contents"></textarea> </td>
			</tr>
			
			
		</table>
	</div>
	
	<div id="ar_explantBtnWrap">
		<div id="ar_explantBtn">
			<input type="button" value="결재선" class="ar_btnStyle" id="ar_signLine">
			<input type="button" value="결재요청" class="ar_btnStyle" id="ar_signLine">
			<input type="button" value="임시저장" class="ar_btnStyle1" id="ar_signLine">
			<input type="button" value="취소" class="ar_btnStyle1" id="ar_signLine">
		</div>
	</div>
	
	
</div>
	
</div>

</body>
</html>