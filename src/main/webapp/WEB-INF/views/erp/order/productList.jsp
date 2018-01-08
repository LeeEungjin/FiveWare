<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

								<table id="or_modal_table" class="table">
								    <thead>
								      <tr>
								      	<th><input id="productList_all_ch" type="checkbox"></th>
								        <th>제품코드</th>
								        <th>제품명</th>
								        <th>규격</th>
								        <th>단가</th>
								        <th>수량</th>
								        <th>금액</th>
								      </tr>
								    </thead>
								    
								    <tbody id="productList_tbody">
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
								    </tbody>
								 </table>
   
