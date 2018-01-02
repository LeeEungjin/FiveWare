<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/human/basisInfo/salPlus.css" rel="stylesheet">

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
					<li> <a href="positionPlus">직책 등록 </a></li>
					<li> <a href="salPlus">급여 등록</a> </li>
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
					<li> 사원 등록 </li>
					<li> 급여 등록 </li>
					<li> 퇴직자 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					급여관리
				<div class="fw_arrow sub3" >
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub3">
				<ul>
					<li> 급여 계산 </li>
					<li> 퇴직금 계산 </li>
					<li> 개인별 급여 현황 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
					<li> 근태항목 등록 </li>
					<li> 휴가일수 등록 </li>
					<li> 근태 입력 </li>
					<li> 근태 조회 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					조회
			
			</div>
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				mainTitle
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">급여항목 등록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
				<div class="ar_plusSearch">
					급여항목명  <input type="text" name="search" id="ar_ssearch">
					<input type="button" value="검색" id="ar_ssearchBtn">
				</div>
			</div>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_CheckTitle ar_titleDiv1" ><input type="checkbox">	</div>
					<div class="ar_CodeTitle ar_titleDiv1"> 급여코드 </div>
					<div class="ar_NameTitle ar_titleDiv1"> 항목명 </div>
					<div class="ar_TaxTitle ar_titleDiv1"> 과세여부 </div>
					<div class="ar_BierTitle ar_titleDiv1"> 상여대상여부 </div>					
					<div class="ar_OrderTitle ar_titleDiv1"> 항목순서 </div>
					<div class="ar_OtherTitle ar_titleDiv1"> 비고 </div>
				</div>
				
					<div class="ar_listDiv">
					<div class="ar_CheckTitle" ><input type="checkbox">	</div>
					<div class="ar_CodeTitle"> B1010 </div>
					<div class="ar_NameTitle"> 항목명 </div>
					<div class="ar_TaxTitle"> 과세여부 </div>
					<div class="ar_BierTitle"> 상여대상여부 </div>					
					<div class="ar_OrderTitle"> 항목순서 </div>
					<div class="ar_OtherTitle"> 비고 </div>
					
				</div>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_deleteBtn" value="선택 삭제">
				<input type="button" id="ar_insertBtn" data-toggle="modal" data-target="#ar_salInsert" value="신규 등록">
			</div>
			
			<!-- Modal -->
				
				<div class="modal fade" id="ar_salInsert" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 급여항목 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">항목코드</span>
				        		<input type="text" name="code" class="arin_pcodeInput1">
				        		<input type="button" value="중복여부" id="pcode_btn">
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">항목명</span>
				        		<input type="text" name="salname" class="arin_pcodeInput">
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">과세여부</span>
				        		<select name="tax"  class="ar_sselect">
				        			<option value="yes" selected="selected">예</option>
				        			<option value="no">아니오</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">상여대상</span>
				        		<select name="bonus" class="ar_sselect">
				        			<option value="yes">예</option>
				        			<option value="no" selected="selected">아니오</option>	
				        		</select>
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
	</div>
</div>

</body>
</html>