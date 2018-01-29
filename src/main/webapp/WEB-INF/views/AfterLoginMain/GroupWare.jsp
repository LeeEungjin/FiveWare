<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
   <title>GROUPWARE</title>
<link href="./resources/css/groupware.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- clock library Start -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
<script src="./resources/js/clock.js"></script>
<link href="./resources/css/common/clock.css" rel="stylesheet" />
<!-- clock library End -->

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
       x[slideIndex-1].style.display = "inline-block"; 
       setTimeout(carousel, 3000); 
   }

   $(function(){
      
      carousel();
      
      $('[data-toggle="tooltip"]').tooltip();  
      
      $("#logout_btn_1").click(function(){
         var kind='${kind}';
      
         alert("kind : "+kind);
            
         
      });
   })
</script>
<body>

	<div id="login_after_wrap">
		<div id="lofin_after_header">
			 <div id="lang_wrap">
				<div id="lang_icon">
					<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogoBlack.png">
				</div>
		  
			</div> 
			
		 	 <div id="menu_wrap">
				 <table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row"><a href="${pageContext.request.contextPath}/"  style="color: white;, text-decoration: none;">HOME</a></td>
						<td class="eb_row"><a href="${pageContext.request.contextPath}/erp"  style="color: white;, text-decoration: none;">ERP</a></td>
						<td class="eb_row"><a href="${pageContext.request.contextPath}/GroupWare"  style="color: white;, text-decoration: none;">Group Ware</a></td>
						<td class="eb_row"><a href="${pageContext.request.contextPath}/srm"  style="color: white;, text-decoration: none;">SRM</a></td>
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
							<img  id="loginAfterImg" src="${pageContext.request.contextPath}/resources/images/sidebar/avatar82.png" class="eb_default_img">
						</div>
					</div>
					<div id="pro_info_2">
						<p id="name_p">${member.name } 님</p>
					</div>
				</div>
				<div id="sche_info">
					<!-- Clock API Start -->
					<div id="clock" class="light">
						<div class="display">
							<div class="weekdays"></div>
							<div class="ampm"></div>
							<div class="digits"></div>
						</div>
					</div>
					<!-- Clock API End -->
				</div>
				
			<div class="eb_line"></div>
				
				<div id="sche_add">
					<i class="fa fa-calendar-plus-o" style="font-size:25px; padding-top:10px;">Calendar</i>
               <p id="sche_p" style="font-size: 20px"><a href="calendar/coding" style="color: gray">일정 등록하기 <i class="fa fa-plus-square-o" style="font-size:23px;"></i></a></p>
            </div>
            <div id="quick_menu">
               <p id="quick_p">바로가기
                  <a href="#" data-toggle="tooltip" title="바로가기 메뉴입니다.">
                  <i class="fa fa-cog" style="font-size:20px; color : gray;"></i>
                  </a>
               </p>
               
            
               
               <div id="quick_menu_box">
                        <!-- 공지사항 -->
                     <div class="quick_menu_box_1">
                        <a style="color: black;, text-decoration: none;" href="../../ware/free/freeList"><i class="fa fa-list" style="font-size:45px" data-toggle="tooltip" data-placement="bottom" title="게시판"></i></a>
                     </div>
                     
                     <!-- 쪽지 -->
                     <!-- <div class="quick_menu_box_1">
                        <i class="fa fa-envelope-o" style="font-size:45px" data-toggle="tooltip" data-placement="bottom" title="쪽지"></i>
                     </div> -->
                     
                     <!-- 마이페이지 -->
                       <div class="quick_menu_box_1">
                              <a href="./myPage/myPageMain" style="color : black;">
                                 <i class="fa fa-user-circle-o" style="font-size:45px"  data-toggle="tooltip" data-placement="bottom" title="마이페이지"></i>
                              </a>
                              
                           </div>
                     
                     <!-- 사다리타기 -->
                     <div class="quick_menu_box_1" data-toggle="modal" data-target="#game">
                        <img id="ladderImg" src="./resources/images/shortCut/ladder.png" data-toggle="tooltip" data-placement="bottom" title="사다리 게임">
                     </div>
                     
                     
                     <!-- 사다리 타기 모달 -->
                      <div class="modal fade" id="game">
                         <div class="modal-dialog">
                           <div class="modal-content">
                           
                             <!-- Modal Header -->
                             <div class="modal-header">
                               <h4 class="modal-title">사다리 타기</h4>
                               <button type="button" id="ladderClose" class="close" data-dismiss="modal">&times;</button>
                             </div>
                             
                             <!-- Modal body -->
                             <div class="modal-body">
                               <!--    참여 인원 : <input id="gamePeople" type="number"><input id="gamePeopleBtn" type="button" value="확인">
                                
                                <div id="game_contents">
                                   
                                </div> -->
                                
                                <div class="landing" id="landing">
                                  <div class="start-form">
                                       <div class="landing-form">
                                           <div class="group">      
                                             <input type="text" name="member" required>
                                             <span class="highlight"></span>
                                             <span class="bar"></span>
                                             <label>참여자 수</label>
                                               <div  id="button" class="button raised green">
                                                 <div  class="center" fit>START</div>
                                                 <paper-ripple fit></paper-ripple>
                                               </div>
                                           </div>
                                       </div>
                                  </div>
                               </div>
                               <div id="ladder" class="ladder">
                                   <div class="dim"></div>
                                    <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
                               </div>
                           <script src="./resources/js/ladder.js"></script>
                             
                             </div>
                             
                           </div>
                         </div>
                       </div>
                  
               </div>
            </div>
            
            
            <!-- <div id="often_call">
               <p id="quick_p">자주 연락하는 사람들</p>
               <i class="fa fa-address-book-o" style="font-size:36px">Call</i>
               <i class="fa fa-cog" style="font-size:24px"></i>
            </div> -->            
         </div>
         
         
         <div id="contents_wrap">
            <div id="notice_wrap">
               <div id="notice_title">
                  <p id="notice_title_p">게시판</p>
               </div>

               <!-- <div id="notice_icon">
                  <i class="fa fa-bullhorn" style="font-size:30px;color:#CE3636"></i>
               </div> -->
               
               <c:forEach items="${randomList}" var="random">
                  <div  class="mySlides w3-animate-bottom" id="notice_text">
                     <a href="#">${random.contents}</a>
                  </div>
               </c:forEach>
               
               <!-- <div id="weather_div">
                  <i class="fa fa-cloud weather_div_p" style="font-size:36px">Weather</i>
               </div>
               
               <div id="skin_icon">
                  <i class="fa fa-desktop weather_div_p" style="font-size:36px"></i>
               </div>
               
               <div id="edit_icon">
                  <i class="fa fa-cog weather_div_p" style="font-size:36px;"></i>
               </div> -->
            </div>
            
            <div id="submenu_wrap">
               <div class="groupWare_jk_all">
                  <div class="groupWare_jk_groupWare">
                     
                        <span class="groupWare_jk_inerp"> 
                           <span class="groupWare_jk_bigdiv">전자결재</span>
                        </span>
                     

                    <a href="${pageContext.request.contextPath}/GroupWare/epayment/formList?curPage=1">


                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">서식함</span>
                        </span>
                     </a> 
                     
                     <a href="${pageContext.request.contextPath}/GroupWare/epayment/epaymentPendency"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">결재함</span>
                        </span>
                     </a> 
                     
                     <a href="#"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">발신함</span>
                        </span>
                     </a> 
                     
                     <a href="#"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">수신함</span>
                        </span>
                     </a>
                  </div>
                  <div class="groupWare_jk_groupWare">
                     
                        <span class="groupWare_jk_inerp"> 
                           <span class="groupWare_jk_bigdiv">게시판</span>
                        </span>
                     
                     <a href="../ware/free/freeList"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">답글<br>게시판</span>
                        </span>
                     </a> 
                     
