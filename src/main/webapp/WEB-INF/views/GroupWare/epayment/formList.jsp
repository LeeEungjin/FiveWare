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
<script type="text/javascript">
	$(function(){
		
		$("#ar_tablenumber").val("${perPage}");
		
		$(".ar_paging1").click(function(){
			var curPage = $(this).attr("id");
			
			document.formfrm.curPage.value=curPage;
			document.formfrm.submit();
		});
		
		$("#ar_tablenumber").change(function(){
			var perPage = $(this).val();
			
			document.formfrm.perPage.value=perPage;
			document.formfrm.submit();
			
		});
		
	});

</script>
</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			전자결재
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
		<div class="fw_menu " data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				전체 결재함
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="./epaymentTotalList?state=미결">미결함</a> </li>
					<li> <a href="./epaymentTotalList?state=기결">기결함</a> </li>
					<li> <a href="./epaymentTotalList?state=반려">반려함</a> </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					발신함
				<div class="fw_arrow sub2">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub2">
				<ul>
					<li>  <a href="./formList?curPage=1">기안 상신함</a></li>
					<li> <a href="./epaymentStorageList?state=임시저장">임시보관함</a></li>
					<li> <a href="./myEpayment">내 결재 보기</a></li>
				</ul>
			</div>
			
			<!-- -------------------- -->
					<div class="fw_menu " data-toggle="collapse" data-target="#sub3" title="sub3" >
					수신함
				<div class="fw_arrow sub3">
					∨
				</div>
				</div>
			
				<div class="fw_subsub collapse "  id="sub3">
					<ul>
					<li> <a href="./epaymentReceive?statenum=0">미결함</a> </li>
					<li> <a href="./epaymentReceive?statenum=1">기결함</a> </li>
					<li> <a href="./epaymentReceive?statenum=-1">반려함</a> </li>
					</ul>
				</div>
			
			
		
</div>

	<div id="fw_mainwrap">
			<div id="fw_main">
				<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">양식목록</p>
			</div>
			<div id="erp_jh_event_sub">
					<div id="event_contents">
						<p>　</p>
				
					 <p>시스템 항목이 '문서결재'인 양식은 전자결재 내에서 결재문서가 작성되어 결재가 처리됩니다. </p>
					 <p>'문서결재' 외 양식은 해당 시스템에서 결재문서 관련 사항을 입력하여 결재요청하면 </p>
					 <p>전자결재와 연계하여 결재가 처리됩니다.</p>
				</div>
			</div>
			
			<div id="ar_mainDivWrap">
				
				<div id="ar_inhabitTableWrap">
					<div id="ar_tableTop">
			<form action="./formList" method="GET" name="formfrm">
						<input type="hidden" name="curPage" value="1">
						<select id="ar_tablenumber" name="perPage" >
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							
						</select>
						
						<div id="ar_totalNum">전체 : ${listnum }</div>
						
						<input type="submit" id="ar_searchBtn" value="검색">
						
						<input type="text" id="ar_searchInput" name="search">
			</form>
						
							<select id="ar_searchTitle">
								<option>양식명</option>
							</select>
							
					</div>
					
					<div id="ar_tableWrap">
						<div class="ar_titleDiv">
							<div class="ar_tableNum ar_titleDiv1"> No </div>
							<div class="ar_tableName ar_titleDiv1"> 양식명 </div>
							<div class="ar_tableOther ar_titleDiv1"> 비고 </div>
						</div>
				
			 	<c:forEach items="${list}" var="list"> 
					<div class="ar_titleDiv2">
							<div class="ar_tableNum ar_titleDiv1"> ${list.num} </div>
							<div class="ar_tableName ar_titleDiv1"><a href="explanatory" > ${list.formname}</a> </div>
							<div class="ar_tableOther ar_titleDiv1">  ${list.forminfo} </div>
						</div> 
			 	</c:forEach> 
			<div class="ar_pageWrap">
						<c:if test="${pager.curBlock>1}">
							<span class="ar_paging1" id="${pager.startNum-1 }">이전</span>
						</c:if>
					
						<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
							<span class="ar_paging1" id="${i }">${i }</span>
						</c:forEach>
						
						<c:if test="${pager.curBlock<pager.totalBlock}">
							<span class="ar_paging1" id="${pager.lastNum+1 }">다음</span>
						</c:if>
					</div>
					</div>
				</div>
			</div>
			
	</div>
			
</div>

</body>
</html>