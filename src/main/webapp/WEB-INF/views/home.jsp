<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link href="resources/css/home.css" rel="stylesheet">

<script type="text/javascript">
   $(function(){
	   $(".total_wrap").css("height", window.innerHeight);
	   
	   // 높이 중간 구하기
	   var mainHeight = $('.main_wrap').css('height');
	   var restHeight = (window.innerHeight - mainHeight.split('p')[0]*1)/2;
	   $('.total_wrap').css('padding-top', restHeight+'px');
	   
	   // 로그아웃 ********************************************************
	   $('#btn-logout').click(function() {
		   swal({
			   title: "Are you sure?",
			   text: "Your will not be able to recover this imaginary file!",
			   type: "warning",
			   showCancelButton: true,
			   confirmButtonClass: "btn-danger",
			   confirmButtonText: "Yes, delete it!",
			   closeOnConfirm: false
			 },
			 function(){
			   /* $('#frmHomeProcess').attr("action", "./member/memberLogout");
			   $('#frmHomeProcess').submit(); */
			 });
		   
		   
	   });
	   
	   // 로그인 버튼
	   $('#btn-login').click(function() {
		  var login = "";
		  if($('#erp-login').prop("checked")) {
			  login = "member";
		  } else {
			  login = "store";
		  }
		  
		  var code = $('#code').val();
		  var pw = $('#pw').val();
		  
		  if(code.trim() == "" && code.length == 0) {
			  swal("사원번호", "입력해주세요!");
		  } else if(pw.trim() == "" && pw.length == 0) {
			  swal("비밀번호", "입력해주세요!");
		  } else if(!($('#erp-login').prop("checked") || $('#srm-login').prop("checked"))) {
			  swal("체크박스", "선택하세요!");
		  } else {
			 $.ajax({
				url : "./member/checkLogin",
				type : "POST",
				data : {
					"code" : code,
					"pw" : pw,
					"login" : login
				},success : function(msg) {
					if(msg.ch) {
						swal(msg.name+"님", "환영합니다!", "success")
							.then((value) => 
								location.reload()
							);
					} else {
						swal("로그인", "실패했습니다.", "error");
					}
				}
			 }); // END ajax
		  }
	   }); // 로그인 버튼 끝
      
      //로그인 후 이용
/*        $(".eb_login").click(function(){
    	  
   			var member=$("#eb_code").val();
   			var kind='${kind}';

   			
    	if(member==""){
    		alert("로그인 후 이용해주세요.");
    	}else{
    	
    		if(kind=="member"){
    		$("#eb_href_1").attr("href","erp");
    		$("#eb_href_2").attr("href","groupware");
    		
    		$("#eb_href_3").click(function(){
    			alert("지점사람들만 이용가능합니다.");
    	    });    		
    			
    		}else{
    			$("#eb_href_2").attr("href","groupware");
        		$("#eb_href_3").attr("href","srm");
        		
        		$("#eb_href_1").click(function(){
        			alert("본사사람들만 이용가능합니다.");
        	    }); 
    			
    		}
    	}
	  
      });  */
       
   });
</script>


