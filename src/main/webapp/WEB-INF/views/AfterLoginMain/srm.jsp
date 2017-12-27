<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SRM</title>
<link href="./resources/css/srm.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

	<div id="login_after_wrap">
		<div id="lofin_after_header">
			 <div id="lang_wrap">
				<div id="lang_icon">
					<i class="fa fa-globe" style="font-size:48px"></i>
				</div>
				<div id="lang_eng" class=" w3-round-xxlarge ">
					<p id="lang_p">English</p>
				</div>
				<div id="lang_kor" class=" w3-round-xxlarge ">
				 	<p id="lang_p">Korean</p>
				</div>    
			</div> 
			
			 <div id="menu_wrap">
				 <nav class="navbar navbar-default">
				  <div class="container-fluid">
				    <div class="navbar-header">
				      <a class="navbar-brand" href="#">FiveWare</a>
				    </div>
				    <ul class="nav navbar-nav">
				      <li id="erp_menu"><a href="#">ERP</a></li>
				      <li><a href="#">GroupWare</a></li>
				      <li><a href="#">SRM</a></li>
				    </ul>
				  </div>
				</nav> 
			</div> 
			
			<div id="search_wrap">
				<button id="logout_btn" type="button" class="btn btn-default btn-l">
		          <span class="glyphicon glyphicon-log-out"></span> Log out
		        </button>
			</div>
			
		</div>
		
		<div id="login_after_middle">
			
			<div id="info_wrap">
				<div id="pro_info">
					<div id="pro_info_1">
						<div id="pro_img"></div>
						<p id="name_p">Member</p>
					</div>
					<div id="pro_info_2">
						<i class="fa fa-bell-o" style="font-size:36px">new</i>
						<div id="alert_menu"></div>
					</div>
				</div>
				<div id="sche_info">
					<i class="fa fa-calendar" style="font-size:36px">Calendar</i>
				</div>
				<div id="sche_add">
					<i class="fa fa-calendar-plus-o" style="font-size:36px">Today Scheduler</i>
				</div>
				<div id="quick_menu">
					<i class="fa fa-star" style="font-size:36px">Direct Menu</i>
					<i class="fa fa-cog" style="font-size:24px"></i>
				</div>
				<div id="often_call">
					<i class="fa fa-address-book-o" style="font-size:36px">Call</i>
					<i class="fa fa-cog" style="font-size:24px"></i>
				</div>				
			</div>
			
			<div id="contents_wrap">
				<div id="notice_wrap">
					<div id="notice_title">
						<p id="notice_title_p">Notice</p>
					</div>

					<div id="notice_icon">
						<i class="fa fa-bullhorn" style="font-size:48px;color:red"></i>
					</div>
					
					<div id="notice_text">
						<p id="notice_text_p">Notice Random slidShow</p>
					</div>
					
					<div id="weather_div">
						<i class="fa fa-cloud" style="font-size:36px">Weather</i>
					</div>
					
					<div id="skin_icon">
						<i class="fa fa-desktop" style="font-size:36px"></i>
					</div>
					
					<div id="edit_icon">
						<i class="fa fa-cog" style="font-size:36px;"></i>
					</div>
				</div>
				
				<div id="submenu_wrap">
				
				<div class="srm_jk_all">
                  
                  <div class="srm_jk_srm">
                     
                     <a href="#">
                        <span class="srm_jk_inerp"> 
                           <span class="srm_jk_bigdiv srm_jk_store">전체<br>지점정보</span>
                        </span>
                     </a>
                  </div>
                  
                  <div class="srm_jk_srm">
                     
                     <a href="#">
                        <span class="srm_jk_inerp">
                           <span class="srm_jk_bigdiv srm_jk_store" id="srm_jk_we">우리<br>매장관리</span>
                        </span>
                     </a> 
                     
                     <a href="#">
                        <span class="srm_jk_smalldiv">
                           <span class="srm_jk_writing">직원 관리</span>
                        </span>
                     </a> 
                     
                     <a href="#">
                        <span class="srm_jk_smalldiv">
                           <span class="srm_jk_writing">출/퇴근<br>조회</span>
                        </span>
                     </a>
                  </div>
                  
                  <div class="srm_jk_srm">
                     
                     <a href="#">
                        <span class="srm_jk_inerp">
                           <span class="srm_jk_bigdiv">이벤트</span>
                        </span>
                     </a> 
                     
                     <a href="#">
                        <span class="srm_jk_smalldiv">
                           <span class="srm_jk_writing">이벤트<br>리스트</span>
                        </span>
                     </a> 
                     
                     <a href="#">
                        <span class="srm_jk_smalldiv">
                           <span class="srm_jk_writing">공모전</span>
                        </span>
                     </a> 
                     
                     <a href="#">
                        <span class="srm_jk_smalldiv">
                           <span class="srm_jk_writing">공모전<br>결과</span>
                        </span>
                     </a>
                  </div>
                  
                  <div class="srm_jk_srm">
                     
                     <a href="#">
                        <span class="srm_jk_inerp">
                           <span class="srm_jk_bigdiv">공지사항</span>
                        </span>
                     </a> 
                     
                     <a href="#">
                        <span class="srm_jk_smalldiv">
                           <span class="srm_jk_writing">공지사항</span>
                        </span>
                     </a>
                  </div>
                  
                  <div class="srm_jk_srm">
                     
                     <a href="#">
                        <span class="srm_jk_inerp">
                           <span class="srm_jk_bigdiv">포스기</span>
                        </span>
                     </a>
                  </div>
               </div>
					
					
				</div>
			
			</div>
			
		</div>
		
		<div id="login_after_footer">
		
		</div>
	</div>

</body>
</html>
