<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/backRegist.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		
		if(message != ""){
			alert(message);
		}
		
		
		$("#br_insert").click(function(){
			$.ajax({
				type:"GET",
				url:"../../codeName",
				success:function(data){
					$("#materCode").val(data);
					
					$.ajax({
						type:"GET",
						url:"./materStorageList",
						success:function(data){
							var i=0;
							$(data).each(function(){
								$("#storageName").append("<option value="+data[i]+">"+data[i]+"</option>");
								i++;
							});
						}
					});
				}
			});
		});
		
		$(".br_btn").click(function(){
 			var materDate=$("#materDate").val();
 			var account=$("#account").val();
 			var temp=$("#temp").val();
 			var name=$("#name").val();
 			
			if(materDate==""){
				alert("반품일을 입력해주세요.");
			}else if(account==""){
				alert("거래처를 입력해주세요.");
			}else if(temp=""){
				alert("부서를 입력해주세요.");
			}else if(name=""){
				alert("담당자 입력해주세요.");
			}else{
				$("#br_write_frm").submit();
				$(".br_btn").attr("data-dismiss", "modal");
			}
		}); 
		
		$("#search_btn").click(function(){
			alert("click");
			
			var smaterDate=$("#smaterDate").val();
			var ematerDate=$("#ematerDate").val();
			var materKind="enter";
			
			if(smaterDate=="" || ematerDate==""){
				alert("기간을 입력해주세요.");
			}else{
				
				$.ajax({
					type : "GET",
					url : "./materDateList",
					data : {
						smaterDate : smaterDate,
						ematerDate : ematerDate,
						materKind : materKind
					},
					success:function(data){
						alert(data);
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
         자재관리
      </div>
      <!-- submenu banner end -->
      
      <!-- submenu menu -->
         <div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub1" title="sub1">
            기초정보
            <div class="fw_arrow sub1">
               ∧
            </div>
         </div>
         
         <div class="fw_subselected collapse in" id="sub1">
            <ul>
               <li> 거래처 등록</li>
               <li> 제품 등록</li>
               <li><a href="../../erp/foundation/menuRegist">메뉴 등록</a></li>
               <li><a href="../../erp/foundation/storageRegist">창고 등록</a></li>
            </ul>
         </div>
         
         <!-- ----------2---------- -->
            <div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
               구매관리
            <div class="fw_arrow sub2">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub2">
            <ul>
               <li> 주문 입력</li>
               <li> 주문 현황 보기</li>
            </ul>
         </div>
         
         <!-- ----------3---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
               자재관리
            <div class="fw_arrow sub3">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub3">
            <ul>
               <li><a href="../../erp/mater/materRegist?materKind=enter">입고 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=rele">출고 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=back">반품 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=confin">불출 입력</a></li>
            </ul>
         </div>
         
         <!-- ----------4---------- -->
         <div class="fw_menu"  >
               	조회
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<!-- --------------------------------------------------------------------------------------------------------------- -->
	
	<input type="hidden" name="materKind" value="enter">
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<!-- <div class="sales_title_menu">기초 정보</div>
				<div class="sales_title_menu">구매 관리</div>
				<div class="sales_title_menu">자재 관리</div>
				<div class="sales_title_menu">반품 관리</div>
				<div class="sales_title_menu">조 회</div> -->
			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="br_icon">icon</div>
					<p id="br_title">반품등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="br_search">
						<!-- 검색 기능 -->
							<div class="input-group search_group">
								<form id="er_search_frm" name="er_search_frm" method="get">
									기간 선택 <input id="smaterDate" type="date"> ~ <input id="ematerDate" type="date">		
							      <div class="input-group-btn">
							        <button  id="search_btn" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
							      </div>
							    </form>	
						    </div>	
						<!-- 검색 기능 끝 -->
					</div>
				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table">
						<table class="table">
						    <thead>
						      <tr>
						        <th>반품코드</th>
						        <th>반품일</th>
						        <th>거래처</th>
						        <th>품목</th>
						        <th>수량</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						   <c:forEach items="${backList}" var="backList">
						      <tr>
						        <td data-toggle="modal" data-target="#br_update_modal">${backList.materCode}</td>
						        <td>${backList.materDate}</td>
						        <td>${backList.account}</td>
						        <td></td>
						        <td></td>
						      </tr>
						   </c:forEach>
						    </tbody>
						 </table>
					</div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
					<div id="erp_jh_contents_bottom">
						<button id="br_insert" class="modal_btn" data-toggle="modal" data-target="#br_modal">신규등록</button>
					</div>
				<!-- 등록 버튼 끝 -->
				
				
				<!-- Modal -->
				<div class="modal fade" id="br_modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|반품 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				         <form action="./materWrite" method="post" id="br_write_frm">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">반품코드</span>
							  <input id="materCode" name="materCode" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">반품일</span>
							  <input id="materDate" name="materDate" type="date" class="form-control">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">거래처</span>
							  <input id="account" name="account" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">부서</span>
							  <input id="temp" name="temp" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">담당자</span>
							  <input id="name" name="name" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">비고</span>
							   <textarea name="materMemo" class="form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<input type="hidden" name="storageName" value="-">
							<input type="hidden" name="materKind" value="back">
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default br_btn">등록</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				        </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				
				<!-- 수정 Modal -->
				
				<div class="modal fade" id="br_update_modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|반품 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				         <form action="" method="post" id="">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">반품코드</span>
							  <input type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">반품일</span>
							  <input type="date" class="form-control">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">거래처</span>
							  <input type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">부서</span>
							  <input type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">담당자</span>
							  <input type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">비고</span>
							   <textarea class="form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">등록</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				        </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- 수정 Modal 끝 -->
				
				
			</div>
		</div>
	</div>
</body>
</html>