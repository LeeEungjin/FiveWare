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
			url : "./tempRegistView",
			type : "get",
			success : function(data){
				$(".eb_viewCode").val(data.code);
				$(".eb_viewTemp").val(data.temp);
				$(".eb_viewMemo").val(data.memo);
			},
			error : function(){
				alert("데이터를 불러 오지 못했습니다.");
			}
		});
	 });
	 
	 
	 //삭제
	 $("#eb_tempDelete").click(function(){
		
		 var code=$(".eb_viewCode").val();
		 
		 $.ajax({
			data : {"code" : code},
			url : "./tempRegistDelete",
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
					url : "./tempRegistDelete",
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
	 
	 /* 코드 */
	  $("#eb_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../codeName",
				data:{  },
				success:function(data){
					
					$("#eb_tempCode").val(data);
				}
			});
		}); 
	 
 });
 
 
 
 
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
					<li> <a href="./storeSales">지점매출</a></li>
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
			
		<img alt="" src="${url}/resources/images/logo/smallLogo.png">
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span id="eb_contents_text_p">부서등록</span>
				</div>
				
				<div id="eb_contents_box">
				
				 <div class="eb_blank"></div>
					
					
				<!-- 검색 -->
				   <input type="hidden" name="curPage" value="1">
					
					
				<form name="frm" action="./tempRegist" method="get">
					<div id="eb_contents_box_div" >
						<input type="hidden" name="curPage" value="1">
						  	
						  	<select name="kind">
						  		<option value="code">코드</option>
						  		<option value="temp">부서명</option>
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
						     <th>부서 코드</th>
						     <th>부서명</th>
						     <th>비고</th>	
						     <th></th>					   
						    </tr>
						 </thead>
						    
						    <tbody>
						   
						    	<c:forEach items="${list}" var="dto">
							      <tr>
							        <td><input type="checkbox" class="eb_input_chk" id="${dto.code}"></td>
							      	<td>${dto.code}</td>
							        <td>${dto.temp}</td>					
							        <td>${dto.memo}</td>		
							        <td><button class="eb_view w3-button w3-black" title="${dto.code}" data-toggle="modal" data-target="#eb_view_modal">수정</button></td>
							     
							     </c:forEach>
						   </tbody>
					 </table>
					
					
					
					<!-- view Modal -->
					<form action="tempRegistUpdate" method="post">
               <div class="modal fade eb_view_modal" id="eb_view_modal">
          
            <div class="modal-dialog">
            
                <div class="modal-content">
                        
                         <!--  Modal Header -->
                  <div class="modal-header">
                  
                     <h4 class="modal-title"> | 부서 정보</h4>
                     
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                         
                          </div>
                          
                         <!--  Modal body -->
             <div class="modal-body">

               		 <div class="input-group input-group_modal">
							  <span class="input-group-addon">부서 코드</span>
							  <input type="text" class="form-control eb_viewCode"  readonly="readonly" name="code">
					</div>
					
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">부서명</span>
							  <input type="text" class="form-control eb_viewTemp" name="temp">
					</div>
					
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">비고</span>
							  <input type="text" class="form-control eb_viewMemo" name="memo">
					</div>
               
             </div>
                          
                          <!-- modal footer -->
            <div class="modal-footer">
               <button id="eb_tempUpdate"  class="btn btn-default">수정</button>
               
               <input type="button" id="eb_tempDelete" data-dismiss="modal"  class="btn btn-default" value="삭제">
               
                  
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
						  
					      <button class="w3-button w3-black" id="eb_insertBtn" data-toggle="modal" data-target="#myModal">신규등록</button>
					      
			 
			 
			 
			 <!--지점등록 modal  -->
			 
		<form action="tempRegistWrite" method="post">	 
			 <div class="modal fade" id="myModal">
			 
				<div class="modal-dialog">
				
					 <div class="modal-content" >
						      
						        <!-- Modal Header -->
						<div class="modal-header">
						
						   <h4 class="modal-title"> | 부서 등록</h4>
						   
						    <button type="button" class="close" data-dismiss="modal">&times;</button>
						       
						        </div>
						        
						        <!-- Modal body -->
				 <div class="modal-body ">
	
	
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">부서 코드</span>
							  <input type="text" class="form-control"  id="eb_tempCode" readonly="readonly" name="code">
					</div>
					
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">부서명</span>
							  <input type="text" class="form-control" name="temp">
					</div>
					
						 <div class="input-group input-group_modal">
							  <span class="input-group-addon">비고</span>
							  <input type="text" class="form-control" name="memo">
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