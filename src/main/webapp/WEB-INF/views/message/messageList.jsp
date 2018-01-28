<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>보낸 쪽지함</p>
<c:forEach items="${sList}" var="dto">
<div class="eb_MsList" title="${dto.num}">
	<p style="padding-left: 70%;"> ${dto.time}</p>
	<p style="padding-left: 10%;">받는 사람 : ${dto.rName} | ${dto.read}</p>


</div>

</c:forEach>