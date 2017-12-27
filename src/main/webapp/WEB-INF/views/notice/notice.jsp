<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#login_after_wrap {
	width: 100%;
	height: 100%;
	background-color: pink;
}

#lofin_after_header {
	width: :100%;
	height: 5%;
	background-color: gray;
}

#login_after_middle {
	width: 100%;
	height: 90%;
	background-color: beige;
}

#login_after_footer {
	width: 100%;
	height: 5%;
	background-color: gray;
}

#info_wrap {
	width: 25%;
	height: 100%;
	background-color: lightdray;
	float: left;
}

#contents_wrap {
	width: 75%;
	height: 100%;
	background-color: yellow;
	float: left;
}

#notice_wrap {
	width: 100%;
	height: 8%;
	background-color: red;
}

#menu_wrap {
	width: 100%;
	height: 92%;
	background-color: orange;
}

.notice_jk_img	{
	width: 8%;
	height: 8%;
}

.notice_jk_writing	{
	font-size: 40px;
	margin-left: 10px;
	padding-top: -10px;
	
}

.notice_jk_table	{
	margin: 0 auto;
	width: 90%;
	border-collapse: collapse;
	border: 1px solid black;
	text-align: center;
	font-size: 20px;
}

.notice_jk_tab	{
	margin: 0 auto;
	width: 90%;
	height: 10%;
	border: 1px solid black;
	
}

.notice_jk_innerTab	{
	float: left;
	font-size: 50px;
	margin-right: 8%;
}
</style>
</head>
<body>

	<div id="login_after_wrap">
		<div id="lofin_after_header"></div>

		<div id="login_after_middle">

			<div id="info_wrap"></div>

			<div id="contents_wrap">
				<div id="notice_wrap"></div>

				<div id="menu_wrap">
					
					<img src="../resources/notice/notice.PNG" class="notice_jk_img"><span class="notice_jk_writing">공지 사항</span>
					fffff
					<div class="notice_jk_tab">
						<div class="notice_jk_innerTab">이벤트</div>
						<div class="notice_jk_innerTab">부서</div>
						<div class="notice_jk_innerTab">지점</div>
					</div>
					
					<table class="notice_jk_table table table-hover">
						 <tr>
        					<td>번호</td>
        					<td>태그</td>
        					<td>제목</td>
        					<td>작성자</td>
        					<td>작성일</td>
        					<td>첨부</td>
        					<td>조회</td>
      					</tr>
      											
					</table>
				</div>

			</div>

		</div>

		<div id="login_after_footer"></div>
	</div>

</body>
</html>