<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${url }/resources/css/myPage/myPage.css" rel="stylesheet">

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
	 
		$("#eb_update").click(function(){
			$(".eb_table_1").css("display","none");
			$(".eb_table_2").css("display","block");
		})
	 
	 
 });
 
 
 
 
</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample_srm.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
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
			
	

		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
			
			</div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">내정보</span>
				</div>
		<!-- contents -->
					
		
					<div id="submenu_table_1" class="w3-panel w3-card-4">
			
					
					<table class="table" style="margin-top: 30px;">
						<tr>
							<td class="eb_td">사원번호</td>
							<td>${member.code}</td>
						</tr>
						
						<tr>
							<td class="eb_td">이름</td>
							<td>${member.name }</td>
						</tr>
						
						<tr>
							<td class="eb_td">부서</td>
							<td>${member.temp }</td>
						</tr>
						
						<tr>
							<td class="eb_td">직급</td>
							<td>${member.rank }</td>
						</tr>
					
						<tr>
							<td class="eb_td">입사일</td>
							<td>${member.hiredate }</td>
						</tr>
						
						</table>
					
					 
					
				</div>
				
				
				<div id="submenu_table_2" class="w3-panel w3-card-4">
					
					<!--원글  -->
				<div class="eb_table_1">	
					<table class="table " style="margin-top: 30px;">	
				
					
						<tr>
							<td class="eb_td">전화번호</td>
							<td>${member.phone}</td>
						</tr>
						
						<tr>
							<td class="eb_td">거주지</td>
							<td>${member.addr}</td>
						</tr>
						
						<tr>
							<td class="eb_td">E-mail</td>
							<td>${member.email}</td>
						</tr>
						
						<tr>
							<td class="eb_td">은행</td>
							<td>${member.bank}</td>
						</tr>
						
						<tr>
							<td class="eb_td">계좌번호</td>
							<td>${member.banknum}</td>
						</tr>
					</table>
					<input type="button" class="w3-button w3-black" value="수정하기" id="eb_update">
				</div>
			
			
			
			
			<!-- 수정 -->
			
		 <div class="eb_table_2">	
		 <form action="memberUpdate" method="post">
		 <input type="hidden" value="${member.code}" name="code">
			<table class="table " style="margin-top: 30px;">	
						
						
						<tr>
							<td class="eb_td">전화번호</td>
							<td><input type="text" value="${member.phone}" name="phone"></td>
						</tr>
						
						<tr>
							<td class="eb_td">거주지</td>
							<td><input type="text" value="${member.addr}" name="addr"></td>
						</tr>
						
						<tr>
							<td class="eb_td">E-mail</td>
							<td><input type="text" value="${member.email}" name="email"></td>
						</tr>
						
						<tr>
							<td class="eb_td">은행</td>
							<td><input type="text" value="${member.bank}" name="bank"></td>
						</tr>
						
						<tr>
							<td class="eb_td">계좌번호</td>
							<td><input type="text" value="${member.banknum}" name="banknum"></td>
						</tr>
					</table>
						<input type="submit" class="w3-button w3-black" value="수정하기" >
					</form>
					</div>
					
				</div>
			
		
		
		
				
				
		  
		  
		  
	
		
	</div>
   </div>
</div>

</body>
</html>