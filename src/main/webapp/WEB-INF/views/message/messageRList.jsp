<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${sList}" var="dto">
	<p>받은 쪽지함</p>
<div class="eb_MrList" title="${dto.num}">

	<p style="padding-left: 65%;">${dto.time}</p>
	<p style="padding-left: 10%;">보낸 사람 : ${dto.sName}
		<c:if test="${dto.read eq '읽지않음'}">
	
		<img src="${pageContext.request.contextPath}/resources/images/new.gif" id="eb_newImg">

	  </c:if>
	</p>


</div>

</c:forEach>