<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="eb_modal_div">
<c:forEach items="${list}" var="dto" end="0">
 <p>${dto.store}</p>
<p>${dto.regdate} ${dto.time}</p>
</c:forEach>
</div>

		<div id="eb_modal_div2">
			<table id="eb_modalT1">
				<tr>
					<td>상품명</td>
					<td>수량</td>
					<td>금액</td>
				</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td class="eb_madalTd">${dto.product}</td>
					<td class="eb_madalTd">${dto.salesAmount }</td>
					<td class="eb_madalTd">${dto.productSales }</td>
				</tr>
			</c:forEach>
			</table>
			
		</div>
			
			<div id="eb_modal_div3">
				<c:forEach items="${list}" var="dto" end="0">
				 <p id="eb_modal_p"> 총 금액 : ${dto.totalPrice}</p>
				</c:forEach>
			</div> 
				