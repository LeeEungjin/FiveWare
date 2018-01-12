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
					 시스템 항목이 '문서결재'인 양식은 전자결재 내에서 결재문서가 작성되어 결재가 처리됩니다. '문서결재' 외 양식은 해당 시스템에서 결재문서 관련 사항을 입력하여 결재요청하면 전자결재와 연계하여 결재가 처리됩니다.
					<br> 어쩌구저쩌구 설명
					</div>
			</form>
			</div>
			
			<div id="ar_mainDivWrap">
				<div id="ar_inhabitWrap">
					<div id="ar_inhabitDiv">
						
					
					</div>
					
					<div id="ar_latestInhabit">
					
					</div>
				</div>
				
				<div id="ar_inhabitTableWrap">
					<div id="ar_tableTop">
						<select id="ar_tablenumber">
							<option value="10">10</option>
							<option value="10">20</option>
							<option value="10">30</option>
							<option value="10">40</option>
							<option value="10">50</option>
							
						</select>
						
						<div id="ar_totalNum">전체 숫자</div>
						
						<input type="button" id="ar_searchBtn" value="검색">
						
						<input type="text" id="ar_searchInput">
						
							<select id="ar_searchTitle">
								<option>양식명</option>
								<option>서식명</option>
							</select>
							
					</div>
					
					<div id="ar_tableWrap">
						<div class="ar_titleDiv">
							<div class="ar_tableNum ar_titleDiv1"> No </div>
							<div class="ar_tableSystem ar_titleDiv1"> 시스템 </div>
							<div class="ar_tableFormName ar_titleDiv1"> 서식함 </div>
							<div class="ar_tableLove ar_titleDiv1"> 즐겨찾기 </div>
							<div class="ar_tableName ar_titleDiv1"> 양식명 </div>
						</div>
					</div>
				</div>
				
			<%-- 	<c:forEach> --%>
					<div class="ar_titleDiv">
							<div class="ar_tableNum ar_titleDiv1"> No </div>
							<div class="ar_tableSystem ar_titleDiv1"> 시스템 </div>
							<div class="ar_tableFormName ar_titleDiv1"> 서식함 </div>
							<div class="ar_tableLove ar_titleDiv1"> 즐겨찾기 </div>
							<div class="ar_tableName ar_titleDiv1"> 양식명 </div>
						</div>
			<%-- 	</c:forEach> --%>
			</div>
			
			
			
	</div>
</div>

</body>
</html>