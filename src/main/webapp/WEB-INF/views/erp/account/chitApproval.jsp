<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/erp/storeRegist.css" rel="stylesheet">


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


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
	 
		/*전체선택  */
	 $("input[class=input_all]").click(function(){
			if($("input[class=input_all]").prop("checked")){
				$("input[class=input_chk]").prop("checked",true);
			}else{
				$("input[class=input_chk]").prop("checked",false);
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
	  

	 //view Modal 창
	 $(".eb_view").click(function(){
		var code=$(this).attr("title"); 
		$.ajax({
			data : {"code" : code},
			url : "./chitView",
			type : "get",
			success : function(data){
				$(".eb_viewCode").val(data.code);
				$(".eb_viewRegdate").val(data.regdate);
				$(".eb_viewTemp").val(data.temp);
				$(".eb_viewAccount").val(data.account);
				$(".eb_viewMemo").val(data.memo);
				$(".eb_viewDebtor").val(data.debtor);
				$(".eb_viewCreditor").val(data.creditor);
				$(".eb_viewApproval").val(data.approval);
			},
			error : function(){
				alert("데이터를 불러 오지 못했습니다.");
			}
		});
	 });
	 


	 
	 $("#eb_cancel").click(function(){
		 if(confirm("승인을  취소 하시겠습니까 ?") == false){
		     alert("취소되었습니다.")   
			 return false;
		  }else{
			  var approval='승인';
			  var code=$(".eb_view").attr("title");
			  $.ajax({
				 data : {"code" : code, "approval" : approval},
				 type : "post",
				 url : "./chitApprovalUpdate",
				 success : function(data){
					 alert(data);
					 location.reload();
				 },error : function(){
					 alert("error")
				 }
			  });
			  
		  
		 }
	 });
	 

 });
 
 
 
 
</script>
</head>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 


<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			회계
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li><a href="./storeRegist"> 지점 등록</a></li>
					<li><a href="./accountRegist">예금 계좌 등록</a></li>
					<li><a href="./tempRegist">부서 등록</a></li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu  fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					전표 
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub2">
				<ul>
					<li><a href="./storeSales">지점매출</a></li>
					<li><a href="./chit"> 전표 입력</a></li>
					<li><a href="./chitApproval">승인전표</a></li>
					<li><a href="./chitNapproval">미승인전표</a></li>
				</ul>
			</div>
			
		
		
			
			
			
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
		
			</div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">승인전표</span>
				</div>
				
				<div id="eb_contents_box">
				
				 <div class="eb_blank"></div>
					
					
				<!-- 검색 -->
				   <input type="hidden" name="curPage" value="1">
					
					
				<form name="frm" action="./chitApproval" method="get">
					<div id="eb_contents_box_div" >
						<input type="hidden" name="curPage" value="1">
						  	
						  	<select name="kind" >
						  		<option value="code">코드</option>
						  		<option value="regdate">전표일자</option>
						  		<option value="temp">부서</option>
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
						     <th>전표 번호</th>
						     <th>전표 일자</th>
						     <th>부서</th>
						     <th>적요</th>	
						     <th>전표 금액</th>		
						     <th>승인 여부</th>		
						     <th></th>			   
						    </tr>
						 </thead>
						    
						     <tbody>
						   
						    	<c:forEach items="${list}" var="dto">
							      <tr>
							      	<td>${dto.code}</td>
							        <td>${dto.regdate}</td>	
							        <td>${dto.temp}</td>				
							        <td>${dto.memo}</td>
							        <td>${dto.debtor}</td>
							        <td>${dto.approval}</td>		
							        <td>
							        	<input type="button" value="상세보기" title="${dto.code}" class="eb_view w3-button w3-black" data-toggle="modal" data-target="#eb_view_modal">
							        </td>
							     
							     </c:forEach>
						   </tbody> 
					 </table>
					
						<!--부서 search modal  -->
			
               <div class="modal fade" id="eb_view_modal">
          
            <div class="modal-dialog">
            
                <div class="modal-content" id="eb_modal-content">
                        
                         <!--  Modal Header -->
                  <div class="modal-header">
                  
                     <h4 class="modal-title"> | 승인 전표 </h4>
                     
                      <button type="button"  class="close" data-dismiss="modal">&times;</button>
                         
                          </div>
                          
                         <!--  Modal body -->
             <div class="modal-body" id="eb_modal-content_chit">
             	 <div class="input-group input-group_modal">
							  <span class="input-group-addon">코드</span>
							  <input type="text" class="form-control eb_viewCode" readonly="readonly">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">날짜</span>
							  <input type="text" class="form-control eb_viewRegdate" readonly="readonly">
					</div>
					
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">부서명</span>
							  <input type="text" class="form-control eb_viewTemp" readonly="readonly">
					</div>
					
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">계좌</span>
							  <input type="text" class="form-control eb_viewAccount" readonly="readonly">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">차변</span>
							  <input type="text" class="form-control eb_viewDebtor" readonly="readonly">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">대변</span>
							  <input type="text" class="form-control eb_viewCreditor" readonly="readonly">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">적요</span>
							  <input type="text" class="form-control eb_viewMemo" readonly="readonly">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">승인여부</span>
							  <input type="text" class="form-control eb_viewApproval" readonly="readonly">
					</div>
             
             
             
           
               
             </div>
                              <!-- modal footer -->
            <div class="modal-footer">
            	<input type="button" id="eb_cancel" class="btn btn-default" value="승인취소" data-dismiss="modal"> 
            	<input type="button" value="확인" data-dismiss="modal" class="btn btn-default"> 
          
       		 </div>
                          
               </div>
            </div>
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
</div>

</body>
</html>