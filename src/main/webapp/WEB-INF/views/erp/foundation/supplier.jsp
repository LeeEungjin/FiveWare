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

<title>Insert title here</title>

<script type="text/javascript">
	$(function() {

	});

</script>

<style type="text/css">
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>

<style type="text/css">

	* {
	    box-sizing: border-box;
	}
	
	.erp_ej_inputText{
	    width: 100%;
	    padding: 12px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	    resize: vertical;
	}
	
	.erp_ej_label {
	    padding: 12px 12px 12px 0;
	    display: inline-block;
	}
	
	.erp_ej_btn {
	    background-color: #4CAF50;
	    color: white;
	    padding: 12px 20px;
	    border: none;
	    border-radius: 4px;
	    cursor: pointer;
	    float: right;
	}
	
	.erp_ej_btn:hover {
	    background-color: #45a049;
	}
	
	.erp_ej_container {
	    border-radius: 5px;
	    background-color: #f2f2f2;
	    padding: 20px;
	}
	
	.erp_ej_col-25 {
	    float: left;
	    width: 25%;
	    margin-top: 6px;
	}
	
	.erp_ej_col-75 {
	    float: left;
	    width: 75%;
	    margin-top: 6px;
	}
	
	/* Clear floats after the columns */
	.erp_ej_row:after {
	    content: "";
	    display: table;
	    clear: both;
	}
	
	/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
	@media (max-width: 600px) {
	    .erp_ej_col-25, .erp_ej_col-75, input[type=submit] {
	        width: 100%;
	        margin-top: 0;
	    }
	}

</style>


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
					<p id="mr_title">거래처 등록</p>
				</div>
				
				<!-- 검색 기능 -->
				<div id="erp_jh_contents_search">
					<form action="#" method="get">
						<div class="erp_ej_search">
							<div class="erp_ej_inputBox">
								<label for="">거래처 분류</label>
								<select class="erp_ej_account_select" name="///////">
									<option value="">전체</option>
									<option value="">매출서</option>
									<option value="">매입서</option>
									<option value="">매출 및 매입</option>
								</select>
							</div>
							
							<div class="erp_ej_inputBox">
								<label for="">거래처명</label>
								<input type="text" class="ej_inputText" name="///////">
							</div>
							
							<div class="erp_ej_inputBox">
								<input class="ej_search_btn btn" type="button" value="검색">
							</div>
							
						</div>
					</form>					
				</div>
				<!-- 검색 기능 끝 -->
				
				
				<!-- table -->
				<div id="erp_jh_contents_table">
					<table class="table">
					    <thead>
					      <tr>
					        <th><input type="checkbox"></th>
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
							      	<td><input type="checkbox"></td>
							        <td>${dto.code}</td>
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
					 	<div id="mr_pager">
					 		  <a href="#" class="pager_a">◀</a>
							  <a href="#" class="pager_a">1</a>
							  <a href="#" class="pager_a">2</a>
							  <a href="#" class="pager_a">3</a>
							  <a href="#" class="pager_a">4</a>
							  <a href="#" class="pager_a">5</a>
							  <a href="#" class="pager_a">▶</a>
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
<form action="./supplier" method="POST">
<div id="ej_modal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>등록</h2>
    </div>
    <div class="modal-body">
    	<!-- Modal Contents -->
    	<div class="erp_ej_container">
		 	<!-- 거래처 분류 Classification -->
		 	<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label class="erp_ej_label" for="classification">Classification</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <select id="classification" name="classification" class="erp_ej_inputText">
			      <option value="A">매출서</option>
			      <option value="B">매입서</option>
			      <option value="C">매출 및 매입서</option>
			      <option value="D">일반 거래처</option>
			    </select>
			  </div>
			</div>
		 
		 	<!-- 거래처명 Name -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="name">Name</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="name" name="name" class="erp_ej_inputText" placeholder="Supplier name..">
			  </div>
			</div>
			
			<!-- 사업자번호 Business Number -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="business_number">Business Number</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="business_number" name="business_number" class="erp_ej_inputText" placeholder="Your business number..">
			  </div>
			</div>
			
			<!-- 대표자 Representative -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="representative">Representative</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="representative" name="representative" class="erp_ej_inputText" placeholder="Representative name..">
			  </div>
			</div>
			
			<!--  담당자 division -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="division">Division</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="division" name="division" class="erp_ej_inputText" placeholder="Division name..">
			  </div>
			</div>
			
			<!-- 담당자 메일 division_mail -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="division_mail">Division Mail</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="division_mail" name="division_mail" class="erp_ej_inputText" placeholder="Division Mail..">
			  </div>
			</div>
			
			<!--  은행명 bank -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="bank">Bank</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="bank" name="bank" class="erp_ej_inputText" placeholder="Bank name..">
			  </div>
			</div>
			
			<!--  계좌번호 account_number -->
			<div class="erp_ej_row">
			  <div class="erp_ej_col-25">
			    <label for="account_number">Account Number</label>
			  </div>
			  <div class="erp_ej_col-75">
			    <input type="text" id="account_number" name="account_number" class="erp_ej_inputText" placeholder="Account number..">
			  </div>
			</div>
			
		  
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

<script type="text/javascript">

//Get the modal
var modal = document.getElementById('ej_modal');

// Get the button that opens the modal
var btn = document.getElementById("ej_write_btn");

// Get the <span> element that closes the modal
var close = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.addEventListener('click', function() {
	modal.style.display = "block";
});

// When the user clicks on <span> (x), close the modal
close.addEventListener('click', function() {
	modal.style.display = "none";
});
</script>


</body>
</html>