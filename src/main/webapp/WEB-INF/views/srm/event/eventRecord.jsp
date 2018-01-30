<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${url}/resources/css/myPage/myPage.css" rel="stylesheet">

<link href='${url}/resources/css/fullCalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='${url}/resources/css/fullCalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='${url}/resources/js/moment.min.js'></script>
<%-- <script src='${url}/resources/js/jquery.min.js'></script> --%>
<script src='${url}/resources/js/fullcalendar.min.js'></script>


<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 	
	 	
		 var message = '${message}';
	     if(message != ""){
	        swal(message);
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
	 
	
		
		$('#calendar').fullCalendar({
		      header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month,basicWeek,basicDay'
		      },
		      defaultDate: '${sysdate}',
		      navLinks: true, // can click day/week names to navigate views
		      editable: false,
		      eventLimit: true, // allow "more" link when too many events
		      events: ${list1}
		    	 
		});

	 
 });
 
 
 
 
</script>

<style type="text/css">


  #calendar {
    width: 750px;
    margin: 0 auto;
    margin-top: 20px;
  }




</style>
</head>

<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 


<div id="fw_container">
<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			이벤트 & 공모전
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				이벤트
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> <a href="${url }/srm/event/eventList?perPage=5&curPage=1">이벤트 현황</a> </li>
					<li> <a href="${url }/srm/event/eventRecord">이벤트 스케줄 </a></li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu  " data-toggle="collapse" data-target="#sub2" title="sub2" >
					공모전
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse  "  id="sub2">
				<ul>
					<li> <a href="${url }/srm/contest/contestList">공모전 현황 </a></li>
					<li>  <a href="${url }/srm/contest/contest">공모전 참가</a> </li>
				</ul>
			</div>
		

</div>
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
				<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span  id="eb_contents_text_p">이벤트 스케줄</span>
				</div>
		<!-- contents -->
				 <div id='calendar'></div>
				
				<%-- <table>
					<tr>
						<td>날짜</td>
						<td>출근</td>
						<td>퇴근</td>
					</tr>
					
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.regdate }</td>
							<td>${dto.startTime }</td>
							<td>${dto.lastTime }</td>
						</tr>
					
					</c:forEach>
				
				</table> --%>
					
		
				
			
   </div>
</div>
</div>

</body>
</html>