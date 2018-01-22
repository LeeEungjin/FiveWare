<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

     	<table class="table">
			<thead>
				<tr>
					<th class="eb_modal_th">날짜</th>
					<th >메뉴</th>
					<th class="eb_modal_th">시간</th>
					<!-- <th></th> -->
				</tr>
			</thead>
							
			<tbody >
						
		<c:forEach items="${list }" var="dto">
			<tr class="eb_modal_tr"  title="${dto.num}">
				<td>${dto.regdate}</td>
				<td><span title="${dto.num}">${dto.product}</span></td>
				<td>${dto.time }</td>
				<%-- <td><input type="button" value="상세보기"  class="eb_modalView" title="${dto.num}"></td> --%>
			</tr>

		</c:forEach>
		</tbody>
							
	</table>