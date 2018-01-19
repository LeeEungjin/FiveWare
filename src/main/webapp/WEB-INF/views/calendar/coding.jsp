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
			<form action="./calendarRemove" method="post" id="frmCalendarRemove">
		        <table class="table table-bordered">
		            <tr>
		                <th><input type='checkbox' onclick='checkAllDel(this.checked)' />전체</th>
		                <th>캘린더이름</th>
		                <th>캘린더코드</th>
		            </tr>
		            <c:forEach items="${items}" var="item">
		                <tr>
		                    <td><input type='checkbox' name='chkVal' value="${item.calendarId}" /></td>
		                    <td><input type="hidden" name='titles' value="${item.title}" />
		                        <a href="./schdule?calendarId=${item.calendarId}&title=${item.title}">${item.title}</a>
		                    </td>
		                    <td>${item.calendarId}</td>
		                </tr>
		            </c:forEach>
		        </table>
		    </form>
		    
		    <input type="button" class='btn btn-sm btn-warning' value="캘린더 생성"
		        onclick="calendarAddForm()" />
		    <input type="button" class='btn btn-sm btn-warning' value="캘린더 수정"
		        onclick="calendarModifyForm()" />
		    <input type="button" class='btn btn-sm btn-warning' value="캘린더 삭제"
		        onclick="calendarRemove()" />
		        
	    </div>
	        
	        
	    <!-- 캘린더 생성 modal -->
	    <div class="modal fade" id="calendarAddForm" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            	<!-- modal Header -->
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                    <h4 class="modal-title">캘린더 생성</h4>
	                </div>
	                
	                <!-- modal Body -->
	                <div class="modal-body">
	                    <!-- 캘린더 생성처리 form -->
	                    <form action="./calendarAdd" method='post' id='frmCalendarAdd'>
	                        <div class='form-group'>
	                            <label>캘린더이름</label>
	                            <input class='form-control' type="text" name='title' id='title' />
	                        </div>
	                        <!-- modal Footer -->
	                        <div class='modal-footer'>
	                            <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="calendarAdd()" /> 
	                                <input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
	                                <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    
	    <!-- 캘린더 수정 modal -->
	    <div class="modal fade" id="calendarModifyForm" role="dialog">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                    <h4 class="modal-title">캘린더 수정</h4>
	                </div>
	                <div class="modal-body">
	                    <!-- 캘린더 수정처리 form -->
	                    <form action="./calendarModify" method='post' id='frmCalendarModify'>
	                        <div class='form-group'>
	                            <label>캘린더이름</label>
	                            <input class='form-control' type="text" name='title' id='titleModify' />
	                        </div>
	                        <input type="hidden" name="calendarId" id='calendarIdModify' />
	                        <div class='modal-footer'>
	                            <input type="button" class='btn btn-sm btn-warning' value="확인" onclick="calendarModify()" /> 
	                            <input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
	                            <input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
	
</div>


</body>
</html>