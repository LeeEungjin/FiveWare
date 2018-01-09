<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

						<table class="table">
						    <thead>
						      <tr>
						        <th>주문코드</th>
						        <th>계약일</th>
						        <th>납기일</th>
						        <th>거래처</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <c:forEach items="${dateList}" var="dateList"> 
						      <tr>
						        <td class="orderView" title="${dateList.orderCode}" data-toggle="modal" data-target="#or_update_modal">${dateList.orderCode}</td>
						        <td>${dateList.contractDate}</td>
						        <td>${dateList.deadline}</td>
						        <td>${dateList.account}</td>
						      </tr>
						    </c:forEach>
						    </tbody>
						 </table>