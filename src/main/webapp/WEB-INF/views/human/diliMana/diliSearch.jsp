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
				<p id="ar_plustext">근태 현황 조회</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
				
				
				<!-- ID 수정해!!!! -->
				
				<form action="diliPlus" method="GET">
					<div class="ar_plusSearch">
						조회 기간 <input type="date" name="search" id="ar_ssearch"> ~<input type="date" name="search" id="ar_ssearch">
						직원명<input type="text">
						<input type="submit"  value="검색" id="ar_ssearchBtn">
					</div>
					
				
				</form>
				<!-- ID 수정끝!!!! -->
				
			</div>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_CheckTitle ar_titleDiv1" ><input type="checkbox">	</div>
					<div class="ar_CodeTitle ar_titleDiv1"> 사번 </div>
					<div class="ar_NameTitle ar_titleDiv1"> 성명 </div>
					<div class="ar_OtherTitle ar_titleDiv1"> 비고 </div>
				</div>
				
				<%-- <c:forEach items="${diliList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_CheckTitle" ><input type="checkbox"  class="ar_diliselect"id="${list.code}">	</div>
						<div class="ar_CodeTitle ar_Code"  data-toggle="modal" data-target="#ar_diliUpdate" id="ar_dilicode" > ${list.code} </div>
						<div class="ar_NameTitle"> ${list.workname} </div>
						<div class="ar_TaxTitle"> ${list.vacation} </div>
						<div class="ar_BierTitle"> ${list.sal} </div>					
						<div class="ar_OtherTitle"> ${list.other} </div>						
					</div>
				</c:forEach> --%>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button"  value="Excel">
			</div>
			
	</div>
</div>

</body>
</html>