<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/human/diliMana/diliInput.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
		
		$("#ar_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"./diliNameList",
				success:function(data){
					var i=0;
					$(data).each(function(d){
						$("#ar_workName").append("<option value="+data[i]+">"+data[i]+"</option>");		
						i++;
					});
					
				}
			});
		});
		
		$(".ar_dateWrap").change(function(){
			var startdate = Date.parse($("#ar_date1").val());
			var enddate = Date.parse($("#ar_date2").val());
			var datenum =0;	
		
			if(startdate != "" && enddate !=""){
				if(enddate>startdate){
					datenum = (enddate-startdate)/(1000*60*60*24);
				}else{
					datenum=(startdate-enddate)/(1000*60*60*24);
				}
				$("#ar_datenum").val(datenum);		
			}else{
				$("#ar_datenum").val("");		
			}
		});
		
		$("#ar_memsearchBtn").click(function(){
			var count =0;
			$.ajax({
				type:"GET",
				url:"./memList",
				success:function(data){
					$(".ar_memList").html("");
					$(".ar_mmmem_plus").html("");
					$("#ar_mmmem_other").html("");
					
					var i=0;
					$(data[0]).each(function(){
						$(".ar_memList").append("<div class=ar_memListCheck><input type=checkbox class=ar_memCodeCheck title=" + data[0][i].code+"> </div>");
						
						$(".ar_memList").append("<div id="+data[0][i].code+" class=ar_memmem></div>");
						$("#"+data[0][i].code).append("<div class='ar_memListNum1 ar_mem'><input type=text name=code value="+data[0][i].code+" class=ar_inputWrap readonly=readonly></div>");
						$("#"+data[0][i].code).append("<div class='ar_memListName1 ar_mem'><input type=text name=name value="+data[0][i].name+" class=ar_inputWrap readonly=readonly></div>");
						$("#"+data[0][i].code).append("<div class='ar_memListTemp1 ar_mem'><input type=text name=temp value="+data[0][i].temp+" class=ar_inputWrap readonly=readonly></div>");
						
						i++;
					});
					
					var j=0;
					$(data[1]).each(function(){
						$(".ar_tempSelect").append("<option value="+data[1][j]+">"+data[1][j]+"</option>");
						j++;
					});
					
				}
			});
		});
		
		$("#ar_selectBtn").click(function(){
			var code = "";
			var cod = [];
			
			$(".ar_memCodeCheck").each(function(){
				if(this.checked){
					code = $(this).attr("title");
					var c=$("#"+code).html();
					var d = "<input type='text' class='ar_mmmem_inputBox' name='other'>"
		        	
					$(".ar_mmmem_plus").append(c);
					$("#ar_mmmem_other").append(d);
				}
			});
			
			$(this).attr("data-dismiss", "modal");
		
		});
		
	 	$(".ar_selectWrap").change(function(){
			var workname=$("#ar_workName").val();
			
			 $.ajax({
				 type:"GET",
				 url:"./workCode",
				 data:{
					 "workname":workname
				 }, success:function(data){
					  $("#ar_memWorkCode").val(data); 
				 }
			 });
		}); 
		
		
		$("#ar_memdiliInsertBtn").click(function(){
			var workname=$("#ar_workName").val();
			var datenum = $("#ar_datenum").val();
			
			if(workname==""){
				alert("근태항목을 선택하십시오.");
			}else if(datenum==""){
				alert("날짜를 선택하여주십시오.");
			}else{
				ar_memdiliInsertFrm.submit();
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
			<div class="fw_menu" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
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
					<li><a href="${url}/human/memberMana/memberPlus"> 사원 등록</a> </li>
					<li> 급여 등록 </li>
					<li> 퇴직자 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
		
			
			<!-- -------------------- -->
				<div class="fw_menu  fw_selected" data-toggle="collapse" data-target="#sub4" title="sub4" >
					근태 관리
				<div class="fw_arrow sub4">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub4">
				<ul>
					<li> 근태항목 등록 </li>
					<li> 휴가일수 등록 </li>
					<li> 근태 입력 </li>
					<li> 근태 조회 </li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				mainTitle
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">근태항목 등록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
				<form action="memdiliInsert" method="POST" name="ar_memdiliInsert">
					<div class="ar_plusSearch">
						근태명  
						<select class="diliselected">
							<option value="">전체</option>
							<c:forEach items="${diliNameList}" var="nameList">
								<option value="${nameList }">${nameList }</option>
							</c:forEach>
						</select>
						
						<span class="ar_blanktext">기간</span>
						<input type="date"> ~ <input type="date">
						<input type="submit"  value="검색" id="ar_ssearchBtn">
					</div>
				</form>
			</div>
			
		<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_CodeTitle ar_titleDiv1" >사번</div>
					<div class="ar_NameTitle ar_titleDiv1"> 성명 </div>
					<div class="ar_NameTitle ar_titleDiv1"> 부서명 </div>
					<div class="ar_DiliWrap ar_titleDiv1">
						<div class="ar_Dili "> 근태항목 </div>
						<div class="ar_SecTitle ar_titleDiv1"> 코드 </div>
						<div class="ar_SecTitle  ar_titleDiv1"> 명 </div>
					</div>
					<div class="ar_DiliWrap ar_titleDiv1">
						<div class="ar_Dili "> 기간 </div>					
						<div class="ar_SecTitle  ar_titleDiv1"> 부터 </div>
						<div class="ar_SecTitle ar_titleDiv1"> 까지 </div>
					</div>				
					<div class="ar_DateTitle ar_titleDiv1"> 일수 </div>
					<div class="ar_OtherTitle ar_titleDiv1"> 메모 </div>
				</div>
				
					<div class="ar_CodeTitle ar_Code"  data-toggle="modal" data-target="#ar_dili2Update" id="ar_dilicode" > dddd </div>
				
				<c:forEach items="${diliList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_CheckTitle" ><input type="checkbox"  class="ar_diliselect"id="${list.code}">	</div>
						<div class="ar_CodeTitle ar_Code"  data-toggle="modal" data-target="#ar_dili2Update" id="ar_dilicode" > ${list.code} </div>
						<div class="ar_NameTitle"> ${list.workname} </div>
						<div class="ar_TaxTitle"> ${list.vacation} </div>
						<div class="ar_BierTitle"> ${list.sal} </div>					
						<div class="ar_OtherTitle"> ${list.other} </div>						
					</div>
				</c:forEach>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_insertBtn" data-toggle="modal" data-target="#ar_diliInsert" value="신규 등록">
			</div>
			
			<!-- Modal -->
				
				<div class="modal fade" id="ar_diliInsert" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 근태 입력</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form name="ar_memdiliInsertFrm" method="POST" action="memdiliInsert">
				        
				        <div class="modal_topWrap">
					        	<div class="ar_salInsert" >
					        		<span class="ar_positiontext">근태항목</span>
									<select  class="ar_selectWrap"id="ar_workName" name="workname">
										<option value="">----선택----</option>
									</select>				 
									
									<input type="hidden" id="ar_memWorkCode" name="workcode">        		
					        	</div>
					        	
					        	<div class="ar_salInsert2" >
					        	
					        		<span class="ar_positiontext">기간</span>
					        		<input type="date" class="ar_dateWrap" id="ar_date1" name="startdate">~<input type="date" class="ar_dateWrap" id="ar_date2" name="enddate">
					        	</div>
					        	
					        	<div class="ar_salInsert3" >
					        		<span class="ar_positiontext">일수</span>
					        		<input type="text" readonly="readonly" name="datenum" id="ar_datenum">
					        	</div>
					   </div>
				        	
				        	<div class="ar_memsearchBtnWrap">
				        		 <input type="button" value="직원검색" id="ar_memsearchBtn" data-toggle="modal" data-target="#ar_memSearch" > 
				        	</div>
				        	
				        	<div class="ar_memberVacWrap">
						        	<div class="ar_memVacTitle ar_mem" >
						        		<p>사번</p>
						        	</div>
						        	
						        	<div class="ar_memVacTitle ar_mem" >
						        		<p>성명</p>
						        	</div>
						        	
						        	<div class="ar_memVacTitle ar_mem" >
						        		<p>부서명</p>
						        	</div>
						        	
						        	<div class="ar_memVacTitle ar_memOther" >
						        		<p>메모</p>
						        	</div>
				        	</div>
				        	
				        	<div class="ar_mmmem">
				        			<div class="ar_mmmem_plus">
				        			
				        			</div>
						        	
						        	<div id="ar_mmmem_other">
						        	
						        	</div>
						        	
				        	</div>
				</form>		
		</div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default" id="ar_memdiliInsertBtn" data-dismiss="" value="등록">
				          <input type="button" class="btn btn-default" data-dismiss="modal" value="Close">
				        </div>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				  	<!-- Modal -->
				
				<div class="modal fade" id="ar_memSearch" role="dialog">
				    <div class="modal-dialog modal-m ar_modalMember">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">				        
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">| 직원 조회</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form name="dili_update_Frm" method="POST" action="diliUpdate">
				        
				        	<div class="ar_TempSearch" >
				        		<span class="ar_positiontext">부서명</span>
								<select class="ar_tempSelect">
										<option value="">전체</option>
								</select>				        		
								<input type="button" value="검색" id="ar_tempSearchBtn">
				        	</div>
				        	
				        <div class="ar_memberWrap">
				        	<div class="ar_memListTop">
				        		<div class="ar_memListCheck"><input type="checkbox"> </div>
				        		<div class="ar_memListNum">사번</div>
				        		<div class="ar_memListName">직원명</div>
				        		<div class="ar_memListTemp">부서</div>
				        	</div>		
				        	
				        	
				        		<div class="ar_memList">
				        			
				        		</div>	        
				        </div>
				        
				        
				        				</form>		
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer footer2">
				          <input type="button" class="btn btn-default" id="ar_selectBtn" data-dismiss="" value="선택">
				          <input type="button" class="btn btn-default" data-dismiss="modal" value="Close">
				        </div>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
					<!-- Modal -->
				
				<div class="modal fade" id="ar_dili2Update" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">| 근태 입력</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form name="dili_insert_Frm" method="POST" action="diliInsert">
				        
				        <div class="modal_topWrap">
					        	<div class="ar_salInsert" >
					        		<span class="ar_positiontext">근태항목</span>
									<select class="ar_selectWrap">
										
									</select>				        		
					        	</div>
					        	
					        	<div class="ar_salInsert2" >
					        		<span class="ar_positiontext">기간</span>
					        		<input type="date">~<input type="date">
					        	</div>
					        	
					        	<div class="ar_salInsert3" >
					        		<span class="ar_positiontext">일수</span>
					        		<input type="text" readonly="readonly">
					        	</div>
					   </div>
				        	
				        	<div class="ar_memberVacWrap">
						        	<div class="ar_memVacTitle ar_mem" >
						        		<p>사번</p>
						        	</div>
						        	
						        	<div class="ar_memVacTitle ar_mem" >
						        		<p>성명</p>
						        	</div>
						        	
						        	<div class="ar_memVacTitle ar_mem" >
						        		<p>부서명</p>
						        	</div>
						        	
						        	<div class="ar_memVacTitle ar_memOther" >
						        		<p>메모</p>
						        	</div>
				        	</div>
				        	
				        	<div>
				        			<div class=" ar_mem" >
						        		<p>사번</p>
						        	</div>
						        	
						        	<div class=" ar_mem" >
						        		<p>성명</p>
						        	</div>
						        	
						        	<div class=" ar_mem" >
						        		<p>부서명</p>
						        	</div>
						        	
						        	<div class=" ar_memOther" >
						        		<p>메모</p>
						        	</div>
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
				
	</div>
</div>

</body>
</html>