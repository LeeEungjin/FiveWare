<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/srm/eventList.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var message = '${message}';
		
		
		if(message != ""){
			swal(message);
		}
		
		
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
         자재관리
      </div>
      <!-- submenu banner end -->
      
      <!-- submenu menu -->
         <div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub1" title="sub1">
            기초정보
            <div class="fw_arrow sub1">
               ∧
            </div>
         </div>
         
         <div class="fw_subselected collapse in" id="sub1">
            <ul>
               <li> 거래처 등록</li>
               <li> 제품 등록</li>
               <li><a href="./menuRegist">메뉴 등록</a></li>
               <li><a href="./storageRegist">창고 등록</a></li>
            </ul>
         </div>
         
         <!-- ----------2---------- -->
            <div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
               구매관리
            <div class="fw_arrow sub2">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub2">
            <ul>
               <li> 주문 입력</li>
               <li> 주문 현황 보기</li>
            </ul>
         </div>
         
         <!-- ----------3---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
               자재관리
            <div class="fw_arrow sub3">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub3">
            <ul>
               <li><a href="../../erp/mater/materRegist?materKind=enter">입고 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=rele">출고 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=back">반품 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=confin">불출 입력</a></li>
            </ul>
         </div>
         
         <!-- ----------4---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
               	조회
            <div class="fw_arrow sub4">
               	∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub4">
            <ul>
               <li><a href="../../ware/erp/into/intoList">조회 및 엑셀 다운</a></li>
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
					<p id="event_title">이벤트 목록</p>
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
					<div id="event_search">
						
					</div>
				<!-- 검색 기능 끝 -->

				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table">
						
						<c:forEach items="${eventList}" var="list">
							<div class="eventList">
								<div class="eventImg"></div>
								<div class="eventText">
									<div class="eventTitle">${list.eventName} (기간 : ${list.eventSdate}~${list.eventEdate})</div>
									<div class="eventOption">${list.eventOption}</div>
									<div class="eventFile"></div>
								</div>
							</div>
						</c:forEach>
					</div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
					<div id="erp_jh_contents_bottom">
					</div>
				<!-- 등록 버튼 끝 -->
				
				
			</div>
		</div>
	</div>
</body>
</html>