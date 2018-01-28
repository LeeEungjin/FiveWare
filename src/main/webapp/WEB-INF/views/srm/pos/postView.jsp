<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="pin">
	<img id="pin_img" src="${pageContext.request.contextPath}/resources/images/pos/pin.png">
</div>

<div id="postContents">
	<input class="postViewSkin" type="hidden" value="${view.skin}">
	<div id="postOneDate">${view.reg_date}</div>
	<div id="postBlank"></div>
	<div id="postOneContents">${view.contents}</div>
</div>

<div id="postClose">
	<input id="postCloseBtn" type="button" class="btn" value="닫기">
</div>