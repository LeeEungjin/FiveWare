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
               <li> 메뉴 등록</li>
               <li> 창고 등록</li>
            </ul>
         </div>
         
         <!-- ----------2---------- -->
            <div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
               전표 입력
            <div class="fw_arrow sub2">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub2">
            <ul>
               <li> 일반 전표 입력</li>
               <li> 일반 관리비 입력</li>
            </ul>
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<!-- --------------------------------------------------------------------------------------------------------------- -->
	
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
					<div id="sr_icon">icon</div>
					<p id="sr_title">창고등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="sr_search">
						<!-- 검색 기능 -->
							<!-- select box -->
								<select class="form-control" id="sel1">
							        <option>창고명</option>
							        <option>창고코드</option>
							        <option>주소</option>
							     </select>							
							<!-- select box 끝 -->
						
							<div class="input-group">
						      <input type="text" class="form-control" placeholder="Search" name="search">
						      
						      <div class="input-group-btn">
						        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						      </div>
						      
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
						    <tr>
						        <td>003</td>
						        <td id="jh_bold_text" data-toggle="modal" data-target="#jh_sr_update_Modal">A창고</td>
						        <td>무엇을 저장하고있습니다.</td>
						        <td>서울 어딘가</td>
						      </tr>
						      <tr>
						    </tbody>
						 </table>
						 
						 <!-- pager -->
						 	<div id="sr_pager">
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
						<button class="modal_btn" data-toggle="modal" data-target="#jh_sr_Modal">신규등록</button>
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
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고코드</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고명</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">개요</span>
							   <textarea class="form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="sr_img_div"></div>
							</div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">등록</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
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
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고코드</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고명</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">개요</span>
							   <textarea class="form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="sr_img_div"></div>
							</div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">수정</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">삭제</button>
				        </div>
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