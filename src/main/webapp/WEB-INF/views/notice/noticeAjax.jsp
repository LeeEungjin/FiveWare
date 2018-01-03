<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover">
	<thead>
		<tr>
			<td>번호</td>
			<td>부서</td>
			<td>제목</td>
			<td>내용</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회</td>
		</tr>
	</thead>
	<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.num}</td>
			<td>${dto.part}</td>
			<td><a href="./noticeView?num=${dto.num}">${dto.title}</a></td>
			<td>${dto.contents}</td>
			<td>${dto.writer}</td>
			<td>${dto.reg_date}</td>
			<td>${dto.hit}</td>
		</tr>
	</c:forEach>
</table>
<div class="pagination">
	<c:if test="${pager.curBlock gt 1}">
		<span class="list" title="${pager.startNum-1}">[이전]</span>
	</c:if>
	<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
		<span class="list" title="${i}">${i}</span>
	</c:forEach>
	<c:if test="${pager.curBlock lt pager.totalBlock}">
		<span class="list" title="${pager.lastNum+1}">[다음]</span>
	</c:if>
</div>
<a href="noticeWrite" class="btn btn-default" id="writeBtn">신규 등록</a>