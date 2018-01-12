<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>My Page</title>
<link href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script type="text/javascript">
	$(function(){
		 var message = '${message}';
	     if(message != ""){
	        alert(message);
	     }
		
		
		$('[data-toggle="tooltip"]').tooltip();   
		
		$("#eb_update").click(function(){
           alert("수정");
			$(".eb_table_1").css("display","none");
			$(".eb_table_2").css("display","block");
		})
	})
</script>
<body>

	<div id="login_after_wrap">
		<div id="lofin_after_header">
			 <div id="lang_wrap">
				<div id="lang_icon">
					<i class="fa fa-globe" style="font-size:35px"></i>
				</div>
				<div id="lang_eng" class=" w3-round-xxlarge ">
					<p id="lang_p">English</p>
				</div>
				<div id="lang_kor" class=" w3-round-xxlarge ">
				 	<p id="lang_p">Korean</p>
				</div>    
			</div> 
			
			 <!-- <div id="menu_wrap">
				 <nav class="navbar navbar-default">
				  <div class="container-fluid">
				    <div class="navbar-header">
				      <a class="navbar-brand" href="#">FiveWare</a>
				    </div>
				    <ul class="nav navbar-nav">
				      <li id="erp_menu"><a href="#">ERP</a></li>
				      <li id="groupware_menu"><a href="#">GroupWare</a></li>
				      <li id="srm_menu"><a href="#">SRM</a></li>
				    </ul>
				  </div>
				</nav> 
			</div> 
			 -->
			<div id="search_wrap">
				<a href="./member/storeMyPage">
					<button id="logout_btn_1" type="button" class="btn btn-default btn-l">
		        	 <span class="glyphicon glyphicon-log-out" id="logout"></span>My Page
		        </button></a>
		        
		        <a href="./member/memberLogout">
					<button id="logout_btn_2" type="button" class="btn btn-default btn-l">
		         	<span class="glyphicon glyphicon-log-out" id="logout"></span>Logout
		        </button></a>
			</div>
		</div>
		
		<div id="login_after_middle">
			
			<div id="info_wrap">
				<div id="pro_info">
					<div id="pro_info_1">
						<div id="pro_img">
							<img src="${pageContext.request.contextPath}/resources/images/sidebar/avatar82.png" class="eb_default_img">
						
						<!-- 로그인하면 이름!!  -->
				
						<div class="dropdown">
						
					    <p id="name_p">${member.name}님 </p>
					    
					  </div>
						
						
						</div>
					</div>
					<div id="pro_info_2">
						<i class="fa fa-bell-o" style="font-size:36px">new</i>
						<div id="alert_menu"></div>
					</div>
				</div>
				<div id="sche_info">
					<i class="fa fa-calendar" style="font-size:36px">Calendar</i>
				</div>
				
			<div class="eb_line"></div>
				
				<div id="sche_add">
					<i class="fa fa-calendar-plus-o" style="font-size:36px; padding-top:10px;"></i>
					<p id="sche_p">오늘의 일정을 등록해보세요.</p>
				</div>
				<div id="quick_menu">
					<p id="quick_p">바로가기
					<a href="#" data-toggle="tooltip" title="바로가기 설정">
					<i class="fa fa-cog" style="font-size:20px; color : gray;"></i>
					</a>
						</p>
					
				
					
					<div id="quick_menu_box"></div>
				</div>
				
				
				<div id="often_call">
					<p id="quick_p">자주 연락하는 사람들
						<a href="#" data-toggle="tooltip" title="목록 설정">
						<i class="fa fa-cog" style="font-size:20px; 
						color : gray;"></i>
						</a>
					</p>
				</div>				
			</div>
			
			<div id="contents_wrap">
				<div id="myPage_wrap">
					<div id="myPage_title">
						<p id="myPage_title_p">My Page
						<i class="fa fa-address-card-o" style="font-size:48px;color: #CE3636"></i></p>
					</div>
				
				
					<div id="myPage_text"></div>			
					<div id="weather_div">
						<i class="fa fa-cloud weather_div_p" style="font-size:36px">Weather</i>
					</div>
					
					<div id="skin_icon">
						<i class="fa fa-desktop weather_div_p" style="font-size:36px"></i>
					</div>
					
					<div id="edit_icon">
						<i class="fa fa-cog weather_div_p" style="font-size:36px;"></i>
					</div>
				</div>
				
				<div id="submenu_wrap" >
					
					<div class="eb_blank"></div>
					
					
					<!-- contents -->
					
		
					<div id="submenu_table" class="w3-panel w3-card-4">
					
						<div class="eb_table_text">
						
							<h3>기본 정보</h3>
						</div>
					
					<table class="table">
						<tr>
							<td class="eb_td">지점코드</td>
							<td>${member.code}</td>
						</tr>
						
						<tr>
							<td class="eb_td">지점명</td>
							<td>${member.store }</td>
						</tr>
						
						<tr>
							<td class="eb_td">사업자번호</td>
							<td>${member.storeNum }</td>
						</tr>
						
						<tr>
							<td class="eb_td">주소</td>
							<td>${member.addr }</td>
						</tr>
					
						<tr>
							<td class="eb_td">영업시간</td>
							<td>${member.time }</td>
						</tr>
						
						</table>
					
					 
	
					<h3>수정할수있는정보</h3>
					<!--원글  -->
				<div class="eb_table_1">	
					<table class="table ">	
						<tr>
							<td class="eb_td">대표자명</td>
							<td>${member.name}</td>
						</tr>
						
					
						<tr>
							<td class="eb_td">E-mail</td>
							<td>${member.email}</td>
						</tr>
						
						<tr>
							<td class="eb_td">전화번호</td>
							<td>${member.tel}</td>
						</tr>
					
						
						<tr>
							<td class="eb_td">은행</td>
							<td>${member.bank}</td>
						</tr>
						
						<tr>
							<td class="eb_td">계좌번호</td>
							<td>${member.account}</td>
						</tr>
					</table>
					<input type="button" value="수정하기" id="eb_update">
				</div>
			
			
			
			
			<!-- 수정 -->
			
		 <div class="eb_table_2">	
		 <form action="storeUpdate" method="post">
		 <input type="hidden" value="${member.code}" name="code">
			<table class="table ">	
			
						<tr>
							<td class="eb_td">대표자명</td>
							<td><input type="text" value="${member.name}" name="name"></td>
						</tr>
						<tr>
							<td class="eb_td">E-mail</td>
							<td><input type="text" value="${member.email}" name="email"></td>
						</tr>
						<tr>
							<td class="eb_td">전화번호</td>
							<td><input type="text" value="${member.tel}" name="tel"></td>
						</tr>
						
			
						<tr>
							<td class="eb_td">은행</td>
							<td><input type="text" value="${member.bank}" name="bank"></td>
						</tr>
						
						 <tr>
							<td class="eb_td">계좌번호</td>
							<td><input type="text" value="${member.account}" name="account"></td>
						</tr> 
					</table>
						<input type="submit" value="수정하기" >
					</form>
					</div>
				</div>
			
			</div>
			
		</div>
		
	</div>
		<div id="login_after_footer">
		
		</div>

</body>
</html>
