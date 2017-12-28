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
						        <th><input type="checkbox"></th>
						        <th>코드</th>
						        <th>구분</th>
						        <th>이름</th>
						        <th>가격</th>
						        <th>사진</th>
						      </tr>
						    </thead>
						    <tbody>
						    <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>003</td>
						        <td>[음료]</td>
						        <td>딸기 크림 푸라푸치노</td>
						        <td>6500원</td>
						        <td>Y</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
						        <td>002</td>
						        <td>[디저트]</td>
						        <td>시나몬 허니 브레드</td>
						        <td>7000원</td>
						        <td>N</td>
						      </tr>
						      <tr>
						      	<td><input type="checkbox"></td>
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
							  <span class="input-group-addon">설명</span>
						      <!-- <label for="comment">설명:</label> -->
						      <textarea class="form-control" rows="5" id="comment"></textarea>
						    </div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
			</div>
	</div>
</div>

</body>
</html>