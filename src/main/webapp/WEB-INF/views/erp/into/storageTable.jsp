<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead>
		<tr>
			<th>창고코드</th>
			<th>창고명</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
	</thead>
   
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.storageCode }</td>
				<td>${dto.storageName }</td>
				<td>${dto.storageOp }</td>
				<td>${dto.storageAddr }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>