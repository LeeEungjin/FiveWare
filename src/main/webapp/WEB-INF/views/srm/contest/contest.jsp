<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/srm/contest/contest.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
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
		
</div>

	<div id="fw_mainwrap">
			<div id="fw_main">
				main Title
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">공모전</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
			
				<div id="ar_contestInfo">
					저희 아린카페에서는 회사의 발전을 위해 끈ㅇ님없이 공모전을 준비하고 있습니다. <br>
					공모전에서 1위 할 시에 성과금, 감사표 등 공모전마다 부상이 준비되어 있습니다.<br>
					각 지점장님들은 마음에 드는 게시글에 좋아요를 눌러주시기 바랍니다.<br>
					회사의 발전을 위하여 지점장님들의 활발한 참여 부탁드립니다.<br>
					감사합니다
				</div>
			</div>
			
			<div class="ar_contestWrap">
				<div class="ar_contestTitle">
				</div>
				<div class="ar_contestTitleBtn">
					<input type="button" value="올리기" id="ar_insertBtn" title="">
				</div>
				
				<div class="ar_ar_contestMenu">
					<div class="ar_contestJoin">
						<div class="ar_contestPhoto">
						</div>
						<div class="ar_contestContain">
						</div>
						
						<div class="ar_contestLike"></div>
					</div>
				
				</div>
			</div>
	
</div>

</body>
</html>