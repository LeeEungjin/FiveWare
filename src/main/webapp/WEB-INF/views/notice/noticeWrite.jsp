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
			<form action="">
				<div id="login_after_middle">
					<div id="menu_wrap">
						<div class="notice_jk_tableBox">
							<table class="notice_jk_table">
								<tr>
									<td>부서</td>
									<td><select>
											<option>회계부</option>
											<option>총무부</option>
											<option>인사부</option>
											<option>영업/구매부</option>
									</select></td>
									<td>작성자</td>
									<td><input type="text" name="writer" id="writer"></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" id="title"></td>
									<td>등록일</td>
									<td><input type="text" name="title" id="title"></td>
								</tr>
								<tr>
									<td>에디터가 들어갈 자리</td>
								</tr>
							</table>
							<input type="button" value="등록" class="btn btn-default"
								id="writeBtn">
						</div>
					</div>
				</div>
			</form>
			<div id="login_after_footer"></div>
		</div>
	</div>
</body>
</html>