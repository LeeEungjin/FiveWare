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
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="positionPlus">직책 등록 </a></li>
					<li> <a href="salPlus">급여 등록</a> </li>
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
					<li><a href="${url}/human/memberMana/memberPlus"> 사원 등록</a> </li>
					<li> 급여 등록 </li>
					<li> 퇴직자 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
		
			
			<!-- -------------------- -->
				<div class="fw_menu  fw_selected" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub4">
				<ul>
					<li> 근태항목 등록 </li>
					<li> 근태 입력 </li>
					<li> 근태 조회 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				mainTitle
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">근태 현황 조회</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
				
				
				<!-- ID 수정해!!!! -->
				
				<form action="diliSearch" method="GET">
					<div class="ar_plusSearch">
						<%-- 조회 기간 <input type="date" name="startdate" id="ar_ssearch" value="${startdate }"> ~<input type="date" name="enddate" id="ar_ssearch" value="${enddate }"> --%>
						직원명<input type="text" name="search" value=${param.search }>
						<input type="submit"  value="검색" id="ar_ssearchBtn">
					</div>
					
				
				</form>
				<!-- ID 수정끝!!!! -->
				
			</div>
			
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
				<input type="button"  value="Excel">
			</div>
			
	</div>
</div>

</body>
</html>