<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>ERP</title>
<link href="./resources/css/erp.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script type="text/javascript">
	var slideIndex = 0;

	function carousel() {
	    var i;
	    var x = document.getElementsByClassName("mySlides");
	    
	    for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none"; 
	    }
	    
	    slideIndex++;
	    
	    if (slideIndex > x.length) {slideIndex = 1} 
	    x[slideIndex-1].style.display = "block"; 
	    setTimeout(carousel, 3000); 
	}
	
	$(function(){
		
		carousel();
		
		$('[data-toggle="tooltip"]').tooltip();   
		
		/* 출퇴근~~~~ */
		var myVar = setInterval(myTimer, 1000);

		function myTimer() {
		    var d = new Date();
		    
		   document.getElementById("demo_2").innerHTML = d.toLocaleTimeString(); 
		}
		
		var canvas = document.getElementById("canvas");
		var ctx = canvas.getContext("2d");
		var radius = canvas.height / 2;
		ctx.translate(radius, radius);
		radius = radius * 0.90
		setInterval(drawClock, 1000);

		function drawClock() {
		  drawFace(ctx, radius);
		  drawNumbers(ctx, radius);
		  drawTime(ctx, radius);
		}

		function drawFace(ctx, radius) {
		  var grad;
		  ctx.beginPath();
		  ctx.arc(0, 0, radius, 0, 2*Math.PI);
		  ctx.fillStyle = 'white';
		  ctx.fill();
		  grad = ctx.createRadialGradient(0,0,radius*0.95, 0,0,radius*1.05);
		  grad.addColorStop(0, '#333');
		  grad.addColorStop(0.5, 'white');
		  grad.addColorStop(1, '#333');
		  ctx.strokeStyle = grad;
		  ctx.lineWidth = radius*0.1;
		  ctx.stroke();
		  ctx.beginPath();
		  ctx.arc(0, 0, radius*0.1, 0, 2*Math.PI);
		  ctx.fillStyle = '#333';
		  ctx.fill();
		}

		function drawNumbers(ctx, radius) {
		  var ang;
		  var num;
		  ctx.font = radius*0.15 + "px arial";
		  ctx.textBaseline="middle";
		  ctx.textAlign="center";
		  for(num = 1; num < 13; num++){
		    ang = num * Math.PI / 6;
		    ctx.rotate(ang);
		    ctx.translate(0, -radius*0.85);
		    ctx.rotate(-ang);
		    ctx.fillText(num.toString(), 0, 0);
		    ctx.rotate(ang);
		    ctx.translate(0, radius*0.85);
		    ctx.rotate(-ang);
		  }
		}

		function drawTime(ctx, radius){
		    var now = new Date();
		    var hour = now.getHours();
		    var minute = now.getMinutes();
		    var second = now.getSeconds();
		    //hour
		    hour=hour%12;
		    hour=(hour*Math.PI/6)+
		    (minute*Math.PI/(6*60))+
		    (second*Math.PI/(360*60));
		    drawHand(ctx, hour, radius*0.5, radius*0.07);
		    //minute
		    minute=(minute*Math.PI/30)+(second*Math.PI/(30*60));
		    drawHand(ctx, minute, radius*0.8, radius*0.07);
		    // second
		    second=(second*Math.PI/30);
		    drawHand(ctx, second, radius*0.9, radius*0.02);
		}

		function drawHand(ctx, pos, length, width) {
		    ctx.beginPath();
		    ctx.lineWidth = width;
		    ctx.lineCap = "round";
		    ctx.moveTo(0,0);
		    ctx.rotate(pos);
		    ctx.lineTo(0, -length);
		    ctx.stroke();
		    ctx.rotate(-pos);
		}
		
		
	$("#eb_timeBtn").click(function(){
		var code='${member.code}';
		var date='${sysdate}';
		
		$.ajax({
			type : "GET",
			url : "./time/timeSelectOne",
			data : {
				"memberCode" : code,
				"regdate" : date
			},success : function(data){
			
				if(data==""){
					$("#start").val("출근");
					$("#last").val("퇴근");
				}else if(data.startTime !="" && data.lastTime == null){
					
					$("#start").val(data.startTime);
					$("#last").val("퇴근");
				}else{
			
				$("#start").val(data.startTime);
				$("#last").val(data.lastTime);
				}
			},error : function(){
				alert("error");
			}
		});
		
	});
		
		
		
	 $("#start").click(function(){
			var time=$("#demo_2").text();
			var date=$("#demo_1").text();
	
		 if(confirm("출근처리 하시겠습니까 ?") == false){
		     alert("출근처리가 취소되었습니다.")   
			 return false;
		    }else{
		    	var code='${member.code}';
		    	$.ajax({
		    		type : "POST",
		    		url : "./time/timeInsert",
		    		data : {
		    			"memberCode" : code,
		    			"regdate" : date,
		    			"startTime" : time,
		    			"lastTime" : null
		    		},success : function(data){
		    			alert(data)
		    		},error : function(){
		    			alert("ERROR")
		    		}
		    		
		    	});
			$("#start").val(time);
		
		    }

		}); 
	 
	 
	 $("#last").click(function(){
		 var time=$("#demo_2").text();
		 var date=$("#demo_1").text();
		 var start=$("#start").val();

			if(start =="출근"){
				alert("출근처리 먼저 해주세요.")
				return false;
			}else if(confirm("퇴근처리 하시겠습니까?")==false){
				alert("퇴근처리가 취소되었습니다.")
				return false;
			}else{
				var code='${member.code}';
				
				$.ajax({
					type : "post",
					url : "./time/timeUpdate",
					data : { 
					   "memberCode" : code,
					   "regdate" : date,
					   "lastTime" :time,
					   },success : function(data){
						   alert(data);
					   },error : function(){
						   alert(error);
					   }
					
				});
				
			$("#last").val(time);
			}
	
			
	 });
		
	 /* 출퇴근 끝~~~ */
	 
	 
	});
