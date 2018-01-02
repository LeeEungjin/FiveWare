<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">



</style>
<link href="${url}/resources/css/notice/notice.css" rel="stylesheet">
</head>
<body>

	<c:import url="${url}/resources/temp/headerExample.jsp" />
	
	<div id="fw_container">

	<div id="login_after_wrap">
		<div id="lofin_after_header"></div>

		<div id="login_after_middle">

				<div id="menu_wrap">
					<!-- 공지사항 이미지 -->
					<img src="../resources/images/notice/notice.PNG" class="notice_jk_img"><span class="notice_jk_writing">공지 사항</span>
					
					<!-- 해당하는 부서별로 보여주는 탭 -->
					<div class="notice_jk_tab">
						<div class="notice_jk_innerTab"><p class="notice_jk_title"><a href="#">회계부</a></p></div>
						<div class="notice_jk_innerTab"><p class="notice_jk_title"><a href="#">인사부</a></p></div>
						<div class="notice_jk_innerTab"><p class="notice_jk_title"><a href="#">총무부</a></p></div>
						<div class="notice_jk_innerTab"><p class="notice_jk_title"><a href="#">영업/구매부</a></p></div>
					</div>
					
					<!-- 검색 -->
					<div class="notice_jk_btndiv">
					<select id="kind">
						<option>제목</option>
						<option>부서</option>
					</select>
					<input type="text" name="search" id="search" class="notice_jk_search">
					<input type="button" name="notice_jk_button" class="btn btn-default" id="searchBtn" value="검색">
					</div>
					
					<!-- 리스트 보여지는 부분 -->
					<table class="notice_jk_table table">
						 <tr>
        					<td>번호</td>
        					<td>부서</td>
        					<td>제목</td>
        					<td>작성자</td>
        					<td>작성일</td>
        					<td>첨부</td>
        					<td>조회</td>
      					</tr>
      											
					</table>
					<input type="button" class="btn btn-default" id="regBtn" value="신규 등록">
				</div>

		</div>

		<div id="login_after_footer"></div>
	</div>




</div>
</body>
</html>