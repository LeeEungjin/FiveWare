<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set
	value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"
	var="url" />
<c:import url="${url}/resources/temp/ref.jsp" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.modal-content {
	width: 400px;
	height: 250px;
}

.modal-title {
	font-size: 25px;
}

.modal-table	{
	max-width: 100%;
	width: 100%;
}

.modal-content	{
	height: auto;
}

.choice_date	{
	margin-bottom: 3%;
}

.choice_meeting	{
	margin-bottom: 3%;
	display: none;
}

.choice_part	{
	display: none;
}

.choice_time	{
	display: none;
}

.choice_contents	{
	margin-top: 5px;
	display: none;
}

.choice_meeting select	{
	width: 39%;
	height: 9%;
}

.choice_part select {
	margin-top: 5px;
	width: 39%;
	height: 9%;
}

.choice_time select	{
	margin-top: 5px;
	width: 39%;
	height: 9%;
}
</style>

<script type="text/javascript">
	$(function(){
		$(".choice_date").on("change", function(){
			$(".choice_part").css("display", "block");
		});
		$(".choice_part").on("change", function(){
			$(".choice_time").css("display", "block");
		});
		$(".choice_time").on("change", function(){
			$(".choice_contents").css("display", "block");
		});
	});
</script>
</head>
<body>
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">회의실 예약</button>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<form action="./meetingRoom" method="post">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<span class="modal-title">회의실 예약</span>
				</div>
				<div class="modal-body">
					<div class="choice_date">
						날짜 선택 : &nbsp;&nbsp;&nbsp;&nbsp;<input type="date" id="room_date" name="room_date">
					</div>
					<div class="choice_meeting">
						회의실 선택 : 
						<select id="room">
							<option>A 회의실</option>
							<option>B 회의실</option>
							<option>C 회의실</option>
							<option>D 회의실</option>
						</select>
					</div>
					<div class="choice_part">
						부서 선택 : &nbsp;&nbsp;&nbsp;
						<select id="part">
							<option>회계부</option>
							<option>총무부</option>
							<option>인사부</option>
							<option>영업/구매부</option>
							<option>마케팅부</option>
						</select>
					</div>
					<div class="choice_time">
						시간 선택 : &nbsp;&nbsp;&nbsp;
						<select class="time">
							<option>09:00~10:00</option>
							<option>10:00~11:00</option>
							<option>11:00~12:00</option>
							<option>12:00~13:00</option>
							<option>13:00~14:00</option>
							<option>14:00~15:00</option>
							<option>15:00~16:00</option>
							<option>16:00~17:00</option>
							<option>17:00~18:00</option>
						</select>
					</div>
					<div class="choice_contents">
					 회의 내용 : &nbsp;&nbsp;&nbsp;
						<input type="text" id="contents" name="contents" class="contents">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" >예약</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
</html>