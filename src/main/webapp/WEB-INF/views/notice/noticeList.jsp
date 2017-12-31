<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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
<link href="${url}/resources/css/notice/notice.css" rel="stylesheet">
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
						<!-- 부서별 링크 -->
						<div class="notice_jk_partBox">
							<a href="#">회계부</a> <a href="#">총무부</a> <a href="#">인사부</a> <a
								href="#">영업/구매부</a>
						</div>

						<!-- 검색창 -->
						<div class="notice_jk_searchBox">
							<select id="kind">
								<option>제목</option>
								<option>부서</option>
							</select> <input type="text" name="search" id="search" placeholder="검색어">
							<input type="button" value="검색" class="notice_jk_btn">
						</div>

						<!-- 리스트 보여지는 곳 -->
						<div class="notice_jk_listBox">
							<table class="table table-hover">
								<thead>
									<tr>
										<td>번호</td>
										<td>부서</td>
										<td>제목</td>
										<td>작성자</td>
										<td>작성일</td>
										<td>조회</td>
									</tr>
								</thead>
								<tr>
									<td>1</td>
									<td>관리부</td>
									<td><a href="#">회식일정입니다.</a></td>
									<td>이중기</td>
									<td>2017/12/28</td>
									<td>0</td>
								</tr>
								<tr>
									<td>1</td>
									<td>관리부</td>
									<td><a href="#">회식일정입니다.</a></td>
									<td>이중기</td>
									<td>2017/12/28</td>
									<td>0</td>
								</tr>
							</table>
							<input type="button" value="신규 등록" class="btn btn-default"
								id="enroBtn">
						</div>
					</div>

				</div>
			</form>
			<div id="login_after_footer"></div>
		</div>




	</div>
</body>
</html>