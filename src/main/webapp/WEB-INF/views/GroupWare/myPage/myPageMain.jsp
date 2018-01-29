<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${url }/resources/css/myPage/myPageMain.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 
		 var message = '${message}';
	     if(message != ""){
	        alert(message);
	     }
	 
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
	
	 
		 
		var kind='${kind}';
		$("#submenu_table_1").click(function(){
			if(kind=='member'){
				$("#eb_myPage").prop("href","./myPage/memberMyPage");
			}else{
				$("#eb_myPage").prop("href","./myPage/storeMyPage");
			}
		});

	 });
	 
 
 
 
</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample_srm.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	

		<c:if test="${kind eq 'member'}">
		<!-- submenu banner -->
		<div id="fw_subbanner">
			마이페이지
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				내 정보 관리
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">내 정보</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/timeRecord?memberCode=${member.code }">출/퇴근 조회</a></li>
		
			
				</ul>
			</div>
			
	</c:if>
	
	<c:if test="${kind eq 'store'}">
		<!-- submenu banner -->
		<div id="fw_subbanner">
			우리 매장 관리
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				우리 매장 관리
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/member/storeMyPage">매장 정보</a></li>
					<li><a href="${pageContext.request.contextPath}/srm/staff?store=${member.store}">직원 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/srm/staffTime?store=${member.store}">직원 출/퇴근 조회</a></li>
			
				</ul>
			</div>
			
	
	</c:if>
			


		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
		<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">내정보</span>
				</div>
		<!-- contents -->
					
					<div id="submenu_table_1" class="w3-panel w3-card-4">
				<h1 class="eb_h" >개인 정보</h1>
				<a href="" id="eb_myPage" class="eb_a">
					<img src="${url}/resources/images/개인정보.png" style="width: 65%;height: 50%; margin-top: 30px;margin-left: 18%;">
				</a>
				</div>
				
				
				<div id="submenu_table_2" class="w3-panel w3-card-4">
					<h1 class="eb_h">비밀번호 수정</h1>
				<a class="eb_a" href="./myPage/memberPw" id="eb_pw">
					<img src="${url}/resources/images/pw.png" style="width: 60%;height: 50%; margin-top: 30px;margin-left: 20%;">
			</a>
				</div>
		
		
		
				
				
		  
		  
		  
	
		
	</div>
   </div>
</div>

</body>
</html>