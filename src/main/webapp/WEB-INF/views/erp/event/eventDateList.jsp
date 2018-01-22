<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
						<table class="table">
						    <thead>
						      <tr>
						        <th><input type="checkbox" id="allcheck"></th>
						        <th>코드</th>
						        <th>이벤트명</th>
						        <th>부서</th>
						        <th>기간</th>
						        <th>첨부파일</th>
						      </tr>
						    </thead>
						    
							<tbody>
							    <c:forEach items="${dateList}" var="list">
									<tr>
										<td><input type="checkbox" class="eventCheck" title="${list.eventNum}"></td>
										<td>${list.eventNum}</td>
										<td class="eventView" title="${list.eventNum}" data-toggle="modal" data-target="#jh_event_update_Modal">${list.eventName}</td>
										<td>${list.temp}</td>
										<td>${list.eventSdate}~${list.eventEdate}</td>
										<td><img src="${pageContext.request.contextPath}/resources/images/common/icon_file.gif"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>