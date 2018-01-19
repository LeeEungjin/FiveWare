<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/into.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		/////////////////////////load//////////////////////////
		$.ajax({
			url : "./intoSupplier",
			type : "post",
			data : { tableName : 'Supplier'},
			success : function(result){
				$("#erp_jh_contents_table").html(result);
			}
		});
		
		///////////////////////TAB BUTTON//////////////////////
		$(".into").click(function(){
			var tableName=$(this).attr("title");
			
			$.ajax({
				url : "./into"+tableName,
				type : "post",
				data : { tableName : tableName },
				success : function(result){
					$("#erp_jh_contents_table").html(result);
					$("#ej_excel_path").val(tableName);
				}
			});
		});
		
		$(".mater").click(function() {
			var kind=$(this).attr('title');
			
			$.ajax({
				url : "./intoMaterOne",
				type : "post",
				data : { tableName : "mater",
						 kind : kind	
					},
				success : function(result){
					$("#erp_jh_contents_table").html(result);
					$("#ej_excel_path").val('mater');
					$("#ej_excel_path").attr('title', kind);
				}
			});
			
		});
		
		////////////////EXCEL DOWNLOAD/////////////////////////////
		$("#ej_excel_path").click(function() {
			var tableName = $(this).val();
			var kind = $(this).attr("title");
			
			if(kind == null) {
				location.href='../../excel/'+tableName+'/excel2007';
			} else {
				location.href='../../excel/mater/excel2007';
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
         <div class="fw_menu fw_selected sub1" data-toggle="collapse" data-target="#sub1" title="sub1">
            기초정보
            <div class="fw_arrow sub1">
               ∧
            </div>
         </div>
         
         <div class="fw_subselected collapse" id="sub1">
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
         <div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
               	조회
            <div class="fw_arrow sub4">
               	∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub4">
            <ul>
               <li>조회 및  엑셀 다운</li>
            </ul>
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<h1>${table}</h1>
			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="into_icon">icon</div>
					<p id="into_title">조회 및 엑셀 다운로드</p>
				</div>
				
				<div id="erp_jh_contents_search">
					<button class="into" title="Supplier">거래처</button>
					<button class="into" title="Product">제품</button>
					<button class="into" title="Menu">메뉴</button>
					<button class="into" title="Storage">창고</button>
					<button class="into" title="Order">주문</button>
					<div class="dropdown" style="display: inline;">
						<button data-toggle="dropdown">재료</button>
						<ul class="dropdown-menu">
						  <li><a href="#" class="into" title="allMater">전체</a></li>
					      <li><a href="#" class="mater" title="enter">입고</a></li>
					      <li><a href="#" class="mater" title="rele">출고</a></li>
					      <li><a href="#" class="mater" title="back">반품</a></li>
					      <li><a href="#" class="mater" title="confin">불출</a></li>
					    </ul>
					</div>
				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table"></div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
					<div id="erp_jh_contents_bottom">
						<button id="ej_excel_path" value="Supplier" type="button" class="btn">엑셀 다운로드</button>
					</div>
				<!-- 등록 버튼 끝 -->
				

				
				
			</div>
		</div>
	</div>
</body>
</html>