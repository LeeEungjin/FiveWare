<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<c:forEach items="${productList}" var="productList"> 
	<tr>
		<td><input title="${productList.code}" id="${productList.code}code" class="productList_ch" type="checkbox"></td>
		<td><input type="hidden" id="name_code${productList.code}" value="${productList.code}">${productList.code}</td>
		<td>${productList.name}</td>
		<td>${productList.standard}</td>
		<td>${productList.price}</td>
		<td><input id="${productList.code}" disabled="disabled" title="${productList.price}" class="product_amount" type="number"></td>
		<td><input readonly="readonly" type="number" id="product_total${productList.code}" class="product_total"></td>
	</tr>
</c:forEach>