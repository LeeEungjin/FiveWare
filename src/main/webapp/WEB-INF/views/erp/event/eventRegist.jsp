<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/eventRegist.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 

<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			swal(message);
		}
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
               <li><a href="../../ware/erp/into/intoList">조회 및 엑셀 다운</a></li>
            </ul>
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">

			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="event_icon">icon</div>
					<p id="event_title">이벤트 등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="event_search">
						<!-- 검색 기능 -->
							<!-- select box -->
						
								<div class="input-group">
								
									<form action="" name="mr_search_frm" method="get">
										<input type="hidden" name="curPage" value="1">
										<select class="form-control" id="sel1" name="kind">
							        		<option class="op" value="eventname">이벤트명</option>
							        		<option class="op" value="eventoption">레시피</option>
							     		</select>							
										<!-- select box 끝 -->
								      <input type="text" class="form-control" placeholder="Search" name="search">
								      
								      <div class="input-group-btn">
								        <button id="search_btn" class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
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
						        <th><input type="checkbox" id="allcheck"></th>
						        <th>코드</th>
						        <th>이벤트명</th>
						        <th>부서</th>
						        <th>기간</th>
						        <th>첨부파일</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    	
						    </tbody>
						 </table>
						 
						 <!-- pager -->
						 	<div id="evnet_pager">
						 		
						 	</div>
						 <!-- pager 끝 -->
					</div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
					<div id="erp_jh_contents_bottom">
						<button>선택삭제</button>
						<button class="modal_btn" data-toggle="modal" data-target="#jh_event_Modal">신규등록</button>
						
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="jh_event_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|이벤트 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="" method="post" id="mr_frm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body">
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">이벤트명*</span>
							  <input type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">등록 부서</span>
							  <input type="text" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">기간</span>
							  <input type="date" class="form-control"  placeholder="Additional Info">
							  -<input type="date" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="form-group">
						      <div id="area_text"><label class="jh_label" for="comment">이벤트 설명을 작성해주세요.</label></div> 
						      <textarea class="form-control form-control_area" rows="5"></textarea>
						    </div>

				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default"  value="등록">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				       </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				<!-- --------------------------------------------------------------------------------------------------------- -->
				
				
				<!-- 수정 Modal -->
				
				
				<!-- 수정 Modal 끝 -->
				
				
			</div>
		</div>
	</div>
</body>
</html>