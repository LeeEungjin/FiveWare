<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<link href="${url}/resources/css/erp/supplier.css" rel="stylesheet">
<link href="${url}/resources/css/common/modal.css" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		//Get the modal
		var modal = document.getElementById('ej_modal');
		var modalOne = document.getElementById('ej_modalOne');
		
		// Get the button that opens the modal
		var btn = document.getElementById("ej_write_btn");
		
		// Get the <span> element that closes the modal
		var close = document.getElementsByClassName("close");
		
		// When the user clicks the button, open the modal 
		btn.addEventListener('click', function() {
			modal.style.display = "block";
		});
		
		// update - selectOne
		$(".ej_modalOne_btn").click(function() {
			modalOne.style.display = "block";
			
			var code = $(this).text();
			$.ajax({
	            data : {"code" : code},
	            url : "//////////////////////////////",
	            type : "get",
	            success : function(data){
	            	$("#code_update").val(data.code);
					$("#classification_update").val(data.classification);
					$("#name_update").val(data.name);
					$("#business_number_update").val(data.business_number);
					$("#representative_update").val(data.representative);
					$("#division_update").val(data.division);
					$("#division_mail_update").val(data.division_mail);
					$("#bank_update").val(data.bank);
					$("#account_number_update").val(data.account_number);
					$("#use_update").val(data.use);
					
					// if 'use' is true, 'stop'
					if($("#use_update").val() == "true") {
						$("#ej_modal_stop").val("사용중지")
					} else {
						$("#ej_modal_stop").val("사용")
					}
	            },
	            error : function(data){
	               alert("error");
	            }
         	}); 
		});
		
		// When the user clicks on <span> (x), close the modal
		close[0].addEventListener('click', function() {
			modal.style.display = "none";
		});
		
		close[1].addEventListener('click', function() {
			modalOne.style.display = "none";
		});
		
		/////////////////////////////delete / use Stop////////////////////////////////////
		$("#ej_modal_delete").click(function() {
			var del = confirm("Are you sure you want to delete it?")
			
			if(del) {
				$("#ej_modalModify_frm").attr("action", "//////////////////////")
				$("#ej_modalModify_frm").submit();
			}
		});
		
		$("#ej_modal_stop").click(function() {
			$("#ej_modalModify_frm").attr("action", "////////////////////////")
			$("#ej_modalModify_frm").submit();
		});
		///////////////////////////////////////////////////////////////////////
		
		/* 페이저 */
		$(".ej_list").click(function() {
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.ej_frm.curPage.value=cur;
			document.ej_frm.submit();
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
			인사
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
					<li> 선택1</li>
					<li> 선택2</li>
					<li> 선택3</li>
					<li> 선택4</li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
					사원관리
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub2">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					사원관리
				<div class="fw_arrow sub3" >
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub3">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					사원관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					사원관리
				<div class="fw_arrow sub5">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub5">
				<ul>
					<li> 비선택1</li>
					<li> 비선택2</li>
					<li> 비선택3</li>
					<li> 비선택4</li>
				</ul>
			</div>
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<div class="sales_title_menu">기초 정보</div>
				<div class="sales_title_menu">구매 관리</div>
				<div class="sales_title_menu">자재 관리</div>
				<div class="sales_title_menu">반품 관리</div>
				<div class="sales_title_menu">조 회</div>
			</div>
			
			<!-- main contents -->
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="mr_icon">icon</div>
					<p id="mr_title">제품 등록</p>
				</div>
				
				<!-- 검색 기능 -->
				<div id="erp_jh_contents_search">
					<form name="ej_frm" action="######################" method="get">
						<div class="erp_ej_inputBox">
							<select class="" name="kind">
								<option value="name">품목명</option>
								<option value="code">품목코드</option>
								<option value="standard">규격</option>
							</select>
						</div>
						<input class="" type="text" name="search">
					</form>					
				</div>
				<!-- 검색 기능 끝 -->
				
				
				<!-- table -->
				<div id="erp_jh_contents_table">
					<table class="table">
					    <thead>
					      <tr>
					        <th><input type="checkbox" id="ej_erp_totalCheckBox"></th>
					        <th>코드</th>
					        <th>거래처명</th>
					        <th>사업자번호</th>
					        <th>대표자</th>
					        <th>사용구분</th>
					      </tr>
					    </thead>
					    <tbody>
						    <c:forEach items="${list}" var="dto">
							    <tr>
							      	<td><input type="checkbox" class="ej_erp_checkBox"></td>
							        <td><a class="ej_modalOne_btn">${dto.code}</a></td>
							        <td>${dto.name}</td>
							        <td>${dto.business_number}</td>
							        <td>${dto.representative}</td>
							        <td>
							        	<c:if test="${dto.use eq true}">
							        		사용
							        	</c:if>
							        	<c:if test="${dto.use ne true}">
							        		미사용
							        	</c:if>
							        </td>
							      </tr>
						    </c:forEach>
					    </tbody>
					 </table>
					 
					 <!-- pager -->
					 	<div id="mr_pager" style="margin-top: 20px;">
							<c:if test="${pager.curBlock gt 1}">
								<span class="ej_list" title="${pager.startNum-1}">◀</span>
							</c:if>
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
								<span class="ej_list" title="${i}">${i}</span>
							</c:forEach>
							<c:if test="${pager.curBlock lt pager.totalBlock}">
								<span class="ej_list" title="${pager.lastNum+1}">▶</span>
							</c:if>
						</div>
					 <!-- pager 끝 -->
				</div>
				<!-- table 끝 -->
					
				<!-- 등록 버튼 -->
				<div id="erp_jh_contents_bottom">
					<button class="ej_right_btn btn" id="ej_write_btn">신규등록</button>
				</div>
				<!-- 등록 버튼 끝 -->
				
			</div>
			<!-- END_main contents -->
	</div>
</div>


<!-- Modal Start -->
<form id="ej-modal-form" action="###########################" method="POST">
<div id="ej_modal" class="modal">

  <!-- Modal content -->
  <div id="modal-result" class="modal-content">
	  <div class="modal-header">
	    <span class="close">&times;</span>
	    <h2>| 제품 등록</h2>
	  </div>
	  <div class="modal-body">
	  
	  	<!-- Modal Contents -->
	  	<div class="erp_ej_container">
	  	
	  
		</div>
	  	<!-- Modal Contents End -->
		  
	  </div>
	  <div class="modal-footer">
	    <input type="submit" id="ej_modal_wirte" class="btn" value="등록">
	  </div>
  </div>

</div>
</form>
<!-- Modal End -->


<!-- Modal update/delete Start -->
<form id="ej_modalModify_frm" action="###################################" method="POST">

<div id="ej_modalOne" class="modal">

  <!-- Modal content -->
  <div id="modal-result" class="modal-content">
	  <div class="modal-header">
	    <span class="close">&times;</span>
	    <h2>거래처 정보</h2>
	  </div>
	  <div class="modal-body">
	  
	  	<!-- Modal Contents -->
	  	<div class="erp_ej_container">
	  	
	  
		</div>
	  	<!-- Modal Contents End -->
		  
	  </div>
	  <div class="modal-footer">
	    <input type="submit" id="ej_modal_update" class="btn" value="수정">
	    <input type="button" id="ej_modal_stop" class="btn" value="사용중지">
	    <input type="button" id="ej_modal_delete" class="btn" value="삭제">
	  </div>
  </div>

</div>
</form>
<!-- Modal update/delete End -->


</body>
</html>