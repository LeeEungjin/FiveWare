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
<script type="text/javascript">
$("#delete").click(function(){
	var num= $(this).attr("name");
	$.ajax({
		url: "noticeFileDelete",
		type: "POST",
		data: {num: num},
		success: function(data){
			location.reload();
		}
	});
});
</script>
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
										<td class="notice_jk_td">
											부서 : <input type="text" name="part" id="part" value="${view.part}" readonly="readonly">
										</td>
										<td class="notice_jk_td">
											제목 : <input type="text" name="title" id="title" value="${view.title}" readonly="readonly">
										</td>
										<td class="notice_jk_td"> 
											작성자 : <input type="text" name="writer" id="writer" value="${view.writer}" readonly="readonly">
										</td>
										<td class="notice_jk_td">
											작성일 : <input type="text" name="reg_date" id="reg_date" value="${view.reg_date}" readonly="readonly">
											</td>
									</tr>
								</thead>
								<tr>
									<td colspan="4" rowspan="4">
										<div class="notice_jk_textarea">${view.contents}<!-- 글 내용, contents --></div>
									</td>
								</tr>
							</table>
							<div class="attat">
								첨부파일 : <c:forEach items="${view.fileNames}" var="file">
									<a href="../file/fileDown?fileName=${file.fileName}&oriName=${file.oriName}">${file.oriName}</a>
								</c:forEach>
							</div>							
							
							
							<div class="button">
								<a href="./noticeList" class="btn btn-default" id="enroBtn">목록으로</a>
								
							</div>
							
								<a id="delete" class="btn btn-default" name="${view.num}" href="./noticeDelete?num=${view.num}">삭제</a>
								<a href="./noticeUpdate?num=${view.num}" id="update" class="btn btn-default">수정</a>
								
						</div>
					</div>

				</div>
			</form>
			<div id="login_after_footer"></div>
		</div>




	</div>
</body>
</html>