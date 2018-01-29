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
	 $("input[class=eb_input_all]").click(function(){
			if($("input[class=eb_input_all]").prop("checked")){
				$("input[class=eb_input_chk]").prop("checked",true);
			}else{
				$("input[class=eb_input_chk]").prop("checked",false);
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
			url : "./accountRegistView",
			type : "get",
			success : function(data){
				$(".eb_viewCode").val(data.code);
				$(".eb_viewMemo").val(data.memo);
				$(".eb_viewBank").val(data.bank);
				$(".eb_viewAccount").val(data.account);
			},
			error : function(){
				alert("데이터를 불러 오지 못했습니다.");
			}
		});
	 });
	 
	 
	 //삭제
	 $("#eb_accountDelete").click(function(){
		
		 var code=$(".eb_viewCode").val();
		 
		 $.ajax({
			data : {"code" : code},
			url : "./accountRegistDelete",
			type : "get",
			success : function(data){
				alert(data);
				location.reload();
			},error : function(){
				alert("error")
			}
		 });
	 });
	 
	 //전체삭제
	 $("#eb_deleteBtn").click(function(){
		 var count=0;
		 var code="";
		 
		 
		 if(confirm("정말 삭제하시겠습니까 ?") == false){
		     alert("삭제가 취소되었습니다.")   
			 return false;
		    }else{
		    	var count=0;
		    	var code="";
		    	var cod=[];
		    	$(".eb_input_chk").each(function(d){
		    		if(this.checked){
		    			code=$(this).attr("id");
		    			count++;
		    			cod.push(code);
		    		}
		    	});
	
		    	$.ajax({
					data : {"code" : cod.toString()},
					url : "./accountRegistDelete",
					type : "get",
					success : function(data){
						alert(data);
						location.reload();
					},error : function(){
						alert("error")
					}
				 });
		    	
		    	
		    }
		 
		}); 
	 

	 
	 /* 코드 */
 	  $("#eb_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../codeName",
				data:{  },
				success:function(data){
					alert(data);
					$("#eb_accountCode").val(data);
				}
			});
		}); 
	 
		
		/* 계좌번호 확인 */
	 $(".eb_bankBtn").click(function(){
		
		   var bank=$("#eb_bank").val(); 
		   var account=$("#eb_account").val().length;
		   
		alert(account);
		  if(bank=='국민은행'){
			  
			  if(account==14){
				  alert("확인되었습니다.");
			  }else{
				  alert("잘못입력되었습니다. 확인 후 다시 입력해주세요(14자리)");
			
			  }
		  
		  }else if(bank=='신한은행'){
			  
			  if(account==12){
				  alert("확인되었습니다.");
			  }else{
				  alert("잘못입력되었습니다. 확인 후 다시 입력해주세요(12자리)");
			  }
		 
		  }else{
			  if(account==13){
				  alert("확인되었습니다.");
			  }else{
				  alert("잘못입력되었습니다. 확인 후 다시 입력해주세요(13자리)");
			  }
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
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li><a href="./storeRegist"> 지점 등록</a></li>
					<li><a href="./accountRegist">예금 계좌 등록</a></li>
					<li><a href="./tempRegist">부서 등록</a></li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					전표 
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
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
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">예금계좌등록</span>
				</div>
				
				<div id="eb_contents_box">
				
				 <div class="eb_blank"></div>
					
					
				<!-- 검색 -->
				   <input type="hidden" name="curPage" value="1">
					
					
				<form name="frm" action="./accountRegist" method="get">
					<div id="eb_contents_box_div" >
						<input type="hidden" name="curPage" value="1">
						  	
						  	<select name="kind">
						  		<option value="code">코드</option>
						  		<option value="bank">은행</option>
						  		<option value="account">계좌번호</option>
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
						     <th><input type="checkbox" class="eb_input_all"></th>
						     <th>계좌 코드</th>
						     <th>계좌명</th>
						     <th>은행</th>	
						     <th>계좌 번호</th>				
						     <th></th>	   
						    </tr>
						 </thead>
						    
						    <tbody>
						   
						    	 <c:forEach items="${list}" var="dto">
							      <tr>
							        <td><input type="checkbox" class="eb_input_chk" id="${dto.code}"></td>
							      	<td>${dto.code}</td>
							      	<td>${dto.memo}</td>
							        <td>${dto.bank}</td>					
							        <td>${dto.account}</td>		
							        <td><button class="eb_view w3-button w3-black" title="${dto.code}" data-toggle="modal" data-target="#eb_view_modal">수정</button></td>
							     
							     </c:forEach> 
						   </tbody>
					 </table>
					
					<!-- view Modal -->
					<form action="accountRegistUpdate" method="post">
               <div class="modal fade" id="eb_view_modal">
          
            <div class="modal-dialog">
            
                <div class="modal-content">
                        
                         <!--  Modal Header -->
                  <div class="modal-header">
                  
                     <h4 class="modal-title"> | 예금계좌 정보</h4>
                     
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                         
                          </div>
                          
                         <!--  Modal body -->
             <div class="modal-body">
             	 <div class="input-group input-group_modal">
							  <span class="input-group-addon">예금계좌 코드</span>
							  <input type="text" class="form-control eb_viewCode"   readonly="readonly" name="code">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">계좌명</span>
							  <input type="text" class="form-control eb_viewMemo"   name="memo">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">은행</span>
							  <select name="bank" class="eb_viewBank">
						   			<option value="국민은행">국민 은행</option>
						   			<option value="신한은행">신한 은행</option>
						   			<option value="농협">농협</option>
						 		</select>
							  	<input type="text" class="form-control eb_viewAccount eb_account" name="account"  placeholder="-없이 입력해주세요.">
						    <input type="button" class="btn btn-default eb_bankBtn"  value="확인">
					</div>
              
               
             </div>
                          
                          <!-- modal footer -->
            <div class="modal-footer">
               <button id="eb_accountUpdate"  class="btn btn-default">수정</button>
               
               <input type="button" id="eb_accountDelete" class="btn btn-default" data-dismiss="modal" value="삭제">
               
                  
             </div>
                          
               </div>
            </div>
         </div>
            </form>   
		 	 
				
				
				
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
				
				
						  <button class="w3-button w3-black" id="eb_deleteBtn">선택삭제</button>
						  
					      <button class="w3-button w3-black" id="eb_insertBtn" data-toggle="modal" data-target="#myModal">신규등록</button>
					      
			 
			 
			 
			 <!--계좌등록 modal  -->
			 
		<form action="./accountRegistWrite" method="post">	 
			 <div class="modal fade" id="myModal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 예금계좌 등록</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
				 <div class="input-group input-group_modal">
							  <span class="input-group-addon">예금계좌 코드</span>
							  <input type="text" class="form-control"  id="eb_accountCode" readonly="readonly" name="code">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">계좌명</span>
							  <input type="text" class="form-control"   name="memo">
					</div>
					
					 <div class="input-group input-group_modal">
							  <span class="input-group-addon">은행</span>
							  <select name="bank" id="eb_bank">
						   			<option value="국민은행">국민 은행</option>
						   			<option value="신한은행">신한 은행</option>
						   			<option value="농협">농협</option>
						 		</select>
							  	<input type="text" class="form-control " id="eb_account" name="account"  placeholder="-없이 입력해주세요.">
						    <input type="button" class="eb_bankBtn" value="확인">
					</div>

					
				 </div>
						        
						        <!-- Modal footer -->
				<div class="modal-footer">
						<input type="submit" id="eb_btn" class="btn btn-default" value="등록">
				 </div>
						        
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