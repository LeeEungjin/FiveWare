<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/human/diliMana/diliSearch.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		$("#ar_excelView").click(function(){
			location.href="../../excel/diliSearchExcel";
		});
		
	});
</script>
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 
<c:import url="/WEB-INF/views/message.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			인사
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="${url }/human/basisInfo/positionPlus">직책 등록 </a></li>
					<li> <a href="${url }/human/basisInfo/salPlus">급여 등록</a> </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					사원관리
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"   id="sub2">
				<ul>
					<li><a href="${url }/human/memberMana/memberPlus"> 사원 등록</a> </li>
					<li> <a href="${url }/human/memberMana/retireeMana"> 퇴직자 </a></li>
				</ul>
			</div>
			
			<!-- -------------------- -->
					<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub4">
				<ul>
					<li><a href="${url}/human/diliMana/diliPlus">  근태항목 등록 </a></li>
					<li><a href="${url}/human/diliMana/diliInput">  근태 입력 </a></li>
					<li><a href="${url}/human/diliMana/diliSearch">  근태 조회</a> </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
			
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					블랙리스트
				<div class="fw_arrow sub5">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub5">
				<ul>
					<li><a href="${url}/community/blackList">  블랙리스트 </a></li>
				</ul>
			</div>
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">근태 현황 조회</p>
			</div>
			
				
				
				
				<!-- ID 수정해!!!! -->
				
				<form action="diliSearch" method="GET">
					<div id="erp_jh_event_sub">
					<div id="event_contents">
						<p>　</p>
						<%-- 조회 기간 <input type="date" name="startdate" id="ar_ssearch" value="${startdate }"> ~<input type="date" name="enddate" id="ar_ssearch" value="${enddate }"> --%>
						직원명<input type="text" name="search" id="ar_searchBtn"value=${param.search }>
						<input type="submit"  value="검색" id="ar_ssearchBtn">
						<p>　</p>
				</div>
			</div>
				
				</form>
				<!-- ID 수정끝!!!! -->
				
			
		<div class="ar_plusDivWrap">
			<div class="ar_wrapWrap">
				<div class="ar_titleDiv">
					<div class="ar_CodeTitle ar_titleDiv1"> 사번 </div>
					<div class="ar_NameTitle ar_titleDiv1"> 성명 </div>
					<div class="ar_TempTitle ar_titleDiv1"> 부서명 </div>
				</div>
				
				<c:forEach items="${diliList }" var="list">
					<div class="ar_titleDiv2">
						<div class="ar_OtherTitle ar_titleDiv1"> ${list } </div>
					</div>
				</c:forEach>
			</div>
				
					 <c:forEach items="${memberList }" var="list" varStatus="i">
						<div class="ar_wrapWrap">
							<div class="ar_titleDiv">
								<div class="ar_listDiv">
									<div class="ar_CodeTitle "  id="ar_dilicode" > ${list.code} </div>
									<div class="ar_NameTitle"> ${list.name} </div>
									<div class="ar_TempTitle"> ${list.temp} </div>
								</div>
							</div>
							
							<c:forEach items="${sumList[i.index] }" var="list1">
								<div class="ar_titleDiv2">
									<div class="ar_OtherTitle "> ${list1 } </div>
								</div>
							</c:forEach>
						</div>
					</c:forEach> 
			</div>
			<div class="ar_plusButtonWrap">
				<input type="button"  id="ar_excelView" value="Excel">
			</div>
			
	</div>
</div>

</body>
</html>