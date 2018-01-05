<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/storageRegist.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

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
			var t = '${pager.kind}';
			alert(cur);
			document.sr_search_frm.curPage.value=cur;
			document.sr_search_frm.search.value=s;
			document.sr_search_frm.kind.value=t;
			document.sr_search_frm.submit();
		});
		
		$(".sr_btn").click(function(){
			alert("click");
			$("#sr_frm").submit();
		});
		
		$(".storageView").click(function() {
			var code=$(this).attr("title");
			alert(code);
			$.ajax({
				data : {"storageCode" : code},
				url : "./storageView",
				type : "get",
				success : function(data){
					$(".viewCode").val(data.storageCode);
					$(".viewName").val(data.storageName);
					$(".viewAddr").val(data.storageAddr);
					$(".viewOp").html(data.storageOp);
					$(".viewImg").val(data.imgNull);
				},
				error : function(data){
					alert("error");
				}
			});
		});
		
		$(".srUpdate").click(function(){
			$("#sr_update_frm").submit();
		});
		
		$(".srDelete").click(function(){
			var code=$(".viewCode").val();
			alert(code);
			$.ajax({
				data : {"storageCode" : code},
				url : "./storageDelete",
				type : "get",
				success : function(data){
					alert("삭제 완료");
					location.reload();
				},
				error : function(data){
					alert("error");
				}
			});
		});
		
		$("#sr_insert").click(function(){
			alert("code");
		
			$.ajax({
				type:"GET",
				url:"../../codeName",
				data:{  },
				success:function(data){
					$("#storageCode").val(data);
				}
			});
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
         구매/영업
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
               <li><a href="./menuRegist">메뉴 등록</a></li>
               <li><a href="./storageRegist">창고 등록</a></li>
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
					<div id="sr_icon">icon</div>
					<p id="sr_title">창고등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="sr_search">
						<!-- 검색 기능 -->
							<!-- select box -->
							<div class="input-group">
							<form action="./storageRegist" name="sr_search_frm" method="get">
								<input type="hidden"  name="curPage" value="${list.curPage}">
								<select class="form-control" id="sel1" name="kind">
							        <option class="op" value="storagename">창고명</option>
							        <option class="op" value="storagecode">창고코드</option>
							        <option class="op" value="storageaddr">주소</option>
							     </select>							
							<!-- select box 끝 -->
						
						      <input name="search" type="text" class="form-control" placeholder="Search" name="search">
						      
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
						        <th>창고코드</th>
						        <th>창고명</th>
						        <th>개요</th>
						        <th>주소</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <c:forEach items="${sr_list}" var="sr_list">
						      <tr>
						        <td>${sr_list.storageCode}</td>
						        <td  class="storageView"  title="${sr_list.storageCode}" id="jh_bold_text" data-toggle="modal" data-target="#jh_sr_update_Modal">${sr_list.storageName }</td>
						        <td>${sr_list.storageOp }</td>
						        <td>${sr_list.storageAddr }</td>
						      </tr>
						    </c:forEach>
						    </tbody>
						 </table>
						 
						 <!-- pager -->
						 	<div id="sr_pager">
						 		  <c:if test="${pager.curBlock gt 1}">
									<span class="list" title="${pager.startNum-1}">[이전]</span>
								</c:if>
								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
									<span class="list" title="${i}">${i}</span>
								</c:forEach>
								<c:if test="${pager.curBlock lt pager.totalBlock}">
									<span class="list" title="${pager.lastNum+1}">[다음]</span>
								</c:if>
						 	</div>
						 <!-- pager 끝 -->
					</div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
					<div id="erp_jh_contents_bottom">
						<button id="sr_insert" class="modal_btn" data-toggle="modal" data-target="#jh_sr_Modal">신규등록</button>
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="jh_sr_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|창고 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				         <form action="./storagetWrite" method="post" id="sr_frm">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고코드</span>
							  <input name="storageCode" id="storageCode" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고명</span>
							  <input name="storageName" id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">개요</span>
							   <textarea name="storageOp" class="form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							  <input name="storageAddr" id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="sr_img_div">
							  	<input type="text" name="imgNull">
							  </div>
							</div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default sr_btn" data-dismiss="modal">등록</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				        </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				
				<!-- 수정 Modal -->
				
				<div class="modal fade" id="jh_sr_update_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|창고 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="./storageUpdate" method="post" id="sr_update_frm">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고코드</span>
							  <input readonly="readonly" name="storageCode" id="msg" type="text" class="form-control viewCode"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고명</span>
							  <input name="storageName" id="msg" type="text" class="form-control viewName"placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">개요</span>
							   <textarea name="storageOp" class="viewOp form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							  <input id="msg" type="text" class="form-control viewAddr" name="storageAddr" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="sr_img_div"><input type="text" class="viewImg" name="imgNull"></div>
							</div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default srUpdate" data-dismiss="modal">수정</button>
				          <button type="button" class="btn btn-default srDelete" data-dismiss="modal">삭제</button>
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