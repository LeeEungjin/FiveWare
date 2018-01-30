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
	 
		//view
		$("#eb_selectOne").click(function(){
			var num=$(this).attr("title");
			
			$.ajax({
				type : "get",
				url : "./staffView",
				data : {"num" : num},
				success : function(data){
					$("#eb_name").val(data.name);
					$("#eb_birth").val(data.birh);
					$("#eb_hiredate").val(data.hiredate);
					$("#eb_bank").val(data.bank);
					$("#eb_account").val(data.account);
					$("#eb_time").val(data.time);
					$("#eb_num").val(data.num);
					$("#eb_store").text(data.store);
				},error : function(){
					alert("error");
				}
			});
		});
		
		//delete
		$("#eb_Deletebtn").click(function(){
			var num=$("#eb_num").val();
			
			$.ajax({
				type : "get",
				url : "./staffDelete",
				data : {"num" : num},
				success : function(data){
					 swal({
		                 title:data,
		                 type: "success",
		                 showCancelButton: false,
		                 confirmButtonClass: "btn-primary",
		                 confirmButtonText: "확인",
		                 closeOnConfirm: false
		               },
		               function(){
							location.reload();
		               });
				},error : function(){
					alert("Error");
				}
			});
			
		});
	 
	 
 });
 
 
 
 
</script>
</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 


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
				 	<span  id="eb_contents_text_p">직원관리</span>
				</div>
				
		
			 	
				<div id="eb_contents_box">
				 <div class="eb_blank"></div>
				 <form action="staff" method="get">
					<input type="hidden" name="curPage" value="1">
						  <div id="eb_selectBox">	
						  	<select name="kind" >
						  		<option value="name">이름</option>
						  		<option value="hiredate">입사날짜</option>
						  	</select>
						  	
						   	<input type="text" name="search">
						  <button class="btn btn-default">search</button>
					</div>
						
				  </form>
				</div> 
				
				
				<div id="eb_contents_table">
				  	
             				
             		<table class="table">
						   
						<thead id="eb_table_head">
						    <tr>
						     <th>이름</th>
						     <th>생년월일</th>
						     <th>입사 날짜</th>
						     <th>근무시간</th>
						     <th>은행</th>	
						     <th>계좌번호</th>
						     <th></th>					   
						    </tr>
						 </thead>
						    
						    <tbody class="eb_chitTable">
						    <c:forEach items="${list}" var="dto">
						   	 	<tr>
						   	 		<td>${dto.name }</td>
						   	 		<td>${dto.birth }</td>
						   	 		<td>${dto.hiredate }</td>
						   	 		<td>${dto.time }</td>
						   	 		<td>${dto.bank }</td>
						   	 		<td>${dto.account }</td>
						   	 		<td><input type="button" class="w3-button w3-black" value="수정" title="${dto.num}" data-toggle="modal" data-target="#updateModal" id="eb_selectOne"></td>
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
				
				
		<input type="button" value="신규등록"  class="w3-button w3-black" data-toggle="modal" data-target="#myModal">
		
		
		
		<!-- 등록 modal -->
			<div class="modal fade " id="myModal" >
		<form action="./staffInsert" method="post">
			    <div class="modal-dialog"  id="eb_modal">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">직원 등록</h4>
			        </div>
			        
			        <div class="modal-body" >
			         <table class="table" id="eb_modal_table">
			         	<tr>
			         		<td class="eb_td" colspan="1">지점명</td>
			         		<td colspan="3"><input type="text" name="store" value="${member.store }" readonly="readonly"></td>			         	
			         	</tr>
			         
			         
			         
			         	<tr>
			         		<td class="eb_td">이름</td>
			         		<td><input type="text" name="name"></td>
			         		<td class="eb_td">생년월일</td>
			         		<td><input type="date" name="birth"></td>
			         	</tr>
			         	
			         	<tr>
			         		<td class="eb_td">입사날짜</td>
			         		<td><input type="date" name="hiredate"></td>
			         		<td class="eb_td">근무시간</td>
			         		<td><input type="text" name="time"></td>
			         	</tr>
			         	
			         	<tr>
			         		<td class="eb_td">은행</td>
			         		<td><input type="text" name="bank"></td>
			         		<td class="eb_td">계좌번호</td>
			         		<td><input type="text" name="account"></td>
			         	</tr>
			         	
			         	
			         
			         
			         </table>
			         
			         
			        </div>
			        
			        <div class="modal-footer">
			      <input type="submit" id="eb_btn" class="btn btn-default" value="등록">

			        </div>
			      </div>
			      
		    </div>
		</form>
		  </div>
		  
		  
		  
		  
		  <!-- 수정 modal -->
		 
		  <div class="modal fade " id="updateModal" >
		<form action="./staffUpdate" method="post">
		<input type="hidden" name="num" id="eb_num">
			    <div class="modal-dialog"  id="eb_modal">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">직원 등록</h4>
			        </div>
			        
			        <div class="modal-body" >
			         <table class="table" id="eb_modal_table">
			         	<tr>
			         		<td class="eb_td" colspan="1">지점명</td>
			         		<td colspan="3">
			         			<span id="eb_store"></span>
			         		</td>
			         	</tr>
			         
			         	<tr>
			         		<td class="eb_td">이름</td>
			         		<td><input type="text" name="name" id="eb_name"></td>
			         		<td class="eb_td">생년월일</td>
			         		<td><input type="date" name="birth" id="eb_birth"></td>
			         	</tr>
			         	
			         	<tr>
			         		<td class="eb_td">입사날짜</td>
			         		<td><input type="date" name="hiredate" id="eb_hiredate"></td>
			         		<td class="eb_td">근무시간</td>
			         		<td><input type="text" name="time" id="eb_time"></td>
			         	</tr>
			         	
			         	<tr>
			         		<td class="eb_td">은행</td>
			         		<td><input type="text" name="bank" id="eb_bank"></td>
			         		<td class="eb_td">계좌번호</td>
			         		<td><input type="text" name="account" id="eb_account"></td>
			         	</tr>
			         	
			         	
			         
			         
			         </table>
			         
			         
			        </div>
			        
			        <div class="modal-footer">
			      <input type="submit" id="eb_btn" class="btn btn-default" value="등록">
				  <input type="button" id="eb_Deletebtn" class="btn btn-default" value="삭제">
			        </div>
			      </div>
			      
		    </div>
		</form>
		  </div>
		  
		  
		  
	
		
	</div>
   </div>
</div>

</body>
</html>