</script>
<body>

	<div id="login_after_wrap">
		<div id="lofin_after_header">
			 <div id="lang_wrap">
				<div id="lang_icon">
					<i class="fa fa-globe" style="font-size:35px"></i>
				</div>
				 
			</div> 
			
			 <div id="menu_wrap">
					<table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row"><a href="${pageContext.request.contextPath}/">HOME</a></td>
						<td class="eb_row"><a href="${pageContext.request.contextPath}/erp">ERP</a></td>
						<td class="eb_row"><a href="${pageContext.request.contextPath}/groupware">Group Ware</a></td>
						<td class="eb_row"><a href="${pageContext.request.contextPath}/srm">SRM</a></td>
					</tr>
				</table> 
			</div> 
			
			<div id="search_wrap">
			
		        
		        <a href="./member/memberLogout">
					
		         	<span class="glyphicon glyphicon-log-out" id="eb_logoutBtn">Logout</span>
		       </a>
			</div>
			
		</div>
		
		<div id="login_after_middle">
			
			<div id="info_wrap">
				<div id="pro_info">
					<div id="pro_info_1">
						<div id="pro_img">
							<img src="${pageContext.request.contextPath}/resources/images/sidebar/avatar82.png" class="eb_default_img">
						
						<!-- 로그인하면 이름!!  -->
				
					    <p id="name_p">${member.name}님 
					    <i class="glyphicon glyphicon-time" style="font-size: 20px;" data-toggle="modal" data-target="#myModal" id="eb_timeBtn"></i> </p>
					
					
			<!--  출퇴근 modal-->
		
					<div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">출/퇴근 입력</h4>
					        </div>
					        <div class="modal-body">
					          <div class="eb_all">
								<div class="eb_clock_1">
									<canvas id="canvas">
									</canvas>
								</div>
									<div class="eb_blank"></div>
								<div class="eb_clock_2 w3-display-container"> 
									
									<p id="demo_1" >${sysdate }</p>
									
									 <img src="${pageContext.request.contextPath}/resources/images/common/label.png" class="eb_img"> 
									<p id="demo_2" class="w3-display-middle w3-large"></p>
								
								</div>
								
								
								<div class="eb_click">
									<p>
										<input type="button" class="w3-btn w3-red eb_btn" value="출근" id="start">
										<input type="button" class="w3-btn w3-red eb_btn" value="퇴근" id="last">
									</p>
							   </div>
					</div>
					          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					        </div>
					      
					  
					      </div>
					      
					    </div>
 				 </div>
  	
           <!--출퇴근 MODAL 끝  -->
					
					
					
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
				
				
				
				<div id="quick_menu" class="dropdown">
					<p id="quick_p">바로가기
					<a href="#" data-toggle="tooltip" title="바로가기 설정">
					<i class="fa fa-cog" style="font-size:20px; color : gray;"></i>
					</a>
	
						</p>




					<div id="quick_menu_box">
					<div class="quick_menu_box_1">
						<i class="glyphicon glyphicon-time" id="eb_check" ></i>
					
					</div>
					
					<div class="quick_menu_box_1">
						
					
					</div>
					
					<div class="quick_menu_box_1">
						
					
					</div>
					
					<div class="quick_menu_box_1">
						
					
					</div>
					
					</div>
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
				<div id="notice_wrap">
					<div id="notice_title">
						<p id="notice_title_p"><a href="../ware/community/communityList">Notice</a></p>
					</div>

					<div id="notice_icon">
						<i class="fa fa-bullhorn" style="font-size:48px;color: #CE3636"></i>
					</div>
					
					<c:forEach items="${randomList}" var="random">
						<div class="mySlides w3-animate-bottom" id="notice_text">
							<a href="#">${random.contents}</a>
						</div>
					</c:forEach>
					
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
				
				<div id="submenu_wrap">
					<div class="erp_jk_all">
	                  <div class="erp_jk_erp">
	                     
	                     <a href="#">
	                        <span class="erp_jk_inerp">
	                           <span class="erp_jk_bigdiv">회계</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="./erp/storeRegist">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">기초 정보</span>
	                       
	                        </span>
	                     </a> 
	                     
	                     <a href="./erp/chit">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">전표 관리</span>
	                           
	                        </span>
	                     </a> 
	                   
	                  </div>
	                  
	                  <div class="erp_jk_erp">
	                     
	                     <a href="#">
	                        <span class="erp_jk_inerp">
	                           <span class="erp_jk_bigdiv">영업/구매</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">기초정보</span>
	                         
	                           
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">구매관리</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">자재관리</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">반품관리</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">조회</span>
	                        </span>
	                     </a>
                 	 </div>
	                  <div class="erp_jk_erp">
	                     
	                     <a href="#">
	                        <span class="erp_jk_inerp">
	                           <span class="erp_jk_bigdiv">인사</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">기초정보</span>
	                    
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">사원관리</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">급여관리</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">근태관리</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">조회</span>
	                        </span>
	                     </a>
	                     
	                     <a href="./community/blackList">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">블랙 <br> 리스트</span>
	                        </span>
	                     </a>
	                  </div>
	                  <div class="erp_jk_erp">
	                     
	                     <a href="#">
	                        <span class="erp_jk_inerp">
	                           <span class="erp_jk_bigdiv">일정</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing">스케쥴</span>
	                        </span>
	                     </a> 
	                     
	                     <a href="#">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing" id="erp_jk_mr">
	                              	회의실<br>&nbsp;예약
	                           </span>
	                        </span>
	                     </a>
	                     
	                     <a href="./event/eventRegist">
	                        <span class="erp_jk_smalldiv">
	                           <span class="erp_jk_writing" id="erp_jk_mr">
	                              	이벤트<br>&nbsp;등록
	                           </span>
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
