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
<script src='${url}/resources/js/fullcalendar.min.js'></script>  


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
		      events: ${list}
		    	 
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
			
		<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span  id="eb_contents_text_p">출/퇴근조회</span>
				</div>
		<!-- contents -->
				 <div id='calendar'></div> 
				
			
					
		
				
			
   </div>
</div>
</div>

</body>
</html>