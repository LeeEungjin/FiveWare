<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/human/blackList/blackList.css" rel="stylesheet">
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
					<p id="event_title">블랙리스트 관리</p>
				</div>
				<div id="erp_jh_event_sub">
					
					<div id="event_contents">
						<p>　</p>
						<p>게시물 신고를 3회 이상 받은 작성자 목록입니다.</p>
						<p>블랙 리스트 목록을 보신후 개별 연락 바랍니다.</p>
						<p>　</p>
						<p>　</p>
					</div>

				</div>
				
				<!-- table -->
				<c:forEach items="${blackList}" var="list" varStatus="i">
					<div id="erp_jh_contents_table">
							<div class="eventList">
							
								<div class="eventImg_div">
									<img class="eventImg" src="${pageContext.request.contextPath}/resources/member/${file[i.index].filename}">
								</div>
								
								<div class="eventText">
									<div class="blackListName">[${list.code}] ${list.name}</div>
									<div class="infoTable">
										<p>부서 : ${list.temp} (직급 : ${list.rank})</p>
										<p>입사일 : ${list.hiredate}</p>
										<p>생년월일 : ${list.birth}</p>
										<p>핸드폰 번호 : ${list.phone}</p>
										<p>주소 : ${list.addr}</p>
										<p>이메일 : ${list.email}</p>
									</div>
								</div>
								
							</div>
					</div>
				</c:forEach>
				<!-- table 끝 -->
				
				
				<div id="erp_jh_contents_bottom">
					
					
				</div> 
				
			</div>
			
			
			
		</div>
	</div>
</body>
</html>