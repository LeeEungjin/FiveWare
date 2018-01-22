<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${list}" var="dto">
<tr>	
	<td>${dto.store}</td>
	<td><span>${dto.name}</span></td>
	<td>${dto.time}</td>
	<td><input type="button" class="eb_startTime" value="출근" title="${dto.name}"></td>
	<td><input type="button" class="eb_lastTime" value="퇴근" title="${dto.name}"></td>
</tr>
</c:forEach>