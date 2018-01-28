<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list }" var="dto">
<p class="eb_p"> <i class="glyphicon glyphicon-user"></i> ${dto.store } | ${dto.regdate}</p>
<p class="eb_p">${dto.contents }</p>
<div class="eb_line"></div>
</c:forEach>