<!--                      <a href="#"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">자유게시판</span>
                        </span>
                     </a> -->
                  </div>
                  <div class="groupWare_jk_groupWare">
                     
                        <span class="groupWare_jk_inerp"> 
                           <span class="groupWare_jk_bigdiv">일정관리</span>
                        </span>
                     
                     <a href="../ware/calendar/coding"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">전체 스케쥴</span>
                        </span>
                     </a>
                  </div>
                  <div class="groupWare_jk_groupWare">
                     
                      <span class="groupWare_jk_inerp"> 
                         <span class="groupWare_jk_bigdiv">클라우드</span>
                      </span>
                     
                      <a href="${pageContext.request.contextPath}/GroupWare/cloud/myCloud"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing" id="groupWare_jk_file">파일공유<br> 및<br> 다운로드</span>
                        </span>
                     </a>
                     
                     <a href="${pageContext.request.contextPath}/GroupWare/wbs/projectList"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing" id="groupWare_jk_file">프로젝트&nbsp;<br>생성 및<br> 관리</span>
                        </span>
                     </a>
                  </div>
                  <div class="groupWare_jk_groupWare">
                        <span class="groupWare_jk_inerp"> 
                           <span class="groupWare_jk_bigdiv ">마이 페이지</span>
                        </span>
                     
              
                          <a href="./myPage/myPageMain">
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">내 정보</span>
                        </span>
                     </a> 
                     
                     <a href="./myPage/timeRecord?memberCode=${member.code }"> 
                        <span class="groupWare_jk_smalldiv"> 
                           <span class="groupWare_jk_writing">출/퇴근 기록</span>
                        </span>
                     </a>
                  </div>
               </div>
               
            </div>
         
         </div>
         
      </div>
      
      <div id="login_after_footer">
      Copyright © 2018 KH Information Educational | FiveWare | EungJin EunBi ARin JiHyun
      </div>
   </div>

</body>
</html>