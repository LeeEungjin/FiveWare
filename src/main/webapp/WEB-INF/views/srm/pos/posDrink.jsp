<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:forEach items="${pos_menu}" var="dto">
	  	<tr>
	   	   <td><p class="eb_menu" title="${dto.price}">${dto.menuName}</p></td>
	   	   <td><p class="eb_menuPrice" >${dto.price}</p></td>
	    </tr>
	</c:forEach>
   