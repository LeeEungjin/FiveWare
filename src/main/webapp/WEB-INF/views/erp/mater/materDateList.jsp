<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table">
    <thead>
      <tr>
        <th>입고코드</th>
        <th>입고일</th>
        <th>입고창고</th>
        <th>품목</th>
        <th>수량</th>
      </tr>
    </thead>
						    
    <tbody>
	    <c:forEach items="${dateList}" var="dateList"> 
	      <tr>
		      <td data-toggle="modal" data-target="#er_update_modal">${dateList.materCode}</td>
		      <td>${dateList.materDate}</td>
		      <td>${dateList.storageName}</td>
		      <td></td>
		      <td></td>
	      </tr>
	    </c:forEach>
	</tbody>
</table>


