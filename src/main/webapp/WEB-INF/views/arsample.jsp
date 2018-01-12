<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/GroupWare/epayment/formList.css" rel="stylesheet">

<title>Insert title here</title>
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
				main Title
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">양식목록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
			<form action="positionPlus" method="GET">
				<div class="ar_plusSearch">
					직급명  <input type="text" name="search" id="ar_psearch">
					<input type="submit" value="검색" id="ar_psearchBtn">
				</div>
			</form>
			</div>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_titleCheck ar_titleDiv1" ><input type="checkbox">	</div>
					<div class="ar_titleCode ar_titleDiv1"> 직급코드 </div>
					<div class="ar_titleName ar_titleDiv1"> 직급명 </div>
					<div class="ar_titleRank ar_titleDiv1"> 직급순위 </div>
					<div class="ar_titleUse ar_titleDiv1"> 사용여부 </div>					
					<div class="ar_titleOther ar_titleDiv1"> 비고</div>
				</div>				
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_deleteBtn" value="선택 삭제">
				<input type="button" id="ar_insertBtn" data-toggle="modal" data-target="#ar_positionInsert" value="신규 등록">
			</div>
			
			
	</div>
</div>

</body>
</html>