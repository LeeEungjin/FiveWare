<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead>
		<tr>
			<th>코드</th>
			<th>계약일</th>
			<th>부서</th>
			<th>작성자</th>
			<th>거래처</th>
			<th>담당자</th>
			<th>납부처</th>
			<th>납부일</th>
			<th>창고명</th>
			<th>비고</th>
		</tr>
	</thead>
   
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.orderCode}</td>
				<td>${dto.contractDate}</td>
				<td>${dto.temp}</td>
				<td>${dto.name}</td>
				<td>${dto.account }</td>
				<td>${dto.division }</td>
				<td>${dto.delivery }</td>
				<td>${dto.condition }</td>
				<td>${dto.deadline }</td>
				<td>${dto.storageName }</td>
				<td>${dto.orderMemo }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>