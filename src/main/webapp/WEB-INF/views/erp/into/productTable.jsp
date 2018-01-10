<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead>
		<tr>
			<th>품목코드</th>
			<th>품목명</th>
			<th>규격</th>
			<th>개요</th>
			<th>가격</th>
			<th>사용</th>
			
		</tr>
	</thead>
   
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.code }</td>
				<td>${dto.name }</td>
				<td>${dto.standard }</td>
				<td>${dto.memo }</td>
				<td>${dto.price }</td>
				<td>${dto.use }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>