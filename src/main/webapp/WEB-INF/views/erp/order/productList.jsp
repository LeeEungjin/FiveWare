<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<c:forEach items="${productList}" var="productList"> 
	<tr>
		<td><input type="checkbox"></td>
		<td>${productList.code}</td>
		<td>${productList.name}</td>
		<td>${productList.standard}</td>
		<td>${productList.price}</td>
		<td><input id="${productList.code}" title="${productList.price}" class="product_amount" type="number"></td>
		<td><input type="number" readonly="readonly" id="product_total${productList.code}" class="product_total"></td>
	</tr>
</c:forEach>