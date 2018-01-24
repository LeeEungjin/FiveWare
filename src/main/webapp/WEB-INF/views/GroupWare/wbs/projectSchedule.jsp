<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WBS(Work Breakdown Structure)</title>


<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<script type="text/javascript" src="./js/stringBuffer.js"></script>
<script type="text/javascript" src="./js/calendar.js"></script>
<script type="text/javascript" src="./js/makeRound.js"></script>
<script type="text/javascript" src="./js/projectSchdule.js"></script>

<style type="text/css">
input[type="text"]{
	border: 0px solid black;
	width: 100%;
}
</style>
</head>
<body>
	<form action="#" method="post" id='insertProjectSchdule'>
		<input type="hidden" id="prj_no" name='prj_no'
			value="${prjDto.prj_no}" />
		<table class="table table-bordered">
			<thead id='thead'>
				<tr>
					<td rowspan="5"><div style="width: 45px;"></div></td>
					<td rowspan="5"></td>
					<td rowspan="5">
						<div style="width: 450px;">
							<h1>업무구분</h1>
						</div>
					</td>
					<td rowspan="5"><div style="width: 80px;">책임자</div></td>
					<td><div style="width: 100px;">월</div></td>
				</tr>
				<tr>
					<td>주차</td>
				</tr>
				<tr>
					<td>일</td>
				</tr>
				<tr>
					<td>총진척률</td>
				</tr>
				<tr>
					<td>일간진척율</td>
				</tr>
				<tr>
					<td><input type='checkbox' onclick='checkAllDel(this.checked)' />전체
					</td>
					<td>
						<button type='button' class='btn btn-sm btn-info' onclick="listCreateTop()">생성</button>
					</td>
					<td><input type="text" name="prj_name" value="${prjDto.prj_name}"></td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody id='tbody'></tbody>
		</table>

		<input class='btn btn-sm btn-warning btn-center' type="button" value='저장' onclick='insertProjectSchdule()'> 
		<input class='btn btn-sm btn-warning btn-center' type='button' value='프로젝트 기간 수정' onclick='projectSchduleModal()'> 
		<input class='btn btn-sm btn-warning btn-center' type='button' value='삭제' onclick='checkListRemove()'> 
		<input class='btn btn-sm btn-warning btn-center' type='button' value='통계' onclick="progress()"> 
		<input class='btn btn-sm btn-warning btn-center' type='button' value='목록' onclick="location.href='./projectList.do'">
		
		<!-- 프로젝트기간 생성 modal -->
		<div class="modal fade" id="projectSchduleModal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">프로젝트 생성</h4>
					</div>
					<div class="modal-body">
						<div class='form-group'>
							<label>시작일</label> 
							<input class='form-control' type="date" id="prj_start" name='prj_start' value="${prjDto.prj_start}" />
						</div>
						<div class='form-group'>
							<label>종료일</label> 
							<input class='form-control' type="date" id="prj_last" name='prj_last' value="${prjDto.prj_last}" />
						</div>
					</div>
					<div class='modal-footer'>
						<input type="button" class='btn btn-sm btn-warning' value="확인" onclick="reScreenWriteThead()" /> 
						<input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>