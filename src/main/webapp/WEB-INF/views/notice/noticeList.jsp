<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"
	var="url" />
<c:import url="${url}/resources/temp/ref.jsp" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="${url}/resources/css/notice/notice.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		var message = '${message}';
		if (message != '') {
			alert(message);
		}

		$(".w3-button").click(function() {
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			var temp = '${temp}';
			document.frm.curPage.value = cur;
			document.frm.search.value = s;
			document.frm.kind.value = t;
			document.frm.temp.value = temp;
			document.frm.submit();
		});
		
		$(".acc").click(function(e){
			e.stopPropageation();
			e.preventDefault();
			
			var id=$(this).attr("title");
			
			 $("#"+id).addClass("active"); 
		});
			
	});
</script>
<style type="text/css">
.list {
	cursor: pointer;
}
</style>
</head>
<body>

	<c:import url="${url}/resources/temp/headerExample.jsp" />

	<div id="fw_container">

		<div id="login_after_wrap">
			<div id="lofin_after_header">

			</div>
			
			<!-- 공지사항 글씨 -->

				<span class="notice_jk_title">공지 사항</span> <span
					class="notice_jk_subTitle">|</span> <span
					class="notice_jk_subTitle">각 부서별 소식을 알려드립니다.</span>
			
			<form action="./noticeList" name="frm" method="post">
				<input type="hidden" name="temp">
				<input type="hidden" name="curPage" value="1">
				<div id="login_after_middle">
					<div id="menu_wrap">
						<!-- 부서별 링크 -->
						
						<div class="notice_jk_partBox" >
							  <ul class="nav nav-tabs notice_nav">
							    <li id="notice_All" class="active"><a href="./noticeList" title="notice_All" class="acc">전체</a></li>
							    <li id="notice_1"><a href="./noticeList?temp=회계부" title="notice_1" class="acc">회계부</a></li>
							    <li id="notice_2"><a href="./noticeList?temp=총무부" title="notice_2" class="acc">총무부</a></li>
							    <li id="notice_3"><a href="./noticeList?temp=인사부" title="notice_3" class="acc">인사부</a></li>
							    <li id="notice_4"><a href="./noticeList?temp=영업/구매부" title="notice_4" class="acc">영업/구매부</a></li>
							    <li id="notice_5"><a href="./noticeList?temp=마케팅부" title="notice_5" class="acc">마케팅부</a></li>
							  </ul>
						</div>

						<!-- 검색창 -->
						<div class="notice_jk_searchBox">
							<select name="kind" id="kind" class="form-control">
								<option selected="selected">title</option>
								<option>writer</option>
							</select> <input type="text" name="search" id="search" class="form-control" placeholder="검색어">
							<button class="btn btn-default" id="searchBtn">검색</button>
						</div>

						<!-- 리스트 보여지는 곳 -->
						<div class="notice_jk_listBox">
							<table class="table">
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
								<c:forEach items="${list}" var="dto">
									<tr>
										<td>${dto.num}</td>
										<td>${dto.temp}</td>
										<td><a href="./noticeView?num=${dto.num}">${dto.title}</a></td>
										<td>${dto.writer}</td>
										<td>${dto.reg_date}</td>
										<td>${dto.hit}</td>
									</tr>
								</c:forEach>
							</table>
							
							<div class="w3-bar">
									<c:if test="${pager.curBlock gt 1}">
										<a class="w3-button" title="${pager.startNum-1}">[이전]</a>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
										var="i">
										<a class="w3-button" title="${i}">${i}</a>
									</c:forEach>
									<c:if test="${pager.curBlock lt pager.totalBlock}">
										<a class="w3-button" title="${pager.lastNum+1}">[다음]</a>
									</c:if>
							</div>
							
							<a href="noticeWrite" class="btn btn-default" id="writeBtn">신규 등록</a>
							
						</div>
					</div>

				</div>
			</form>
			<div id="login_after_footer"></div>
		</div>




	</div>
</body>
</html>