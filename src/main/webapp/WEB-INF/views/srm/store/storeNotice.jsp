<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/srm/store.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 
		 var message = '${message}';
	     if(message != ""){
	        alert(message);
	     }
	 
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
		});
		
		/*page 처리  */
		  $(".eb_list").click(function(){
				
				var cur=$(this).attr("title");
				var s = '${pager.search}';
				var t = '${pager.kind}';
				document.frm.curPage.value=cur;
				document.frm.search.value=s;
				document.frm.kind.value=t;
				document.frm.submit();
			});
	 

	 
 });
 
 
 
 
</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample_srm.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			게시판
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				게시판
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/srm/storeNotice">자유 게시판</a></li>
				</ul>
			</div>
			
	

		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
				<table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row">전체 지점 정보</td>
						<td class="eb_row">우리 매장 관리</td>
						<td class="eb_row">이벤트</td>
						<td class="eb_row">공지사항</td>
					</tr>
				</table>
			</div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">자유게시판</span>
				</div>
				
		
			 	
				<div id="eb_contents_box">
				  <div class="eb_blank"></div>
					
					
				<!-- 검색 -->
				   <input type="hidden" name="curPage" value="1">
					
					
				<form name="frm" action="./storeNotice" method="get">
					<div id="eb_contents_box_div" >
						<input type="hidden" name="curPage" value="1">
						  	
						  	<select name="kind">
						  		<option value="store">지점명</option>
						  		<option value="title">제목</option>
						  		<option value="contents">내용</option>
						  	</select>
						  	
						<input type="text" name="search">
						
						  <button class="btn btn-default">search</button>
						
						</div>
				</form>		
				   <!--검색 끝 -->
				 
				</div> 
				
				
				<div id="eb_contents_table">
				  	
             				
             		<table class="table">
						   
						<thead id="eb_table_head">
						    <tr>
						     <th>No.</th>
						     <th>지점명</th>
						     <th>제목</th>
						     <th>글쓴이</th>
						     <th>조회수</th>				   
						    </tr>
						 </thead>
						    
						    <tbody >
						    
						    <c:forEach items="${list }" var="dto">
						    	<tr>
						    		<td>${dto.num }</td>
						    		<td>${dto.store }</td>
						    		<td><a href="./storeNoticeView?num=${dto.num}">${dto.title}</a></td>
						    		<td>${dto.write }</td>
						    		<td>${dto.hit}</td>	
						    	</tr>
						    
						    </c:forEach>
						    
						   </tbody>
					 </table>

	
		</div>
		
		<!-- page 처리 -->
				<div id="eb_page">
					<c:if test="${pager.curBlock gt 1}">
						<span class="eb_list" title="${pager.startNum-1}">[이전]</span>
					</c:if>
					
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<span class="eb_list" title="${i}">${i}</span>
					</c:forEach>
					
					<c:if test="${pager.curBlock lt pager.totalBlock}">
						<span class="eb_list" title="${pager.lastNum+1}">[다음]</span>
					</c:if>
				</div>  		  
						  
						  
				<!-- page 처리 끝 -->
				
				
		<a href="./storeNoticeWrite"><input type="button" value="신규등록"  class="w3-button w3-black" ></a>
	
		
		
	</div>
   </div>
</div>

</body>
</html>