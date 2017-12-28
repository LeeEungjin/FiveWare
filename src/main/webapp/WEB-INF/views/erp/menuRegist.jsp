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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Insert title here</title>

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
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="mr_icon">icon</div>
					<p id="mr_title">메뉴등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="mr_search">
						<!-- 검색 기능 -->
							<!-- select box -->
								<select class="form-control" id="sel1">
							        <option>메뉴명</option>
							        <option>레시피</option>
							        <option>설명</option>
							     </select>							
							<!-- select box 끝 -->
						
							<div class="input-group">
						      <input type="text" class="form-control" placeholder="Search" name="search">
						      
						      <div class="input-group-btn">
						        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
						      </div>
						      
						    </div>	
						<!-- 검색 기능 끝 -->
						
						<!-- 부가 검색 -->
							<div class="dropdown">
							    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">상세검색
							    <span class="caret"></span></button>
							    
							    <ul class="dropdown-menu" id="test">
							      <li class="dropdown-header">가격</li>
							      <li><a href="#">높은 순</a></li>
							      <li><a href="#">낮은 순</a></li>
							      
							      <li class="divider"></li>
							      <li class="dropdown-header">구분</li>
							      <li><a href="#">커피</a></li>
							      <li><a href="#">음료</a></li>
							      <li><a href="#">디저트</a></li>
							      
							      <li class="divider"></li>
							      <li><a href="#">검색 초기화</a></li>
							    </ul>
							 </div>
							<!-- 부가 검색 끝 -->
					</div>
				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table">
						<table class="table">
						    <thead>
						      <tr>
						        <th><input type="checkbox" id="allcheck"></th>
						        <th>코드</th>
						        <th>구분</th>
						        <th>이름</th>
						        <th>가격</th>
						        <th>사진</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <tr>
						      	<td><input type="checkbox" id="menucheck"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td id="jh_bold_text" data-toggle="modal" data-target="#Modal">딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						     
						      <tr>
						      	<td><input type="checkbox" id="menucheck"></td>
						        <td>002</td>
						        <td>[디저트]</td>
						        <td>시나몬 허니 브레드</td>
						        <td>7000원</td>
						        <td>N</td>
						      </tr>
						      
						      <tr>
						      	<td><input type="checkbox" id="menucheck"></td>
						        <td>001</td>
						        <td>[커피]</td>
						        <td>아이스 아메리카노</td>
						        <td>4000원</td>
						        <td>Y</td>
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
						<button>선택삭제</button>
						<button class="modal_btn" data-toggle="modal" data-target="#myModal">신규등록</button>
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|메뉴 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴번호</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴구분</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">가격</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="mr_img_div"></div>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">레시피</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info">
							</div>
							
							<div class="form-group">
							  <!-- <span class="input-group-addon">설명</span> -->
						      <div id="area_text"><label class="jh_label" for="comment">메뉴의 설명을 작성해주세요.</label></div> 
						      <textarea class="form-control form-control_area" rows="5" id="comment"></textarea>
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
				
				<div class="modal fade" id="Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|메뉴 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴번호</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="003">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴구분</span>
							  <select class="form-control" id="sel2">
							        <option selected="selected">커피</option>
							        <option>음료</option>
							        <option>디저트</option>
							     </select>				
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">메뉴명</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="딸기 크림 푸라푸치노">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">가격</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="6000원">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">사진</span>
							  <div id="mr_img_div"></div>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">레시피</span>
							  <input id="msg" type="text" class="form-control" name="msg" placeholder="Additional Info" value="딸기를 넣어 만들어요">
							</div>
							
							<div class="form-group">
							  <!-- <span class="input-group-addon">설명</span> -->
						      <div id="area_text"><label class="jh_label" for="comment">메뉴의 설명을 작성해주세요.</label></div> 
						      <textarea class="form-control form-control_area" rows="5" id="comment">이건 맛있다</textarea>
						    </div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">수정</button>
						  <button type="button" class="btn btn-default" data-dismiss="modal">삭제</button>				        
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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