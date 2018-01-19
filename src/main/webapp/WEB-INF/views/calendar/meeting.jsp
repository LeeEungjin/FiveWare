<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript" src="${url}/resources/js/calendarList.js"></script>

</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">

	<div id="com_header">
		<div id="com_icon"></div><div id="com_title"></div>	
	</div>
	
	<div id="com_middle">
		<div class="middle_contents">
			
			<!-- ************************회의실 생성/삭제****************************** -->
		    <form action="./meetingRemove" method="post" id="frmMeetingRemove" style="margin-top: 50px;">
		        <table class="table table-bordered">
		            <tr>
		                <th><input type='checkbox' onclick='checkAllDel(this.checked)' />전체</th>
		                <th>회의실이름</th>
		                <th>회의실코드</th>
		            </tr>
		            <c:forEach items="${meeting}" var="Mdto">
		                <tr>
		                    <td><input type='checkbox' name='chkVal' value="${Mdto.meetingId}" /></td>
		                    <td><input type="hidden" name='titles' value="${Mdto.meetingName}" />
		                        ${Mdto.meetingName}
		                    </td>
		                    <td>${Mdto.meetingId}</td>
		                </tr>
		            </c:forEach>
		        </table>
		    </form>
		    
		    <input type="button" class='btn btn-sm btn-warning' value="회의실 생성"
		        onclick="meetingAddForm()" />
		    <input type="button" class='btn btn-sm btn-warning' value="회의실 수정"
		        onclick="meetingModifyForm()" />
		    <input type="button" class='btn btn-sm btn-warning' value="회의실 삭제"
		        onclick="meetingRemove()" />
		    
	    </div>
	        
	        
	    <!-- 회의실 생성 modal -->
	    <div class="modal fade" id="meetingAddForm" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            	<!-- modal Header -->
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                    <h4 class="modal-title">회의실 생성</h4>
	                </div>
	                
	                <!-- modal Body -->
	                <div class="modal-body">
	                    <!-- 회의실 생성처리 form -->
	                    <form action="./meetingAdd" method='post' id='frmMeetingAdd'>
	                        <div class='form-group'>
	                            <label>회의실이름</label>
	                            <input class='form-control' type="text" name='meetingName' id='meetingName' />
	                        </div>
	                        <!-- modal Footer -->
	                        <div class='modal-footer'>
	                            <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="meetingAdd()" /> 
	                            <input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
	                            <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    
	    <!-- 회의실 수정 modal -->
	    <div class="modal fade" id="meetingModifyForm" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                    <h4 class="modal-title">캘린더 수정</h4>
	                </div>
	                <div class="modal-body">
	                    <!-- 회의실 수정처리 form -->
	                    <form action="./meetingModify" method='post' id='frmMeetingModify'>
	                        <div class='form-group'>
	                            <label>캘린더이름</label>
	                            <input class='form-control' type="text" name='meetingName' id='nameModify' />
	                        </div>
	                        <input type="hidden" name="calendarId" id='meetingIdModify' />
	                        <div class='modal-footer'>
	                            <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="meetingModify()" /> 
	                            <input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
	                            <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
			
	    </div><!-- end middle_contents -->
    </div>
	
</div>


</body>
</html>