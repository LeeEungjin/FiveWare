<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WBS(Work Breakdown Structure) 목록</title>

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<script type="text/javascript" src="${url}/resources/js/projectList.js"></script>

</head>
<body>

	
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			클라우드
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu " data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				<a href="${url}/GroupWare/cloud/myCloud">내 드라이브</a>
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse " id="sub1">
				<ul>
					<c:forEach items="${folderList}" var="folder" varStatus="count">
						<li><a href="javascript:enterFolder('${filePath}', '${folder.name}')">${folder.name}</a></li>
					</c:forEach>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					<a href="${url}/GroupWare/wbs/projectList">프로젝트 관리</a>
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subselected  collapse in"  id="sub2">
				<ul>
					<c:forEach items="${prjLists}" var="dto">
						<li><a href="#" style="text-decoration: none;" onclick="projectSchdule('${dto.prj_no}')">${dto.prj_name}</a></li>
					</c:forEach>
				</ul>
			</div>
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		<div id="fw_main">
			<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
		</div>
		
		<div style="padding: 10px 15px; border-bottom: 1px solid black;">
			<h2>프로젝트 생성</h2>
		</div>
		
		<div style="margin-top: 30px;">
			<form action="./updateDelProject" method="post"
				id='frmUpdateDelProject'>
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td><input type='checkbox'
								onclick='checkAllDel(this.checked)' />전체</td>
							<td>번호</td>
							<td>프로젝트명</td>
							<td>시작일</td>
							<td>종료일</td>
						</tr>
					</thead>
					<c:forEach items="${prjLists}" var="dto">
						<tr>
							<td><input type='checkbox' name='chkVal'
								value="${dto.prj_no}" /></td>
							<td>${dto.prj_no}</td>
							<td><a href="#" style="text-decoration: none;" onclick="projectSchdule('${dto.prj_no}')">${dto.prj_name}</a></td>
							<td>${dto.prj_start}</td>
							<td>${dto.prj_last}</td>
						</tr>
					</c:forEach>
				</table>
			</form>
	
			<input class='btn btn-sm btn-warning btn-center' type='button' value='생성' onclick='insertProjectForm()'> 
			<input class='btn btn-sm btn-warning btn-center' type='button' value='삭제' onclick='updateDelProject()'>
	
		</div>
		<!-- 프로젝트일정 상세보기 -->
		<form action="./projectSchedule" method="post" id='projectSchedule'>
			<input type="hidden" name="prj_no" id='prj_no' value="" />
		</form>
	
		<!-- 프로젝트 생성 modal -->
		<div class="modal fade" id="insertProjectForm" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">프로젝트 생성</h4>
					</div>
					<div class="modal-body">
					
						<!-- 프로젝트 생성처리 form -->
						<form action="./insertProject" method='post' id='frmInsertProjcet'>
							<div class='form-group'>
								<label>프로젝트명</label> 
								<input class='form-control' type="text" name='prj_name' id='prj_name' />
							</div>
							<div class='form-group'>
								<label>시작일</label> 
								<input class='form-control' type="date" name='prj_start' id='prj_start' />
							</div>
							<div class='form-group'>
								<label>종료일</label> 
								<input class='form-control' type="date" name='prj_last' id='prj_last' />
							</div>
							<input type='hidden' name='dept_no' value='${memDto.dept_no}'>
							<div class='modal-footer'>
								<input type="button" class='btn btn-sm btn-warning' value="확인" onclick="insertProject()" />
								<input type="reset" class='btn btn-sm btn-warning' value="초기화" /> 
								<input type='button' class='btn btn-sm btn-warning' data-dismiss='modal' value="취소" />
							</div>
						</form>
						
					</div> <!-- END modal-body -->
					
				</div>
			</div>
		</div>
		
	</div>
</div>
</body>
</html>
