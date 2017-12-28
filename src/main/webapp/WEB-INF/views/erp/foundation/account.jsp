<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<link href="${url}/resources/css/erp/menuRegist.css" rel="stylesheet">

<title>Insert title here</title>

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


</head>
<body>

<c:import url="${url}/resources/temp/headerExample.jsp"></c:import>

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
		<!-- submenu banner -->
		<div id="fw_subbanner">
			subTitle
		</div>
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
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="mr_icon">icon</div>
					<p id="mr_title">거래처 등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="mr_search">
						<!-- 검색 기능 -->
						<form id="erp_ej_search_frm" action="////////////" method="get">
							<!-- select box -->
								<select class="form-control" id="sel1" name="///////////">
							        <option value="">거래처 분류</option>
							        <option value="">전체</option>
							        <option value="">매출처</option>
							        <option value="">매입처</option>
							        <option value="">매입 및 매출처</option>
							        <option value="">일반거래처</option>
							     </select>							
							<!-- select box 끝 -->
						
							<!-- 거래처명 -->
							<div class="form-group">
							  <label class="col-sm-2 control-label">거래처명</label>
							  <div class="col-sm-10">
							    <input class="form-control" id="focusedInput" type="text" name="///////////////">
							  </div>
							</div>
							<!-- 거래처명 끝  -->
						</form>
						<!-- 검색 기능 끝 -->
						
					</div>
				</div>
				
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
						        <th>전화번호</th>
						        <th>사용구분</th>
						      </tr>
						    </thead>
						    <tbody>
						    <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>국민은행</td>
						        <td>110-232-41243421-31</td>
						        <td>이응진</td>
						        <td>010-5496-8631</td>
						        <td>사용</td>
						      </tr>
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
						<button class="modal_btn" id="ej_write_btn">신규등록</button>
					</div>
				<!-- 등록 버튼 끝 -->
			</div>
	</div>
</div>


<!-- Modal Start -->
<!-- The Modal -->
<div id="ej_modal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>Modal Header</h2>
    </div>
    <div class="modal-body">
      <p>Some text in the Modal Body</p>
      <p>Some other text...</p>
    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>

</div>
<!-- Modal End -->

<script type="text/javascript">

//Get the modal
var modal = document.getElementById('ej_modal');

// Get the button that opens the modal
var btn = document.getElementById("ej_write_btn");

// Get the <span> element that closes the modal
var close = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
/* btn.onclick = function() {
    modal.style.display = "block";
} */
btn.addEventListener('click', function() {
	modal.style.display = "block";
});

// When the user clicks on <span> (x), close the modal
/* span.onclick = function() {
    modal.style.display = "none";
} */
close.addEventListener('click', function() {
	modal.style.display = "none";
});
</script>


</body>
</html>