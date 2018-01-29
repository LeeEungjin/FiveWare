<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/srm/staffTime.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">

		 
 $(function(){
	 
		 var message = '${message}';
	     if(message != ""){
	    	 swal({
                 title:message,
                 type: "success",
                 showCancelButton: false,
                 confirmButtonClass: "btn-primary",
                 confirmButtonText: "확인",
                 closeOnConfirm: false
               },
               function(){
					location.reload();
               });
	     }
	 
		$(".fw_menu").click(function(){
			var sub = $(this).attr("title");
			
			if($("."+sub).html().trim()=="∧"){
				$("."+sub).html("∨");
			}else{
				$("."+sub).html("∧");
			}
			
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
			우리 매장 관리
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				우리 매장 관리
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">매장 정보</a></li>
					<li><a href="${pageContext.request.contextPath}/srm/staff?store=${member.store}">직원 관리</a></li>
					<li><a href="${pageContext.request.contextPath}/srm/staffTime?store=${member.store}">직원 출/퇴근 조회</a></li>
				</ul>
			</div>
			
	

		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
		<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span  id="eb_contents_text_p">출/퇴근조회</span>
				</div>
				
		
			 	
				<div id="eb_contents_box">
				 <div class="eb_blank"></div>
				 <div id="eb_selectBox">	
						 <input type="date" name="search">~<input type="date" name="search">
						  <button class="btn btn-default">search</button>
					</div>
				</div> 
				
				
				<div id="eb_contents_table">
				  	
             				
             		<table class="table">
						   
						<thead id="eb_table_head">
						    <tr>
						     <th>이름</th>
						     <th>날짜</th>
						     <th>출근시간</th>
						     <th>퇴근시간</th>				   
						    </tr>
						 </thead>
						    
						    <tbody class="eb_chitTable">
						    	<c:forEach items="${list }" var="dto">
						    		<tr>
						    			<td>${dto.name}</td>
						    			<td>${dto.regdate}</td>
						    			<td>${dto.startTime}</td>
						    			<td>${dto.lastTime}</td>
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
				
				

	
		
		
	</div>
   </div>
</div>

</body>
</html>