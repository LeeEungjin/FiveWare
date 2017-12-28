<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/human/basisInfo/positionPlus.css" rel="stylesheet">
 
 <script type="text/javascript">
 	$(function(){
 		$("#ar_insertBtn").click(function(){
 			
 		});
 	});
 </script>
<title>Insert title here</title>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			인사
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> 직책 등록 </li>
					<li> 급여 등록 </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					사원관리
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 사원 등록 </li>
					<li> 급여 등록 </li>
					<li> 퇴직자 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					급여관리
				<div class="fw_arrow sub3" >
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub3">
				<ul>
					<li> 급여 계산 </li>
					<li> 퇴직금 계산 </li>
					<li> 개인별 급여 현황 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
					<li> 근태항목 등록 </li>
					<li> 휴가일수 등록 </li>
					<li> 근태 입력 </li>
					<li> 근태 조회 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					조회
			
			</div>
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				mainTitle
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">직급 등록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
				<div class="ar_plusSearch">
					직급명  <input type="text" name="search" id="ar_psearch">
					<input type="button" value="검색" id="ar_psearchBtn">
				</div>
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
				
					<div class="ar_listDiv">
					<div class="ar_titleCheck ar_listDiv1" ><input type="checkbox" id="title명으로">	</div>
					<div class="ar_titleCode ar_listDiv1" title="" id="pcode"> B1111 </div>
					<div class="ar_titleName ar_listDiv1" id="pname"> 사장 </div>
					<div class="ar_titleRank ar_listDiv1" id="prank"> 1 </div>
					<div class="ar_titleUse ar_listDiv1" id="puse"> 사용 </div>					
					<div class="ar_titleOther ar_listDiv1" id="pother"> </div>
					
				</div>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_deleteBtn" value="선택 삭제">
				<input type="button" id="ar_insertBtn" value="신규 등록">
			</div>
			
	</div>
</div>

</body>
</html>