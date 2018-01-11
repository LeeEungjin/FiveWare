<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead>
		<tr>
			<th>메뉴코드</th>
			<th>구분</th>
			<th>메뉴명</th>
			<th>가격</th>
			<th>레시피</th>
			<th>설명</th>
			
		</tr>
	</thead>
   
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.menuCode }</td>
				<td>${dto.menuKind }</td>
				<td>${dto.menuName }</td>
				<td>${dto.price }</td>
				<td>${dto.recipe }</td>
				<td>${dto.menuOption }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>