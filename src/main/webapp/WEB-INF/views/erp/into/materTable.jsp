<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead>
		<tr>
			<th>코드</th>
			<th>날짜</th>
			<th>부서</th>
			<th>담당자</th>
			<th>비고</th>
		</tr>
	</thead>
   
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.materCode }</td>
				<td>${dto.materDate }</td>
				<td>${dto.temp }</td>
				<td>${dto.name }</td>
				<td>${dto.materMemo }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>