<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
<link href="${pageContext.request.contextPath}/resources/css/free/free.css" rel="stylesheet">
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
			document.free_search_frm.curPage.value=cur;
			document.free_search_frm.search.value=s;
			document.free_search_frm.kind.value=t;
			document.free_search_frm.submit();
		});
		
		$(".freeView").click(function(){
			
			var num=$(this).attr("title");
			var target=$(this).attr("id");
			var kind=$("#memberKind").val();
			var memberName=$("#memberName").val();
			var writer=$("#writer").attr("title");
			
			var secret=$("#secret").val();
			
			if(target==secret || target=='전체' || memberName==writer){
				
				location.href="./freeView?num="+num;
				
			}else{
				
				alert("해당 글은 "+target+"에게만 공개된 게시물입니다.")
				
			}
		}); 
		
	});
</script>
	
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

<input type="hidden" id="memberName" value="${member.name}">
<input type="hidden" id="memberKind" value="${kind}">

<c:if test="${kind eq 'member'}">
	<input type="hidden" id="secret" value="${member.temp}">
</c:if>

<c:if test="${kind eq 'store'}">
	<input type="hidden" id="secret" value="${member.store}">
</c:if>

<div id="fw_container">

	<div id="free_header">
		<div id="free_icon"></div><div id="free_title"></div>	
	</div>
	
	<div id="free_middle">
		<div id="free_sub_title">
			<a href="./freeList">모두보기</a>
		
			<a href="./freeList?kind=target&target=전체">전체공개 보기</a>
			
			<c:if test="${kind eq 'member'}">
				<a href="./freeList?kind=target&target=${member.temp}">우리 부서 공개 보기</a>
			</c:if>
			
			<c:if test="${kind eq 'store'}">
				<a href="./freeList?kind=target&target=${member.store}">우리 지점 공개 보기</a>
			</c:if>
		</div>
		
		<div id="free_contents">
			<form name="free_search_frm" action="./freeList" method="get">
			
			<input type="hidden" name="curPage" value="1">
			
			<div id="free_search">
				<select name="kind" class="form-control free_select">
			       <option value="title" class="op">제목</option>
			       <option value="writer" class="op">작성자</option>
			       <option value="contents" class="op">내용</option>
			    </select>
			    
			    <input name="search" type="text" class="form-control free_search_input">
			    
			    <button type="submit" class="btn btn-default free_search_btn">Search</button>
			</div>
			</form>
			
			<div id="free_table">
				<table class="table">
				    <thead>
				      <tr>
				        <th>No</th>
				      	<th>공개 여부</th>
				        <th>제목</th>
				        <th>날짜</th>
				        <th>부서/지점</th>
				        <th>작성자</th>
				        <th>조회수</th>
				      </tr>
				    </thead>
				    <tbody>
				    
				    <c:forEach items="${freeList}" var="list" varStatus="i">
				      <tr>
				      	<td>${list.num}</td>
				      	<td>[${list.target}공개]</td>
				      	
				      	
				      	<td><p id="${list.target}" title="${list.num}" class="freeView">
				      	<c:catch>
							<c:forEach begin="1" end="${list.depth}">
								└
							</c:forEach>
						</c:catch>
				      	
				      	${list.title}</p></td>
				      	
				      	
				      	<td>${list.reg_date}</td>
				      	<td>${list.temp}</td>
				      	<td><p id="writer" title="${list.writer}">${list.writer}</p></td>
				      	<td>${list.hit}</td>
				      </tr>
				    </c:forEach>
				    </tbody>
				 </table>
			</div>
		</div>
		
		<div id="free_pager">
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
	
	<div id="free_footer">
		<a href="freeWrite"><button type="button" class="btn btn-default">신규 등록</button></a>
	</div>
</div>


</body>
</html>