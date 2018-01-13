<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/GroupWare/epayment/epaymentPendency.css" rel="stylesheet">

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
					<li> <a href="./epaymentPendency">미결함</a> </li>
					<li> <a href="./epaymentDetermine">기결함</a> </li>
					<li> <a href="./epaymentReturn">반려함</a> </li>
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
				<p id="ar_plustext">미결함</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
			<form action="positionPlus" method="GET">
				<div class="ar_plusSearch">
					결재가 완료 되지 않은 문서
					</div>
			</form>
			</div>
			
			<div id="ar_mainDivWrap">
	
				
				<div id="ar_inhabitTableWrap">
					<div id="ar_tableTop">
						<select id="ar_tablenumber">
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							
						</select>
						
						<div id="ar_totalNum">전체 </div>
						
						<input type="button" id="ar_searchBtn" value="검색">
						
						<input type="text" id="ar_searchInput">
						
							<select id="ar_searchTitle">
								<option>문서 종류</option>
								<option>날짜</option>
								<option>부서</option>
								<option>기안자</option>
							</select>
							
					</div>
					
					<div id="ar_tableWrap">
						<table class="table" id="eb_table">
							<thead>
								<tr>
									<th> No </th>
									<th> 문서 제목 </th>
									<th> 기안자 </th>
									<th> 기안 부서 </th>
									<th> 승인 부서 </th>
									<th> 기안 날짜 </th>
									<th> 첨부 </th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
								</tr>
							
							</tbody>
						
						</table>
			 
					</div>
				</div>
			</div>
			
			
			
	</div>
</div>

</body>
</html>