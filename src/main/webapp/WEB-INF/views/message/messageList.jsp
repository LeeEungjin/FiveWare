<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<p>보낸 쪽지함</p>
<c:forEach items="${sList}" var="dto">
<div class="eb_MsList" title="${dto.num}">
	<p style="padding-left: 20%; padding-top: 10px;"> ${dto.regdate} ${dto.time}  | ${dto.read}</p>
	<p style="padding-left: 10%;">받는 사람 : ${dto.rName}</p>


</div>

</c:forEach>