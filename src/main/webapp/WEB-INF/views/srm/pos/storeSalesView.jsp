<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="eb_modal_div">
<p>${list.store}</p>
<p>${list.regdate} ${list.time}</p>
</div>

			<table id="eb_modalT1">
				<tr>
					<td>상품명</td>
				</tr>
			<c:forEach items="${ar1}" var="dto">
				<tr>
					<td class="eb_madalTr">${dto}</td>
				</tr>
			</c:forEach>
			</table>
			
			<table id="eb_modalT2">
				<tr>
					<td>수량</td>
				</tr>
		<c:forEach items="${ar2}" var="dto">
				<tr >
					<td class="eb_madalTr">${dto}</td>
				</tr>
			</c:forEach> 
			</table>
			
			<table id="eb_modalT3">
				<tr>
					<td>금액</td>
				</tr>
			<c:forEach items="${ar3}" var="dto">
				<tr >
					<td class="eb_madalTr">${dto}</td>
				</tr>
			</c:forEach> 
			</table>
			
			<div id="eb_modal_div2">
				<p id="eb_modal_p">총 금액 : ${list.totalPrice}</p>	
			</div>
				