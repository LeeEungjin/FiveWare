<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

 	<c:forEach items="${list}" var="dto">
		 <tr class="eb_table">
			<td><input type="radio" value="${dto.temp}"  name="temp">${dto.code}</td>
			<td>${dto.temp}</td>
		 </tr>
	</c:forEach>	 