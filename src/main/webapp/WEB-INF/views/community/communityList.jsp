<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${pageContext.request.contextPath}/resources/css/community/community.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			alert(message);
		}
		
		var kind='${pager.kind}';
		$(".op").each(function(){
			if($(this).val()==kind){
				$(this).attr("selected", true);
			}
		});
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = 'title';
			document.com_search_frm.curPage.value=cur;
			document.com_search_frm.search.value=s;
			document.com_search_frm.kind.value=t;
			document.com_search_frm.submit();
		});
	});
</script>
	
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<div id="fw_container">

	<div id="com_header">
		<div id="com_icon"></div><div id="com_title"></div>	
	</div>
	
	<div id="com_middle">
		<div id="com_sub_title">
			<a href="./communityList">전체</a>
			<a href="./communityList?temp=회계부">회계부</a>
			<a href="./communityList?temp=총무부">총무부</a>
			<a href="./communityList?temp=인사부">인사부</a>
			<a href="./communityList?temp=영업/구매부">영업/구매부</a>
			<a href="./communityList?temp=마케팅부">마케팅부</a>
		</div>
		
		<div id="com_contents">
			<form name="com_search_frm" action="./communityList" method="get">
			
			<input type="hidden" name="curPage" value="1">
			
			<div id="com_search">
				<select name="kind" class="form-control com_select">
			       <option value="title" class="op">제목</option>
			       <option value="writer" class="op">작성자</option>
			       <option value="contents" class="op">내용</option>
			    </select>
			    
			    <input name="search" type="text" class="form-control com_search_input">
			    
			    <button type="submit" class="btn btn-default com_search_btn">Search</button>
			</div>
			</form>
			
			<div id="com_table">
				<table class="table">
				    <thead>
				      <tr>
				        <th>No</th>
				        <th>제목</th>
				        <th>날짜</th>
				        <th>부서</th>
				        <th>작성자</th>
				        <th>조회수</th>
				      </tr>
				    </thead>
				    <tbody>
				    
				    <c:forEach items="${comList}" var="list" varStatus="i">
				      <tr>
				      	<td>${list.num}</td>
				      	
				      	<td>
				      	<c:choose>
				      		<c:when test="${reportList[i.index] gt 4}">
				      			신고된 게시물입니다.
				      		</c:when>
				      		
				      		<c:otherwise>
				      			 <a href="communityOne?num=${list.num}">${list.title}</a>
				      		</c:otherwise>
				      	</c:choose>
				      	</td>
				      	
				      	<td>${list.reg_date}</td>
				      	<td>${list.temp}</td>
				      	<td>${list.writer}</td>
				      	<td>${list.hit}</td>
				      </tr>
				    </c:forEach>
				    </tbody>
				 </table>
			</div>
		</div>
		
		<div id="com_pager">
			<div class="w3-bar w3-large">
				<c:if test="${pager.curBlock gt 1}">
				  <a title="${pager.startNum-1}" class="w3-button list">&laquo;</a>
				</c:if>
				
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				  <a title="${i}" class="w3-button list">${i}</a>
				</c:forEach>
				
				<c:if test="${pager.curBlock lt pager.totalBlock}">
				  <a title="${pager.lastNum+1}" class="w3-button list">&raquo;</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<div id="com_footer">
		<a href="communityWrite"><button type="button" class="btn btn-default">신규 등록</button></a>
	</div>
</div>


</body>
</html>