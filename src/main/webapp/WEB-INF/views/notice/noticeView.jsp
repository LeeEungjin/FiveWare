<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

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
<link href="${url}/resources/css/notice/noticeView.css" rel="stylesheet">
</head>
<body>

	<c:import url="${url}/resources/temp/headerExample.jsp" />

	<div id="fw_container">

		<div id="login_after_wrap">
			<div id="lofin_after_header">
				<!-- 공지사항 글씨 -->

				<span class="notice_jk_title">공지 사항</span> <span
					class="notice_jk_subTitle">|</span> <span
					class="notice_jk_subTitle">각 부서별 소식을 알려드립니다.</span>

			</div>
			<form action="./noticeView" method="post">
				<div id="login_after_middle">
					<div id="menu_wrap">
						<!-- 리스트 보여지는 곳 -->
						<div class="notice_jk_listBox">
							<table class="table table-hover" id="notice_jk_table">
								<thead>
									<tr>
										<td class="notice_jk_td">${view.part}<!-- 부서이름 나오게, part --></td>
										<td class="notice_jk_td">${view.title}<!-- 제목이 나오게, title --></td>
										<td class="notice_jk_td">${view.writer}<!-- 작성자 나오게, writer --></td>
										<td class="notice_jk_td">${view.reg_date}<!-- 날짜 나오게, reg_date --></td>
									</tr>
								</thead>
								<tr>
									<td colspan="4" rowspan="4">
										<div class="notice_jk_textarea">${view.contents}<!-- 글 내용, contents --></div>
									</td>
								</tr>
							</table>
							<div class="button">
								<input type="button" value="목록으로" class="btn btn-default"
									id="enroBtn">
								
							</div>
							<input type="button" value="수정" class="btn btn-default"
								id="update">
								<!-- <input type="button" value="삭제" class="btn btn-default"
								id="delete"> -->
								<a od="delete" class="btn btn-default" href="./noticeDelete?num=${view.num}">Delete</a>
						</div>
					</div>

				</div>
			</form>
			<div id="login_after_footer"></div>
		</div>




	</div>
</body>
</html>