</head>
<body>
	<!-- 전부 -->
	<div class="total_wrap">
		<%-- <img src="${pageContext.request.contextPath}/resources/images/common/company.jpg" style="width:100%; height: 100%">  --%>
		<div class="main_wrap">
		
			<form id="frmHomeProcess" action="#" method="post">
			<table class="table">
				<!-- 큰 메뉴 3개 (ERP, GROUPWARE, SRM) -->
				<thead>
				<tr>
					<td class="menu"><a href="erp" class="eb_login" id="eb_href_1">ERP</a></td>
					<td class="menu"><a href="groupware" class="eb_login" id="eb_href_2">Group Ware</a></td>
					<td class="menu"><a href="srm" class="eb_login" id="eb_href_3">SRM</a></td>
				</tr>
				</thead>
				
				<tbody>
				
				<!-- 로그인 전 -->
				<c:if test="${member eq null}">
					<tr>
						<td colspan="3">
							<div class="imgcontainer">
								<img src="${pageContext.request.contextPath}/resources/images/home/user1.png" class="avatar">
							</div>
							
							<div class="container" style="float: left; width: 50%;">
								<label><b>Code</b></label> 
								<input type="text" class="inputTextBox" placeholder="Enter Code" name="code" id="code"> 
								<label><b>Password</b></label>
								<input type="password" class="inputTextBox" placeholder="Enter Password" name="pw" id="pw">
						
								<div class="container">
									<label class="radioBox"><input type="radio" name="login" id="erp-login"> 본사 로그인</label>
									<label class="radioBox"><input type="radio" name="login" id="srm-login"> 지점 로그인</label>
								</div>
								
								<button type="button" id="btn-login">Login</button>
							</div>
						</td>		
					</tr>
				</c:if>
				<!-- 로그인 전 끝-->
				
				<!-- 로그인 후 -->
				<c:if test="${member ne null }">
					<tr>
						<!-- 본사 로그인일 경우 -->
						<c:if test="${kind eq 'member'}">
							<td colspan="3">
								<div class="imgcontainer">
									<img src="#" alt="이미지 없음" class="avatar">
								</div>
								
								<div class="container" style="float: left; width: 50%;">
									<label><b>사원명</b></label> 
									<input type="text" class="inputTextBox" value="${member.name}" readonly="readonly"> 
									<label><b>부서명</b></label>
									<input type="text" class="inputTextBox" value="${member.temp}" readonly="readonly"> 
									<label><b>직급</b></label>
									<input type="text" class="inputTextBox" value="${member.rank}" readonly="readonly">
							
									<div style="text-align: center;">
										<button type="button" id="btn-myPage" style="width: 40%;">MyPage</button>
										<button type="button" id="btn-logout" style="width: 40%;">Logout</button>
									</div>
								</div>
							</td>
						</c:if>
						
						<!-- 지점 로그인일 경우 -->
						<c:if test="${kind eq 'store'}">
							<td colspan="3">
								<div class="imgcontainer">
									<img src="#" alt="이미지 없음" class="avatar">
								</div>
								
								<div class="container" style="float: left; width: 50%;">
									<label><b>지점명</b></label> 
									<input type="text" class="inputTextBox" value="${member.store}" readonly="readonly"> 
									<label><b>당담자</b></label>
									<input type="text" class="inputTextBox" value="${member.name}" readonly="readonly"> 
									<label><b>전화번호</b></label>
									<input type="text" class="inputTextBox" value="${member.tel}" readonly="readonly">
							
									<div style="text-align: center;">
										<button type="button" id="btn-myPage" style="width: 40%;">StorePage</button>
										<button type="button" id="btn-logout" style="width: 40%;">Logout</button>
									</div>
								</div>
							</td>
						</c:if>
								
					</tr>
				</c:if>
				<!-- 로그인 후 끝 -->
				</tbody>
			</table>
			</form>




			<!-- 로그인 끝 화면 시작 -->
			<%-- <c:if test="${member ne null }">
			<div class="login_after">

				<!-- 사원 정보 -->
				<div class="member_wrap">
					<div class="member_pci">사진 사진</div>

					<c:if test="${kind eq 'member'}">
						<div class="member_info">
							<div class="info">
								사원명 : <input type="text" readonly="readonly"
									value="${member.name }" id="eb_name">
							</div>
							<div class="info">
								부서 : <input type="text" readonly="readonly"
									value="${member.temp }">
							</div>
							<div class="info">
								직급 : <input type="text" readonly="readonly"
									value="${member.rank }">
							</div>
							------------------------------------------------<br> 알림?
						</div>
					</c:if>

					<c:if test="${kind eq 'store'}">
						<div class="member_info">
							<div class="info">
								지점명 : <input type="text" readonly="readonly"
									value="${member.store }" id="eb_name">
							</div>

							------------------------------------------------<br> 알림?
						</div>
					</c:if>

				</div>

				<!--  인사말? -->
				<div class="welcome">인사말? 동영상? 할일 ?</div>
			</div>
			</c:if> --%>
			<!-- 로그인 끝 화면 끝 -->
		</div>
	</div>

</body>
</html>