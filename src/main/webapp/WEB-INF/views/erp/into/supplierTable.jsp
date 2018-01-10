<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead>
		<tr>
			<th>코드</th>
			<th>거래처 분류</th>
			<th>거래처명</th>
			<th>사업자번호</th>
			<th>대표자</th>
			<th>담당자</th>
			<th>담당자 메일</th>
			<th>은행</th>
			<th>계좌번호</th>
			<th>사용</th>
		</tr>
	</thead>
   
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.code }</td>
				<td>${dto.classification }</td>
				<td>${dto.name }</td>
				<td>${dto.business_number }</td>
				<td>${dto.representative }</td>
				<td>${dto.division }</td>
				<td>${dto.division_mail }</td>
				<td>${dto.bank }</td>
				<td>${dto.account_number }</td>
				<td>${dto.use }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>