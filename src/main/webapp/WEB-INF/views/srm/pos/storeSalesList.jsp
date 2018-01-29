<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


     	<table class="table">
			<thead>
				<tr>
					<th class="eb_modal_th">영업 날짜</th>
					<th>총 금액</th>
					<th class="eb_modal_th">시간</th>
					<!-- <th></th> -->
				</tr>
			</thead>
							
			<tbody >
						
		<c:forEach items="${list }" var="dto">
			<tr class="eb_modal_tr"  title="${dto.num}">
				<td>${dto.regdate}</td>
				<td><span title="${dto.num}">${dto.totalPrice}</span></td>
				<td>${dto.time }</td>
			</tr>

		</c:forEach>
		</tbody>
							
	</table>