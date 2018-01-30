<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet">
<title>일정관리</title>

<script type="text/javascript" src="${url}/resources/js/calendarList.js"></script>
<script type="text/javascript" src="${url}/resources/js/stringBuffer.js"></script>
<script type="text/javascript" src="${url}/resources/js/calendar.js"></script>
<script type="text/javascript" src="${url}/resources/js/calendarSchdule.js"></script>
<style type="text/css">

thead {
    text-align: center;
}
thead td {
    width: 100px;
}
#tbody td {
    height: 100px;
}
#yearMonth {
    font: bold;
    font-size: 18px;
}

a {
	cursor: pointer;
}

a:visited, a:hover, a:active {
	text-decoration: none;
}

.top-banner {
	display: block;
	max-width: 180px;
	padding-top: 50px;
}

.meetingTable td {
	width: 50%;
	height: 70px;
	text-align: center;
	line-height: 100px !important;
	cursor: pointer;
}

.meeting-active {
	background-color: lightblue;
	color: #fff;
	box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2);
}

#meetingResult {
	max-height: 100px;
	margin: 20px 0;
}

.timeBox {
	display: inline-block;
	width: 70px;
	height: 30px;
	border: 1px solid gray;
	margin: 5px 2.5px;
	padding: 5px 10px;
    border-radius: 4px;
    cursor: pointer;
}

.able {
	background-color: #fff !important;
}

.textContent {
	color:red; 
	font-size: 10px; 
	padding: 2px 10px;
}
</style>
</head>
<body>

<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 
<c:import url="/WEB-INF/views/message.jsp"></c:import> 

