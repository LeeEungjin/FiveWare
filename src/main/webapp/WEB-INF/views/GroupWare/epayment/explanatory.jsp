<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/GroupWare/epayment/explanatory.css" rel="stylesheet">

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
				기안문 작성
			</div>
			
	<div id="ar_explantBtnWrap">
		<div id="ar_explantBtn">
			<input type="button" value="결재선" class="ar_btnStyle" id="ar_signLine">
			<input type="button" value="결재요청" class="ar_btnStyle" id="ar_signLine">
			<input type="button" value="임시저장" class="ar_btnStyle1" id="ar_signLine">
			<input type="button" value="취소" class="ar_btnStyle1" id="ar_signLine">
		</div>
	</div>
	
	<div id="ar_explanTitle">
		사유서
	</div>
	
	<div id="ar_signBoxWrap">
		<div id="ar_singBoxDiv">
				<div id="ar_singText">
					결 <br> 재
				</div>
				<div id="ar_singBoxBasis">
					<div id="ar_singTemp"> 기 안</div>
				</div>
				<!-- for문 돌리기(결재선) -->
		</div>
	</div>
	
	
</div>
	
</div>

</body>
</html>