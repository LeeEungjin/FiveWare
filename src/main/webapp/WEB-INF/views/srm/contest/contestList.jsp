<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/srm/contest/contestList.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var message = '${message}';
		
		if(message != ""){
			swal(message);
		}
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			
			alert(cur);
			
			document.event_search_frm.curPage.value=cur;
			document.event_search_frm.submit();
		});
		
		
	});
	
	
</script>

</head>
<body>

<c:import url="${url}/resources/temp/headerExample.jsp"></c:import>

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
					<li> 이벤트 현황 </li>
					<li> 이벤트 스케줄 </li>
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
					<li> 공모전 현황 </li>
					<li> 공모전 참가 </li>
				</ul>
			</div>
		
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">

			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="event_icon">icon</div>
					<p id="event_title">공모전 현황</p>
				</div>
				<div id="erp_jh_event_sub">
					
					<div id="event_contents">
						<p>　</p>
						<p>각 지점에서 기간에 맞게 이벤트를 진행해 주시기 바랍니다.</p>
						<p>포스터를 인쇄하여 광고해주시고, 이벤트에 대한 정보를 반드시 정독하시기 바랍니다.</p>
						<p>이벤트 미진행시 불이익이 있으며, 진행이 불가한 지점은 본사로 연락해주시기 바랍니다.</p>
						<p>　</p>
					</div>
					
				<!-- 검색 기능 -->
						<form action="./eventList" name="event_search_frm" method="get">
							<input type="hidden" name="perPage" value="5">
							<input type="hidden" name="curPage">
						</form>	
				<!-- 검색 기능 끝 -->

				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table">
							<c:forEach items="${list}" var="i" varStatus="j">
							<div class="eventList">
							
								<div class="eventImg_div">
									<img class="eventImg" src="${pageContext.request.contextPath}/resources/upload/${eventImg[j.index].filename}">
								</div>
								
								<div class="eventText">
									<div class="eventTitle">${i.name} (기간 : ${i.sdate}~${i.edate})</div>
									<div class="eventOption"> ${i.info}</div>
									<div class="eventPrize">${i.prize }</div>
									<c:forEach items="${files}" var="a">
										<c:if test="${i.code==a.code }">
											
											<div class="eventFile">첨부 파일 :<a href="../../file/contestFileDown?filename=${a.filename}&oriname=${a.oriname}"> ${a.oriname}</a></div>
										</c:if>
									</c:forEach>
								</div>
								
							</div>
							</c:forEach>
					</div>
				<!-- table 끝 -->
				
				
				<div id="erp_jh_contents_bottom">
					
					<c:if test="${pager.curBlock gt 1}">
						<span class="list" title="${pager.startNum-1}">[이전]</span>
					</c:if>
							
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<span class="list" title="${i}">${i}</span>
					</c:forEach>
										
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<span class="list" title="${pager.lastNum+1}">[다음]</span>
					</c:if>
					
				</div> 
				
			</div>
			
			
			
		</div>
	</div>
</body>
</html>