<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<p>받은 쪽지함</p>
<c:forEach items="${sList}" var="dto">
<div class="eb_MrList" title="${dto.num}">

	<p style="padding-left: 40%; padding-top: 10px;">${dto.regdate} ${dto.time}</p>
	<p style="padding-left: 10%;">보낸 사람 : ${dto.sName}
		<c:if test="${dto.read eq '읽지않음'}">
	
		<img src="${pageContext.request.contextPath}/resources/images/new.gif" id="eb_newImg">

	  </c:if>
	</p>


</div>

</c:forEach>