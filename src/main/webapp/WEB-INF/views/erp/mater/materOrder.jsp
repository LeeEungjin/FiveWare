<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table id="mater_modal_table" class="table">
	<thead>
		<tr>
			<th><input id="allCheck" type="checkbox"></th>
			<th>주문No</th>
			<th>제품코드</th>
			<th>수량</th>
			<th>주문금액</th>
			<th>계약일</th>
			<th>거래처</th>
			<th>창고이름</th>
		</tr>
	</thead>
								    
	<tbody>
		<c:forEach items="${ar}" var="ar"> 
			<tr>
				<td><input class="materCheck" type="checkbox"></td>
				<td>${ar.orderCode}</td>
				<td>${ar.orderProductDTO.code}</td>
				<td>${ar.orderProductDTO.amount}</td>
				<td>${ar.orderProductDTO.price}</td>
				<td>${ar.contractDate}</td>
				<td>${ar.account}</td>
				<td>${ar.storageName}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>