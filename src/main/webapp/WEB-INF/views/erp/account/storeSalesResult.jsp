<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.store }</td>
		<td>${dto.regdate}</td>
		<td>${dto.product}</td>
		<td>${dto.salesAmount}</td>
		<td>${dto.productSales }</td>
	</tr>

</c:forEach>