<div id="fw_container">

	<div id="free_header">
		<div id="free_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
		<div id="free_title">스케쥴</div>	
	</div>
	
	<div id="free_middle">
		<div class="middle_contents">
		    <input type="hidden" id="chk" value="0" />
		    <input type="hidden" id="calendarId" value="${calendarId}" />
		    <table class="table table-bordered">
		        <thead id='thead'>
		            <tr>
		                <td colspan="7">
		                	<div class="top-banner" style="float: left;">
		                		<c:if test="${title ne 'GroupWare'}">
		                        	<input class='btn btn-sm btn-info' type="button" value="회의실예약" onclick='reservMeeting()' /> 
		                    	</c:if>
		                    </div>
		                    <button type='button' class='btn btn-sm btn-warning' id='moveFastPre' onclick="moveFastMonthPre()">«</button>
		                    <button type='button' class='btn btn-sm btn-warning' id='movePre' onclick="moveMonthPre()">‹</button>    
		                    <span id='yearMonth'></span>   
		                    <button type='button' class='btn btn-sm btn-warning' id='moveNext' onclick="moveMonthNext()">›</button>  
		                    <button type='button' class='btn btn-sm btn-warning' id='moveFastNext' onclick="moveFastMonthNext()">»</button>
		                    <div class="top-banner" style="float: right;">
		                        <span>${title}</span> 
		                        <input class='btn btn-sm btn-info' type="button" value="주" onclick='tabWeek()' /> 
		                        <input class='btn btn-sm btn-info' type="button" value="월" onclick='tabMonth()' />
								<input class='btn btn-sm btn-info' type="button" value="목록" onclick='location.href="./coding"' />
		                    </div>
		                </td>
		            </tr>
		            <tr>
		                <td>일<span class='week'></span></td>
		                <td>월<span class='week'></span></td>
		                <td>화<span class='week'></span></td>
		                <td>수<span class='week'></span></td>
		                <td>목<span class='week'></span></td>
		                <td>금<span class='week'></span></td>
		                <td>토<span class='week'></span></td>
		            </tr>
		        </thead>
		        <tbody id='tbody'></tbody>
		    </table>
		    
		    <!-- 일정 생성 modal -->
		    <div class="modal fade" id="schduleForm" role="dialog">
		        <div class="modal-dialog">
		            <div class="modal-content">
		            	<!-- modal Header -->
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal">×</button>
		                    <h4 class="modal-title">일정등록</h4>
		                </div>
		                
		                <!-- modal Body -->
		                <div class="modal-body">
		                    <form class='form-margin40' role='form' action="#" method='post' id='frmSchdule'>
		                        <input type="hidden" id="calendarId" name="calendarId" value="${calendarId}" />
		                        <div class='form-group'>
		                            <label>제목</label> 
		                            <input type='text' class='form-control' id='summary' name='summary' placeholder="예: 오전 9시에 회의실예약">
		                        </div>
		                        <div class='form-group'>
		                            <label>시작시간</label> 
		                            <input class='form-control' type="time" id='startTime' name='startTime'>
		                        </div>
		                        <div class='form-group'>
		                            <label>시작날짜</label> 
		                            <input class='form-control startDate' type="date" id='startDate' name='startDate' readonly="readonly">
		                        </div>
		                        <div class='form-group'>
		                            <label>종료시간</label> 
		                            <input class='form-control' type="time" id='endTime' name='endTime'>
		                        </div>
		                        <div class='form-group'>
		                            <label>종료날짜</label>
									<input class='form-control startDate' type="date" id='endDate' name='endDate'>
		                        </div>
		                        <div class='form-group'>
		                            <label>내용</label>
		                            <textarea rows="7" class='form-control' id="description" name='description'></textarea>
		                        </div>
		                        
		                        <!-- modal Footer -->
		                        <div class='modal-footer'>
		                            <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="calendarSchduleAdd()" /> 
		                            <input type="reset"class='btn btn-sm btn-warning' value="초기화" /> 
		                            <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <!-- 일정 수정 modal -->
		    <div class="modal fade" id="schduleFormModify" role="dialog">
		        <div class="modal-dialog">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal">×</button>
		                    <h4 class="modal-title">일정수정</h4>
		                </div>
		                <div class="modal-body">
		                    <form class='form-margin40' role='form' action="#" method='post'
		                        id='frmSchduleModify'>
		                        <div class='form-group'>
		                            <label>제목</label> 
		                            <input type='text' class='form-control' id='modifySummary' name='summary'>
		                        </div>
		                        <div class='form-group'>
		                            <label>내용</label>
		                            <textarea rows="7" class='form-control' id="modifyDescription" name='description'></textarea>
		                        </div>
		                        <input type="hidden" id="modifyEventId" name="eventId" /> 
		                        <input type="hidden" name="calendarId" value="${calendarId}" />
		                        <div class='modal-footer'>
		                            <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="modifyEvent()" /> 
		                            <input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
		                            <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <!-- 회의실 예약 폼 -->
		    <div class="modal fade" id="meetingForm" role="dialog">
		        <div class="modal-dialog">
		            <div class="modal-content">
		            	<!-- modal Header -->
		                <div class="modal-header">
		                    <button type="button" class="close" data-dismiss="modal">×</button>
		                    <h4 class="modal-title">회의실 등록</h4>
		                </div>
		                
		                <!-- modal Body -->
		                <div class="modal-body">
		                    <form class='form-margin40' role='form' action="#" method='post' id='frmMeeting'>
		                     	<input type="hidden" name="calendarId" value="${calendarId}">
		                     	<div class='form-group'>
		                            <label>예약날짜</label> 
		                            <input type='date' class='form-control' id='reservDate' name='reservDate'>
		                            <input type="hidden" id="meetingName" name="meetingName" value="">
		                        </div>
		                     	
		                     	<table class="table table-bordered meetingTable">
		                     		<tr>
		                     			<td class="room" onclick="meetingRoom(0)">회의실A</td>
		                     			<td class="room" onclick="meetingRoom(1)">회의실B</td>
		                     		</tr>
		                     		<tr>
		                     			<td class="room" onclick="meetingRoom(2)">회의실C</td>
		                     			<td class="room" onclick="meetingRoom(3)">회의실D</td>
		                     		</tr>
		                     	</table>
		                     	
		                     	<div class='form-group'>
		                            <input type="button" class='form-control' onclick="meetingSearch()" value="예약 가능한 시간 찾기">
		                        </div>
		                     	
	                        	<input type="hidden" id="reservStartTime" name="reservStartTime" value="">
	                        	<input type="hidden" id="reservEndTime" name="reservEndTime" value="">
		                        
		                        <div id="meetingResult" class='form-group'>
		                        	<p class="textContent">*회의실 시간은 1시간을 기본으로 합니다</p>
		                        </div>
		                        
		                        <!-- modal Footer -->
		                        <div class='modal-footer'>
		                            <input type="button" class='btn btn-sm btn-warning' value="확인"onclick="meetingReserv()" /> 
		                            <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		</div>
	</div>
</div>
    
</body>
</html>