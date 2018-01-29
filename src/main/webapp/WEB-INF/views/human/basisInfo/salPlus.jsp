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

<script type="text/javascript">
	$(function(){
		
		$("#ar_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../../codeName",
				success:function(data){
					$("#sal_code").val(data);
				}
			});
		});
		
		$("#ar_salInsertBtn").click(function(){
			var code=$("#sal_code").val();
			var salName=$("#sal_name").val();
			
			if(salName==""){
				alert("항목명을 입력하세요.");
			}else{
				$(this).attr("data-dismiss", "modal");
				sal_insert_frm.submit();
			} 
		});
		
		$("#ar_salcod").click(function(){
			var code=$(this).html().trim();

			$.ajax({
				type:"GET",
				url:"./salUpdate",
				data:{
					"code":code
				}, success:function(data){
					/* alert($("#sal_stax").val()); */
					$("#sal_scode").val(data.code);
					$("#sal_sname").val(data.salName);
					
					if(data.tax=="과세대상"){
						$("#sal_taxok").prop("selected", true);
					}else{
						$("#sal_taxno").prop("selected", true);
					}
					
					if(data.bonus=="상여대상"){
						$("#sal_bonusok").prop("selected",true);
					}else{
						$("#sal_bonusno").prop("selected",true);
					}
					
					$("#sal_sother").html(data.other);
				}
			});
		});
		
		$("#sal_updateBtn").click(function(){
			ar_updateFrm.submit();
		});
		
		$("#ar_deleteBtn").click(function(){
			var count=0;
			var code="";
			var cod=[];
			
			$(".ar_salselect").each(function(d){
				if(this.checked){
					code = $(this).attr("id");
					count++;
					cod.push(code);
				}
			});
			
			$.ajax({
				type: "POST",
				url:"./salDelete",
				data:{
					"code":cod.toString()
				}, success:function(data){
					alert(count+"개의 급여항목이 삭제되었습니다.");
					
					location.reload();
				}
			});
		});
		
	});
</script>
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
					<li> <a href="#">급여 등록</a> </li>
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
					<li><a href="${url}/human/memberMana/memberPlus"> 사원 등록</a> </li>
					<li> <a href="${url}/human/memberMana/retireeMana"> 퇴직자</a> </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
			
			
			<!-- -------------------- -->
			<div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub4">
				<ul>
					<li><a href="${url}/human/diliMana/diliPlus">  근태항목 등록 </a></li>
					<li><a href="${url}/human/diliMana/diliInput">  근태 입력 </a></li>
					<li><a href="${url}/human/diliMana/diliSearch">  근태 조회</a> </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub5" title="sub5" >
					블랙리스트
				<div class="fw_arrow sub5">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse"  id="sub5">
				<ul>
					<li><a href="${url}/community/blackList">  블랙리스트 </a></li>
				</ul>
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
				
				<form action="salPlus" method="GET">
					<div class="ar_plusSearch">
						급여항목명  <input type="text" name="search" id="ar_ssearch">
						<input type="submit"  value="검색" id="ar_ssearchBtn">
					</div>
				</form>
			</div>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_CheckTitle ar_titleDiv1" ><input type="checkbox">	</div>
					<div class="ar_CodeTitle ar_titleDiv1"> 급여코드 </div>
					<div class="ar_NameTitle ar_titleDiv1"> 항목명 </div>
					<div class="ar_TaxTitle ar_titleDiv1"> 과세여부 </div>
					<div class="ar_BierTitle ar_titleDiv1"> 상여대상여부 </div>					
					<div class="ar_OtherTitle ar_titleDiv1"> 비고 </div>
				</div>
				
				<c:forEach items="${salList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_CheckTitle" ><input type="checkbox"  class="ar_salselect"id="${list.code}">	</div>
						<div class="ar_CodeTitle ar_Code"  data-toggle="modal" data-target="#ar_salUpdate" id="ar_salcod" > ${list.code} </div>
						<div class="ar_NameTitle"> ${list.salName} </div>
						<div class="ar_TaxTitle"> ${list.tax} </div>
						<div class="ar_BierTitle"> ${list.bonus} </div>					
						<div class="ar_OtherTitle"> ${list.other} </div>						
					</div>
				</c:forEach>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_deleteBtn" value="선택 삭제" >
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
				        
				        <form name="sal_insert_frm" method="POST" action="salInsert">
				        
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">항목코드</span>
				        		<input type="text" name="code" class="arin_pcodeInput1" id="sal_code" readonly="readonly">
				        		
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">항목명</span>
				        		<input type="text" name="salName" class="arin_pcodeInput" id="sal_name"  >
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">과세여부</span>
				        		<select name="tax"  class="ar_sselect" id="sal_tax">
				        			<option value="과세대상" >예</option>
				        			<option value="과세비대상">아니오</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">상여대상</span>
				        		<select name="bonus" class="ar_sselect" id="sal_bonus">
				        			<option value="상여대상">예</option>
				        			<option value="상여비대상" >아니오</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">비 고</span>
				        		<textarea rows="" cols="" name="other" id="sal_other"></textarea>
				        	</div>
				        				</form>		
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default" id="ar_salInsertBtn" data-dismiss="" value="등록">
				          <input type="button" class="btn btn-default" data-dismiss="modal" value="Close">
				        </div>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				  	<!-- Modal -->
				
				<div class="modal fade" id="ar_salUpdate" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">				        
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 급여항목 수정</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form action="salUpdate" method="post" name="ar_updateFrm">
				        
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">항목코드</span>
				        		<input type="text" name="code" class="arin_pcodeInput1" id="sal_scode" readonly="readonly">
				        		<input type="button" value="중복여부" id="pcode_btn">
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">항목명</span>
				        		<input type="text" name="salName" class="arin_pcodeInput" id="sal_sname" readonly="readonly">
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">과세여부</span>
				        		<select name="tax"  class="ar_sselect" id="sal_stax">
				        			<option value="과세대상"  id="sal_taxok">예</option>
				        			<option value="과세비대상" id="sal_taxno">아니오</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">상여대상</span>
				        		<select name="bonus" class="ar_sselect" id="sal_sbonus">
				        			<option value="상여대상" id="sal_bonusok">예</option>
				        			<option value="상여비대상" id="sal_bonusno">아니오</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">비 고</span>
				        		<textarea rows="" cols="" name="other" id="sal_sother"></textarea>
				        	</div>
				        			</form>			
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="" id="sal_updateBtn">수정</button>
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