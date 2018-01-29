<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${url }/resources/css/myPage/myPagePw.css" rel="stylesheet">

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
	 
		$("#eb_pwCon").click(function(){
			
			var code='${member.code}';
			var pw=$("#eb_pw").val();
			var kind='${kind}';
			
			$.ajax({
				type : "get",
				url : "./myPage/memberPwCheck",
				data : {
					"code" : code,
					"pw" : pw,
					"kind" : kind
				},success : function(data){
					
					var check=data;
					
					if(check ==true){
						$("#submenu_table_1").css("display","none");
						$("#submenu_table_2").css("display","block");
					}else{
						alert("비밀번호를 확인해주세요.");
						return false;
					}
					
				}
			});
		});
		
		$("#eb_pwResult").click(function(){
			var pw1=$("#eb_pw1").val();
			var pw2=$("#eb_pw2").val();
			var kind='${kind}';
			
			if(pw1==pw2){
				$("#eb_frm").submit();
			}else{
				alert("비밀번호가 일치 하지 않습니다. 다시 입력해주세요");
				return false;
			}
		
		if(kind=="member"){
			
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
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
			
			</div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">비밀번호수정</span>
				</div>
		<!-- contents -->
					
					<div id="submenu_table_1" >
					
					<div class="panel panel-danger">
     			 		<div class="panel-heading">비밀번호를 입력해주세요. </div>
      					<div class="panel-body">
      						비밀번호 <input type="password" name="pw" id="eb_pw">
      						<input type="button" id="eb_pwCon" class="btn" value="확인">
      					</div>
   					 </div>
					
					</div>
				
				<form action="./myPage/memberPwUpdate" method="post" id="eb_frm">
					
					<input type="hidden" name="code" value="${member.code}">
					<input type="hidden" name="kind" value="${kind}">
					
				<div id="submenu_table_2">
				
					<div class="panel panel-danger">
     			 		<div class="panel-heading">새로운 비밀번호를 입력해주세요. </div>
      					<div class="panel-body">
      						비밀번호 <input type="password" name="pw" style="margin-bottom: 20px;" id="eb_pw1"> <br>
      						비밀번호 확인 <input type="password" style="margin-bottom: 20px;" id="eb_pw2">
      						 <input type="button" value="확인" class="btn" id="eb_pwResult"> 
      					
      					</div>
      					 
   					 </div>
				</div>
				
				</form>
		
		
				
				
		  
		  
		  
	
		
	</div>
   </div>
</div>

</body>
</html>