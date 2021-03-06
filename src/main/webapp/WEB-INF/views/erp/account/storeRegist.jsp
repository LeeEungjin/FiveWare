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
	 
		/*전체선택  */
	 $("input[class=input_all]").click(function(){
			if($("input[class=input_all]").prop("checked")){
				$("input[class=eb_input_chk]").prop("checked",true);
			}else{
				$("input[class=eb_input_chk]").prop("checked",false);
			}
		});
	 
		
	 /* view modal 창 */
	 $(".eb_view").click(function(){
		 var code=$(this).attr("title");
         $.ajax({
            data : {"code" : code},
            url : "./storeRegistView",
            type : "get",
            success : function(data){
        	   $(".eb_viewCode").val(data.code);
        	   $(".eb_viewStore").val(data.store);
        	   $(".eb_viewStoreNum").val(data.storeNum);
        	   $(".eb_viewName").val(data.name);
        	   $(".eb_viewAddr").val(data.addr);
        	   $(".eb_viewTel").val(data.tel);
        	   $(".eb_viewEmail").val(data.email);
        	   $(".eb_viewBank").val(data.bank);
        	   $(".eb_viewAccount").val(data.account);
        	   $(".eb_viewTime").val(data.time);
            },
            error : function(data){
               alert("error");
            }
         }); 
	 });
	 
	 /* view */
	 $(".eb_view").click(function(){
		 
	  var code=$(".eb_view").val();
		 
		 $.ajax({
			type: "GET",
			url: "./storeRegistView",
			data:{
				code : code
			},
			success:function(data){
				
			}
		});  
	 });
		 
	 
	 /* 삭제 */
	  $("#eb_storeDelete").click(function(){
		 
		 var code= $(".eb_viewCode").val();
		
		$.ajax({
			data : {"code" : code},
			url : "./storeRegistDelete",
			type : "get",
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
				alert("error");
			}
		}); 
	 });
	 
	  //전체삭제
		 $("#deleteBtn").click(function(){
			 
			 var count=0;
			 var code="";
			 
			 swal({
	             title:"삭제하시겠습니까?",
	             type: "success",
	             showCancelButton: true,
	             confirmButtonClass: "btn-primary",
	             confirmButtonText: "확인",
	             closeOnConfirm: false
	           },
	           function(){
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
						url :"./storeRegistDelete",
						type : "get",
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
							alert("error")
						}
					 });
			    	
	           });
			 
		
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
	  

	 /*계좌번호 확인  */
	  $("#eb_bankBtn").click(function(){
		   var bank=$("#eb_bank").val(); 
		   var account=$("#eb_account").val().length;

		  if(bank=='국민은행'){
			  
			  if(account==14){
				  swal("확인 되었습니다.");
			  }else{
				  swal("잘못 입력 되었습니다." ,"확인 후 다시 입력해주세요");
			  }
		  
		  }else if(bank=='신한은행'){
			  
			  if(account==12){
				  swal("확인 되었습니다.");
			  }else{
				  swal("잘못 입력 되었습니다." ,"확인 후 다시 입력해주세요");
			  }
		 
		  }else{
			  if(account==13){
				  swal("확인 되었습니다.");
			  }else{
				  swal("잘못 입력 되었습니다." ,"확인 후 다시 입력해주세요");
			  }
		  }
		  
		  });
	 
	 
		 /* 코드 */
  	  $("#eb_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../storeNum",
				data:{  },
				success:function(data){
					
					$(".eb_code").val(data);
				}
			});
		});  
		
		
	
		 
	
 });
 
 
 /* 주소검색 */
 function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var fullAddr = ''; // 최종 주소 변수
             var extraAddr = ''; // 조합형 주소 변수

             // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 fullAddr = data.roadAddress;

             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 fullAddr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
             if(data.userSelectedType === 'R'){
                 //법정동명이 있을 경우 추가한다.
                 if(data.bname !== ''){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있을 경우 추가한다.
                 if(data.buildingName !== ''){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
             document.getElementById('sample6_address').value = fullAddr;

             // 커서를 상세주소 필드로 이동한다.
             document.getElementById('sample6_address2').focus();
         }
     }).open();
 }
 
