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
		
		var search='${search}';	
		
		$(".ar_selectsearch").each(function(){
			
			if($(this).val()==search){
				$(this).attr("selected", true);
			}
		});
		
		$("#ar_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"./diliNameList",
				success:function(data){
					$("#ar_workName").html("");
					var i=0;
					$(data).each(function(d){
						$("#ar_workName").append("<option value="+data[i]+">"+data[i]+"</option>");		
						i++;
					});
					
				}
			});
		});
		
		$(".ar_dateWrap").change(function(){
			var startdate =0;
			var enddate=0;
			var datenum =0;	
				
			if($(this).attr("title")=="update"){
				startdate = Date.parse($("#ar_ustartdate").val());
				 enddate = Date.parse($("#ar_uenddate").val());
			}else{
				 startdate = Date.parse($("#ar_date1").val());
				 enddate = Date.parse($("#ar_date2").val());
			}

			if(startdate > 0 && enddate>0) {
				if(enddate>=startdate){
					datenum = (enddate-startdate)/(1000*60*60*24);
					datenum++;
				}else{
					alert("날짜를 다시 입력해주세요.");
					$(this).val(startdate/(1000*60*60*24));
				}
			
				if($(this).attr("title")=="update"){
					if($(this).val()==0){
						$("#ar_udatenum").val("");	
					}else{
						$("#ar_udatenum").val(datenum);		
					}
				}else{
					if($(this).val()==0){
						$("#ar_datenum").val("");	
					}else{
						$("#ar_datenum").val(datenum);		
					}
					
				} 
			}else{
				$("#ar_datenum").val("");		
			}
		});
		
		$(".ar_searchdate").change(function(){
			var startdate = Date.parse($("#ar_search1").val());
			var enddate = Date.parse($("#ar_search2").val());
		
			if(startdate != "" && enddate !=""){
				if(enddate<startdate){
					alert("날짜를 다시 입력해주세요.");
					$("#ar_search2").val("");
				}
				$("#ar_datenum").val(datenum);		
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
	 	/////
	 	$(".ar_selectWrap1").change(function(){
			var workname=$("#ar_workName1").val();
			
			 $.ajax({
				 type:"GET",
				 url:"./workCode",
				 data:{
					 "workname":workname
				 }, success:function(data){
					  $("#ar_memWorkCode1").val(data); 
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
		
		
		$(".ar_memberWorkUpdate").click(function(){
			var num=$(this).attr("title");
			
			alert(num);
			
			$.ajax({
				type:"GET",
				url:"./memberWorkUpdate",
				data:{
					"num":num
				}, success:function(data){
					$(".ar_selectWrap1").html("");
					
					var i=0;
					
					$(data[1]).each(function(){
						if(data[0].workname==data[1][i]){
							$(".ar_selectWrap1").append("<option selected='selected' class=ar_updateList value="+data[1][i]+">"+data[1][i]+"</option>");
						}else	{
							$(".ar_selectWrap1").append("<option  class=ar_updateList value="+data[1][i]+">"+data[1][i]+"</option>");
						}					
							i++;
					});
					
					$("#ar_ustartdate").val(data[0].startdate);
					$("#ar_uenddate").val(data[0].enddate);
					$("#ar_udatenum").val(data[0].datenum);
					$("#ar_umCode").html(data[0].code);
					$("#ar_umName").html(data[0].name);
					$("#ar_umTemp").html(data[0].temp);
					$("#ar_umCode").html(data[0].code);
					$("#ar_umOther").val(data[0].other);
					$("#ar_numnum").val(data[0].num);
					$("#ar_memWorkCode1").val(data[0].workcode);
					
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
		
		$("#ar_memdiliUpdateBtn").click(function(){
			var startdate=$("#ar_ustartdate").val();
			var enddate=$("#ar_uenddate").val();
			alert(startdate);
			alert(enddate);
			
			if(startdate=="" || enddate==""){
				alert("날짜를 입력하십시오.");
			}else{
				ar_memdiliUpdate.submit();
			}
			
		});
		
		$("#ar_memdiliDeleteBtn").click(function(){
			var num = $("#ar_numnum").val();
			
			alert(num);
			
		 	$.ajax({
				type:"POST",
				url:"./memdiliDelete",
				data:{
					"num":num
				},success:function(data){
					if(data>0){
						alert("삭제되었습니다.");
						location.reload();
					}else{
						alert("삭제 실패");
					}
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
				mainTitle
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">근태항목 등록</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
				<form action="diliInput" method="POST" name="ar_memberWorkList">
					<div class="ar_plusSearch">
						근태명  
						<select class="diliselected" name="search">
							<option value="">전체</option>
							<c:forEach items="${diliNameList}" var="nameList">
								<option class="ar_selectsearch" value="${nameList }">${nameList }</option>
							</c:forEach>
						</select>
						
						<span class="ar_blanktext">기간</span>
						<input type="date" name="startdate" class="ar_searchdate" id="ar_search1" value="${startdate }"> ~ <input type="date" name="enddate"class="ar_searchdate" id="ar_search2" value="${enddate }">
						<input type="submit"  value="검색" id="ar_dsearchBtn">
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
				
				
				 <c:forEach items="${memberWorkList}" var="list"> 
					<div class="ar_listDiv">
					<input type="hidden" value="${list.num }">
						<div class="ar_CodeTitle ar_titleDiv1 ar_memberWorkUpdate" data-toggle="modal" data-target="#ar_dili2Update" title="${list.num }">${list.code}</div>
						<div class="ar_NameTitle ar_titleDiv1"> ${list.name} </div>
						<div class="ar_NameTitle ar_titleDiv1"> ${list.temp} </div>
						<div class="ar_SecTitle1 ar_titleDiv1"> ${list.workcode} </div>
						<div class="ar_SecTitle1 ar_titleDiv1">${list.workname} </div>
						<div class="ar_SecTitle1  ar_titleDiv1"> ${list.startdate} </div>
						<div class="ar_SecTitle1 ar_titleDiv1"> ${list.enddate} </div>
						<div class="ar_DateTitle ar_titleDiv1"> ${list.datenum} </div>
						<div class="ar_OtherTitle ar_titleDiv1"> ${list.other} </div>
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
					        		<input type="date" class="ar_dateWrap" id="ar_date1" name="startdate" title="insert">~<input type="date" class="ar_dateWrap"   title="insert"id="ar_date2" name="enddate">
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
				          <h4 class="modal-title">| 근태 수정</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <div class="modal-body">
				        
				        <form name="ar_memdiliUpdate" method="POST" action="memdiliUpdate">
				        
				        <div class="modal_topWrap">
					        	<div class="ar_salInsert" >
					        	<input type="hidden" id="ar_numnum" name="num">
					        		<span class="ar_positiontext">근태항목</span>
									<select class="ar_selectWrap1" name="workname" id="ar_workName1">
										
									</select>				        		
					        	</div>
					        	
					        	<input type="hidden" id="ar_memWorkCode1" name="workcode">
					        	
					        	<div class="ar_salInsert2" >
					        		<span class="ar_positiontext">기간</span>
					        		<input type="date" name="startdate" id="ar_ustartdate" class="ar_dateWrap" title="update">~<input type="date"name="enddate" id="ar_uenddate" class="ar_dateWrap" title="update">
					        	</div>
					        	
					        	<div class="ar_salInsert3" >
					        		<span class="ar_positiontext">일수</span>
					        		<input type="text" readonly="readonly" name="datenum"  id="ar_udatenum">
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
				        			<div class=" ar_mem"  >
						        		<p id="ar_umCode" ></p>
						        	</div>
						        	
						        	<div class=" ar_mem" >
						        		<p id="ar_umName"></p>
						        	</div>
						        	
						        	<div class=" ar_mem"  >
						        		<p id="ar_umTemp"></p>
						        	</div>
						        	
						        	<div class=" ar_memOther" >
						        		<input type='text' id="ar_umOther" class='ar_mmmem_inputBox' name='other'>
						        	</div>
				        	</div>
				</form>		
		</div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <input type="button" class="btn btn-default" id="ar_memdiliUpdateBtn" data-dismiss="" value="수정">
				          <input type="button" class="btn btn-default" id="ar_memdiliDeleteBtn" data-dismiss="" value="삭제">
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