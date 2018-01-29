<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/human/diliMana/diliPlus.css" rel="stylesheet">

<title>Insert title here</title>
<script type="text/javascript">
	$(function(){

		$("#ar_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../../codeName",
				success:function(data){
					$("#ar_dcode").val(data);
				}
			});
		});
		
		$("#ar_dInsertBtn").click(function(){
			var workname=$("#ar_dname").val();
			
			if(workname==""){
				alert("근태명칭을 입력하세요.");
			}else{
				$(this).attr("data-dismiss", "modal");
				dili_insert_Frm.submit();
			} 
		});
		
		$("#ar_dilicode").click(function(){
			var code=$(this).html().trim();

			$.ajax({
				type:"GET",
				url:"./diliUpdate",
				data:{
					"code":code
				}, success:function(data){
					$("#ar_ddcode").val(data.code);
					$("#ar_ddname").val(data.workname);
					
					if(data.vacation=="사용"){
						$("#ar_vacok").prop("selected", true);
					}else{
						$("#ar_vacno").prop("selected", true);
					}
					
					if(data.sal=="유급"){
						$("#ar_salok").prop("selected",true);
					}else{
						$("#ar_salno").prop("selected",true);
					}
					
					$("#ar_ddother").html(data.other);
				}
			});
		});
		
		$("#ar_diliUpdateBtn").click(function(){
			dili_update_Frm.submit();
		});
		
		$("#ar_deleteBtn").click(function(){
			var count=0;
			var code="";
			var cod=[];
			
			$(".ar_diliselect").each(function(d){
				if(this.checked){
					code = $(this).attr("id");
					count++;
					cod.push(code);
				}
			});
			
			$.ajax({
				type: "POST",
				url:"./diliDelete",
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
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∨
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="${url }/human/basisInfo/positionPlus">직책 등록 </a></li>
					<li> <a href="${url }/human/basisInfo/salPlus">급여 등록</a> </li>
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
					<li><a href="${url }/human/memberMana/memberPlus"> 사원 등록</a> </li>
					<li> <a href="${url }/human/memberMana/retireeMana"> 퇴직자 </a></li>
				</ul>
			</div>
			
			<!-- -------------------- -->
					<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∧
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub4">
				<ul>
					<li><a href="${url}/human/diliMana/diliPlus">  근태항목 등록 </a></li>
					<li><a href="${url}/human/diliMana/diliInput">  근태 입력 </a></li>
					<li><a href="${url}/human/diliMana/diliSearch">  근태 조회</a> </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
			
			
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
				<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">근태항목 등록</p>
			</div>
			
				
			<form action="diliPlus" method="GET">
				<div id="erp_jh_event_sub">
					<div id="event_contents">
						<p>　</p>
						근태항목명  <input type="text" name="search" id="ar_ssearch">
						<input type="submit"  value="검색" id="ar_ssearchBtn">
						<p>　</p>
				</div>
			</div>
				</form>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_CheckTitle ar_titleDiv1" ><input type="checkbox">	</div>
					<div class="ar_CodeTitle ar_titleDiv1"> 근태코드 </div>
					<div class="ar_NameTitle ar_titleDiv1"> 근태명 </div>
					<div class="ar_TaxTitle ar_titleDiv1"> 휴가코드여부 </div>
					<div class="ar_BierTitle ar_titleDiv1"> 유무급 </div>					
					<div class="ar_OtherTitle ar_titleDiv1"> 비고 </div>
				</div>
				
			<c:forEach items="${diliList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_CheckTitle" ><input type="checkbox"  class="ar_diliselect"id="${list.code}">	</div>
						<div class="ar_CodeTitle ar_Code"  data-toggle="modal" data-target="#ar_diliUpdate" id="ar_dilicode" > ${list.code} </div>
						<div class="ar_NameTitle"> ${list.workname} </div>
						<div class="ar_TaxTitle"> ${list.vacation} </div>
						<div class="ar_BierTitle"> ${list.sal} </div>					
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
				          <h4 class="modal-title">| 근태항목 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form name="dili_insert_Frm" method="POST" action="diliInsert">
				        
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">근태코드</span>
				        		<input type="text" name="code" class="arin_pcodeInput1" id="ar_dcode" readonly="readonly">
				        		
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">근태명칭</span>
				        		<input type="text" name="workname" class="arin_pcodeInput" id="ar_dname"  >
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">휴가코드</span>
				        		<select name="vacation"  class="ar_sselect" id="ar_dvacation">
				        			<option value="사용" >사용</option>
				        			<option value="미사용">미사용</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">유/무급</span>
				        		<select name="sal" class="ar_sselect" id="ar_dsal">
				        			<option value="유급">유급</option>
				        			<option value="무급" >무급</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">메 모</span>
				        		<textarea rows="" cols="" name="other" id="ar_dother"></textarea>
				        	</div>
				        				</form>		
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default" id="ar_dInsertBtn" data-dismiss="" value="등록">
				          <input type="button" class="btn btn-default" data-dismiss="modal" value="Close">
				        </div>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				  	<!-- Modal -->
				
				<div class="modal fade" id="ar_diliUpdate" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">				        
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">| 근태항목 수정</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form name="dili_update_Frm" method="POST" action="diliUpdate">
				        
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">근태코드</span>
				        		<input type="text" name="code" class="arin_pcodeInput1" id="ar_ddcode" readonly="readonly">
				        		
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext">근태명칭</span>
				        		<input type="text" name="workname" class="arin_pcodeInput" id="ar_ddname"  readonly="readonly">
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">휴가코드</span>
				        		<select name="vacation"  class="ar_sselect" id="ar_ddvacation">
				        			<option value="사용"  id="ar_vacok">사용</option>
				        			<option value="미사용" id="ar_vacno">미사용</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert1" >
				        		<span class="ar_positiontext">유/무급</span>
				        		<select name="sal" class="ar_sselect" id="ar_ddsal">
				        			<option value="유급" id="ar_salok">유급</option>
				        			<option value="무급" id="ar_salno">무급</option>	
				        		</select>
				        	</div>
				        	
				        	<div class="ar_salInsert" >
				        		<span class="ar_positiontext1">메 모</span>
				        		<textarea rows="" cols="" name="other" id="ar_ddother"></textarea>
				        	</div>
				        				</form>		
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default" id="ar_diliUpdateBtn" data-dismiss="" value="수정">
				          <input type="button" class="btn btn-default" data-dismiss="modal" value="Close">
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