</script>
</head>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 
<c:import url="/WEB-INF/views/message.jsp"></c:import> 

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
					<li><a href="./chit">전표 입력</a></li>
					<li><a href="./chitApproval">승인전표</a></li>
					<li><a href="./chitNapproval">미승인전표</a></li>
				</ul>
			</div>
			
	
			
			
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
		
		<div id="fw_main">
			
		<img alt="" src="${url}/resources/images/logo/smallLogo.png">
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span id="eb_contents_text_p">지점등록</span>
				</div>
				
				<div id="eb_contents_box">
				
				 <div class="eb_blank"></div>
					
					
				<!-- 검색 -->
				   <input type="hidden" name="curPage" value="1">
					
					
				<form name="frm" action="./storeRegist" method="get">
					<div id="eb_contents_box_div" >
						<input type="hidden" name="curPage" value="1">
						  	
						  	<select name="kind">
						  		<option value="code">코드</option>
						  		<option value="store">지점명</option>
						  		<option value="name">대표자명</option>
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
						     <th><input type="checkbox" class="input_all"></th>
						     <th>코드</th>
						     <th>지점명</th>
						     <th>대표자</th>
						     <th>전화번호</th> 
						     <th></th>
						    </tr>
						 </thead>
						    
						    <tbody>
						    
						    	<c:forEach items="${list}" var="dto">
							      <tr>
							        <td><input type="checkbox" class="eb_input_chk" id="${dto.code}"></td>
							      	<td>${dto.code}</td>
							        <td>${dto.store}</td>					
							        <td>${dto.name}</td>
							        <td>${dto.tel}</td>		
							        <td><button class="eb_view w3-button w3-black" title="${dto.code}" data-toggle="modal" data-target="#eb_view_modal">상세보기</button></td>						      						      			   
							     </tr>
							  
							     </c:forEach>
						   </tbody>
					 </table>
					
					<!-- view Modal -->
					
			<form action="storeRegistUpdate" method="post">
					 <div class="modal fade" id="eb_view_modal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content" id="sModel_1">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 지점 정보</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
				  	<div class="input-group input-group_modal">
							  <span class="input-group-addon">지점 코드</span>
							  <input type="text" class="form-control eb_viewCode"  readonly="readonly" name="code">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">지점명</span>
							  <input type="text" class="form-control eb_viewStore" name="store">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">대표자</span>
							  <input type="text" class="form-control eb_viewName"  name="name">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">사업자 등록 번호</span>
							  <input type="text" class="form-control eb_viewStoreNum"    name="storeNum">
					</div>
					
					<div class="input-group input-group_modal">
							 	<span class="input-group-addon">주소</span>
								<input type="text" class="form-control eb_viewAddr"  name="addr">  
					</div>
					
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">영업시간</span>
							  <input type="text" class="form-control eb_viewTime"  name="time">
					</div>
					
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">전화번호</span>
							  <input type="text" class="form-control eb_viewTel"   name="tel">
					</div>
					
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">E-mail</span>
							  <input type="text" class="form-control eb_viewEmail"  name="email">
					</div>
		
		
				<div class="input-group input-group_modal">
							  <span class="input-group-addon">은행</span>
							  <select name="bank" class="eb_viewBank">
						   			<option value="국민은행">국민 은행</option>
						   			<option value="신한은행">신한 은행</option>
						   			<option value="농협">농협</option>
						   		</select>
							  <input type="text" class="form-control eb_viewAccount"  id="eb_account"  name="account" placeholder="-없이 입력해주세요.">
							
					</div>
		
		
	
				 </div>
						        
						        <!-- Modal footer -->
				<div class="modal-footer">
						<input type="button" class="btn btn-default" value="확인" data-dismiss="modal">
						<input type="submit" id="eb_btn" class="btn btn-default" value="수정">
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
				
				
						  <button class="w3-button w3-black" id="deleteBtn">선택삭제</button>
						  
					      <button class="w3-button w3-black" data-toggle="modal" id="eb_insertBtn" data-target="#myModal">신규등록</button>
					      
			 
			 
			 
			 <!--지점등록 modal  -->
			 
		<form action="storeRegistWrite" method="post">	
		<input type="hidden" name="pw" class="eb_code"> 
			 <div class="modal fade" id="myModal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content" id="sModel">
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 지점 등록</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body">
				 
				  	<div class="input-group input-group_modal">
							  <span class="input-group-addon">지점 코드</span>
							  <input type="text" class="form-control eb_code"  readonly="readonly" name="code">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">지점명</span>
							  <input type="text" class="form-control" id="eb_store"  name="store">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">대표자</span>
							  <input type="text" class="form-control"  id="eb_name"  name="name">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">사업자 등록 번호</span>
							  <input type="text" class="form-control"  id="eb_storeNum"  name="storeNum">
					</div>
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							 <input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" name="addr">
								<input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text"  id="sample6_address" class="form-control" placeholder="주소" name="addr" id="eb_addr"><br>
								<input type="text" id="sample6_address2" class="form-control" placeholder="나머지 주소를 입력해주세요." name="addr">  
					</div>
					
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">영업시간</span>
							  <input type="text" class="form-control"  id="eb_time"  name="time">
					</div>
					
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">전화번호</span>
							  <input type="text" class="form-control"  id="eb_tel"  name="tel">
					</div>
					
					
					<div class="input-group input-group_modal">
							  <span class="input-group-addon">E-mail</span>
							  <input type="text" class="form-control"  id="eb_email"  name="email">
					</div>
		
		
				<div class="input-group input-group_modal">
							  <span class="input-group-addon">은행</span>
							  <select name="bank" id="eb_bank">
						   			<option value="국민은행">국민 은행</option>
						   			<option value="신한은행">신한 은행</option>
						   			<option value="농협">농협</option>
						   		</select>
							  <input type="text" class="form-control"  id="eb_account"  name="account" placeholder="-없이 입력해주세요.">
							  <input type="button" id="eb_bankBtn" value="확인">
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