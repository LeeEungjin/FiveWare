<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <script src="${url }/resources/SE2/js/HuskyEZCreator.js"></script>
 
 <link href="${url}/resources/css/srm/contest/contestWrite.css" rel="stylesheet">

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
	$(".ar_signAsk").click(
			function() {
				
				var num = document.getElementsByClassName("ar_draftrank").length;
				
				//id가 smarteditor인 textarea에 에디터에서 대입
				editor_object.getById["ar_tableTextArea"].exec(
						"UPDATE_CONTENTS_FIELD", []);

				// 이부분에 에디터 validation 검증

				//폼 submit
				if($(".ar_startDate").val()==""){
					alert("시작일을 선택하세요");
				}else if($(".ar_endDate").val()==""){
					alert("마감일을 선택하세요.");
				}else if($("#ar_docuTitle").val()==""){
					alert("공모명을 입력하세요.");
				}else if($("#ar_tableTextArea").val()==""){
					alert("상세설명을 입력하세요.");
				}else if($("#ar_tableTextArea2").val()==""){
					alert("부상을 입력하세요.");
				}else{
					
					$("#frm").submit();
				}
				
			});
	
	var i = 0;	
	$("#ar_fileInsert").click(function(){
		
		var add = "<div id=ar_ff"+i+" class=ar_ffWrap>";
		add =add+ " <input type='file' class='epaymentFile' name='oriname' id='ar_fileInsert' >";
		add=add+"<input type=hidden name='filename' value='test'><span id='aa' class='ar_filedeleted' title='ar_ff"+i+"'>X</span>";
		add= add+"</div>";
		
		
		
		var num = document.getElementsByClassName("epaymentFile").length;
		
		if(num==3){
			alert("파일은 최대 3개까지 가능합니다.");
			
		}else{
			$("#ar_fileWrap").append(add);
			i++;
		}
		
	});
	
	$("#ar_fileWrap").on("click", ".ar_filedeleted", function(){
		var i = $(this).attr("title");
		
		$("#"+i).remove();
	});
});
</script>

</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
	 <!-- submenu menu -->
         	<div id="fw_subbanner">
			이벤트 & 공모전
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				이벤트
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> 이벤트 등록 </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu  fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					공모전
				<div class="fw_arrow sub2">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse  in"  id="sub2">
				<ul>
					<li> 공모전 등록 </li>
				</ul>
			</div>
		
         
      <!-- submenu menu end -->
			
		
</div>

	<div id="fw_mainwrap">
			<div id="fw_main">
				<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">공모전 등록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				진행할 공모전에 대해 자세히 작성하여 주십시오.
				
			</div>
			
			<form id="frm" action="./contestWrite" method="POST" enctype="multipart/form-data">
	
	<div id="ar_signTableWrap">
		<table id="ar_signTable" border="1px">
			<tr>
				<td class="ar_tableTitle">공모전코드</td>
				<td class="ar_tableInput"><input type="text"  class="ar_draftInput" value="${code }" name="code" readonly="readonly" >
				</td>
				<td class="ar_tableTitle">등록일자</td>
				<td class="ar_tableInput" ><input type ="text"  name="regdate" class="ar_draftInput" readonly="readonly" value="${sysdate }"></td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">공모기간</td>
				<td class="ar_tableInput" colspan="3">
					<input type="date"  name="sdate" class="ar_startDate">
					~
					<input type="date"  name="edate" class="ar_endDate" >
				</td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">공모명</td>
				<td colspan="3" class="ar_tableInput"><input type="text" id="ar_docuTitle" name="name" placeholder="ex) 신메뉴 개발 공모전"></td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">상세설명</td>
				<td colspan="3" class="ar_tableInput" ><textarea rows="" cols="" id="ar_tableTextArea" name="info" ></textarea> </td>
			</tr>
			
			<tr>
				<td class="ar_tableTitle">부상</td>
				<td colspan="3" class="ar_tableInput" ><textarea rows="" cols="" id="ar_tableTextArea2" name="prize" placeholder="ex) 상여금 OO원 지원, 신메뉴 등록"></textarea> </td>
			</tr>
			
			
		</table>
	</div>
	
	<div id="ar_fileLineWrap">
		<input type="button" value="파일 첨부" id="ar_fileInsert">
		<div id="ar_fileWrap"></div>
	</div>
	
	
	<div id="ar_explantBtnWrap">
		<div id="ar_explantBtn">
			<input style="margin-left: 93%;" type="button" value="등록" class="ar_btnStyle ar_signAsk" id="ar_signAsk">
			<input type="button" value="취소" class="ar_btnStyle1 ar_signCen"  id="ar_sign2">
		</div>
	</div>
	
	</form>
			
			
	</div>
</div>

</body>
</html>