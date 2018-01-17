<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 <link href="${url }/resources/css/erp/chit.css" rel="stylesheet">

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
	 


	 
	 /* 코드 */
  	  $("#eb_makeCode").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../codeName",
				data:{  },
				success:function(data){
					alert(data);
					$("#eb_chitCode").val(data);
				}
			});
		});   
		
		//부서 search
		$("#eb_tempSearch").click(function(){

		 	$.ajax({
				type:"GET",
				url:"./chitTempList",
				data : {},
				success:function(data){
					
				$("#eb_tr").html(data);
				
				},error : function(){
					alert(error);
				}
			}); 
		});
		
		$("#eb_chitTempBtn").click(function(){
			var temp = $('input:radio[name="temp"]:checked').val();
			$("#eb_tempText").val(temp);
		});
	 
		
		//계좌 search
		$("#eb_accountSearch").click(function(){
			
			$.ajax({
			type : "GET",
			url : "./chitAccountList",
			data : {},
			success : function(data){
				$("#chitAccountResult").html(data);
			},error : function(){
				alert("error");
			}
		  });	
		});
		
		$("#eb_chitAccountBtn").click(function(){
		 	var memo = $('input:radio[name="memo"]:checked').val();
			$("#eb_memoText").val(memo); 
		});
		
		
		//table에 뿌려주기 eb_chitTable
		
		var count=0;
		$("#eb_chitTableBtn").click(function(){
			count++;
			var regdate=$(".eb_regdate").val();
			var temp=$(".eb_temp").val();
			var price=$("#eb_price").val();
			var account=$(".eb_account").val();
			var memo=$(".eb_memo").val();
			var kind=$(".eb_kind").val();
			var table="<td>"+account+"</td><td>"+temp+"</td><td>"+memo+"</td>";
			
			
			$(".eb_chitTable").append("<tr>");
			$(".eb_chitTable").append(table);
				if(kind=='차변'){
					$(".eb_chitTable").append("<td><input type='number'  value="+price+" id=eb_table_input"+count+"></td><td><input type='text'></td>");
					var total="";
					
					if(count==1){
						total=price;
					}else{
						total=$("#eb_debtor").val();
						
						for(var i=0; i<count; i++){
							price=$("#eb_table_input"+count).val();
						} 
					
						total=total*1+price*1;
						
					}
					
					/* price=price*1; */
					$("#eb_debtor").val(total);
				}else{
					$(".eb_chitTable").append("<td><input type='text'></td><td><input type='text' id=eb_table_input_2"+count+" value="+price+"></td>");
						var total="";
						
						if(count==1){
							total=price;
						}else{
							total=$("#eb_creditor").val();
							
							for(var i=0; i<count; i++){
								price=$("#eb_table_input_2"+count).val();
							} 
						
							total=total*1+price*1;
							
						}
						
						/* price=price*1; */
						$("#eb_creditor").val(total);				
				}
			$(".eb_chitTable").append("</tr>");
			
			
		});
		
		
		$("#eb_insertBtn").click(function(){
			var code=$("#eb_chitCode").val();
			var debtor=$("#eb_debtor").val();
			var creditor=$("#eb_creditor").val();
			
			if(code==""){
				 $.ajax({
					type:"GET",
					url:"../codeName",
					data:{  },
					success:function(data){
						
						$("#eb_chitCode").val(data);
					}
				}); 
				
				if(debtor!=creditor){
					alert("차변, 대변 값이 같아야합니다.");
				}
				 
			}else if(debtor==null){
				alert("차변 값을 입력해주세요.");
			}else if(creditor==""){
				alert("대변 값을 입력해주세요.");
			}else if(debtor==creditor){
				$("#chit_frm").submit();
			}else{
				alert("차변, 대변 값이 같아야합니다.");
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
			<div class="fw_menu " data-toggle="collapse" data-target=".fw_subselected" title="sub1">
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
				<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					전표 
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub2">
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
			
			<div id="eb_fw_main_1"></div>
			
			<div id="eb_fw_main_2">
				<table id="eb_fw_main_2_table">
					<tr >
						<td class="eb_row">회계</td>
						<td class="eb_row">영업/구매</td>
						<td class="eb_row">인사</td>
						<td class="eb_row">일정</td>
					</tr>
				</table>
			</div>
				
				
		</div>
			
			
			<!--contents 시작  -->
			<div id="eb_contents_wrap">
				 
				<div class="eb_contents_text">
				 	<span class="glyphicon glyphicon-file" id="eb_contents_text_p">전표입력</span>
				</div>
				
			<form action="./chitInsert" id="chit_frm" method="post">	
				
			  <input id="eb_chitCode" type="hidden" name="code" >
			  <input type="hidden" name="approval" value="승인">	
			 	
				<div id="eb_contents_box_chit">
				 <div class="eb_blank"></div>
					<table class="eb_chit_table">
						<tr>
							<td>전표 일자</td>
							<td><input type="date" name="regdate" class="eb_regdate"></td>
							<td>차/대변</td>
							<td>
								<select  class="eb_kind">
									<option value="차변">차변</option>
									<option value="대변">대변</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>부서명</td>
							<td><input type="text" name="temp" id="eb_tempText" class="eb_temp" readonly="readonly">
								<input type="button" class="btn btn-default" data-toggle="modal" data-target="#eb_view_modal_temp" id="eb_tempSearch" value="search">
							</td>
							<td>계좌명</td>
							<td><input type="text" name="account" id="eb_memoText" class="eb_account" readonly="readonly">
								<input type="button" class="btn btn-default" data-toggle="modal" data-target="#eb_view_modal_account" id="eb_accountSearch" value="search">
							</td>
						</tr>
						
						<tr>
							<td>금액</td>
							<td><input type="number" id="eb_price"></td>
							
							<td>적요</td>
							<td><input type="text" name="memo" class="eb_memo"></td>
						</tr>
					
					</table>
					
		<input type="button" class="btn btn-default" id="eb_chitTableBtn" value="등록">
				  
				</div> 
				
				
				<div id="eb_contents_table">
				  	
             				
             		<table class="table">
						   
						<thead id="eb_table_head">
						    <tr>
						     <th>계좌명</th>
						     <th>부서</th>
						     <th>적요</th>
						     <th class="eb_table_th">차변</th>	
						     <th class="eb_table_th">대변</th>					   
						    </tr>
						 </thead>
						    
						    <tbody class="eb_chitTable">
						   	 
						   </tbody>
					 </table>


		</div>
		
		  	<div class="eb_total">
					<input type="number" name="debtor" placeholder="차변" id="eb_debtor" ><input type="number" name="creditor" placeholder="대변" id="eb_creditor" >
			</div>		
					      <input type="button" id="eb_insertBtn" class="btn btn-default regist" value="등록">
				</form>
				
			<!-- form 끝 -->	
				
				
				<!--부서 search modal  -->
			
               <div class="modal fade" id="eb_view_modal_temp">
          
            <div class="modal-dialog">
            
                <div class="modal-content" id="eb_modal-content">
                        
                         <!--  Modal Header -->
                  <div class="modal-header">
                  
                     <h4 class="modal-title"> | 부서 </h4>
                     
                      <button type="button"  class="close" data-dismiss="modal">&times;</button>
                         
                          </div>
                          
                         <!--  Modal body -->
             <div class="modal-body">
             
              <table id="eb_table">
              
						   
						<thead>
						    <tr>
						     <th>코드</th>						
						     <th>부서명</th>					   
						    </tr>
						 </thead>
						    
						 <tbody id="eb_tr">
						 </tbody>
					 </table>
               
             </div>
                              <!-- modal footer -->
            <div class="modal-footer">
               <button id="eb_chitTempBtn" data-dismiss="modal" >확인</button>
       		 </div>
                          
               </div>
            </div>
         </div>
         
         
         
         
         
         <!--계좌 search modal  -->
   		
               <div class="modal fade" id="eb_view_modal_account">
          
            <div class="modal-dialog">
            
                <div class="modal-content" id="eb_modal-content_a">
                        
         			<div id="chitAccountResult"></div>
                          
                                  <!-- modal footer -->
            <div class="modal-footer">
               <button id="eb_chitAccountBtn" data-dismiss="modal" >확인</button>
        </div>
               </div>
            </div>
         </div>
		
	</div>
   </div>
</div>

</body>
</html>