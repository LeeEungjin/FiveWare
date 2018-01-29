<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/human/basisInfo/positionPlus.css" rel="stylesheet">

<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		$("#positionBtn").click(function(){
			var rank = $("#porank").val();
			var ranking=$("#poranking").val();
				
			if(rank==""){
				alert("직책명을 입력하십시오.");
			}else if(ranking==""){
				alert("직책순위를 입력하십시오.");
			}else{
				$(this).attr("data-dismiss", "modal");
				 positionFrm.submit();
				
			}
			
		});
		
		$("#UpdateBtn").click(function(){
			positionFrm2.submit();
		});
		
		$(".ar_code").click(function(){
			var code = $(this).html().trim();
			
			$.ajax({
				type:"GET",
				url:"./positionUpdate",
				data:{
					"code" : code
				}, success:function(data){
					$("#ppcode").val(data.code);
					$("#ppname").val(data.rank);
					$("#ppranking").val(data.ranking);
				}
			});
		});
		
		
		$("#ar_deleteBtn").click(function(){
			var count = 0;
			var code="";
			var cod=[];
			
			$(".ar_pselect").each(function(d){
				if(this.checked){
					code=$(this).attr("id");
					count++;
					cod.push(code);
				}
			});
				$.ajax({
					type: "POST",
					url: "./positionDelete",
					data:{
						"code" : cod.toString()
					}, success:function(data){
						 alert(count+"개의 직책이 삭제되었습니다.");
					
						 location.reload();
				
				}
			
			});
		});
		
		$("#ar_insertBtn").click(function(){
			
			$.ajax({
				type:"GET",
				url:"../../codeName",
				data:{  },
				success:function(data){
					$("#pocode").val(data);
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
			<div class="fw_menu fw_selected" data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				기초정보
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse in" id="sub1">
				<ul>
					<li> <a href="#">직책 등록 </a></li>
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
			
			<!-- -------------------- -->
				
			
		<!-- submenu menu end -->
	</div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<div id="event_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">직급 등록</p>
			</div>
			
				
			<form action="positionPlus" method="GET">
			<div id="erp_jh_event_sub">
				<div id="event_contents">
						<p>　</p>
							직급명  <input type="text" name="search" id="ar_psearch">
							<input type="submit" value="검색" id="ar_psearchBtn">
						<p>　</p>
				</div>
			</div>
			</form>
			
			<div class="ar_plusDivWrap">
				<div class="ar_titleDiv">
					<div class="ar_titleCheck ar_titleDiv1" ><input type="checkbox">	</div>
					<div class="ar_titleCode ar_titleDiv1"> 직급코드 </div>
					<div class="ar_titleName ar_titleDiv1"> 직급명 </div>
					<div class="ar_titleRank ar_titleDiv1"> 직급순위 </div>
					<div class="ar_titleUse ar_titleDiv1"> 사용여부 </div>					
					<div class="ar_titleOther ar_titleDiv1"> 비고</div>
				</div>
				
				<c:forEach items="${positionList }" var="list">
					<div class="ar_listDiv">
						<div class="ar_titleCheck ar_listDiv1" ><input type="checkbox"  class="ar_pselect" id="${list.code}">	</div>
						<div class="ar_titleCode ar_listDiv1 ar_code"   id="pcode" data-toggle="modal" data-target="#ar_positionUpdate" > ${list.code }</div>
						<div class="ar_titleName ar_listDiv1" id="pname"> ${list.rank } </div>
						<div class="ar_titleRank ar_listDiv1" id="prank"> ${list.ranking } </div>
						<div class="ar_titleUse ar_listDiv1" id="puse"> ${list.use } </div>					
						<div class="ar_titleOther ar_listDiv1" id="pother">${list.other } </div>
					</div>
				</c:forEach>
			</div>
			
			<div class="ar_plusButtonWrap">
				<input type="button" id="ar_deleteBtn" value="선택 삭제">
				<input type="button" id="ar_insertBtn" data-toggle="modal" data-target="#ar_positionInsert" value="신규 등록">
			</div>
			
			<!-- Modal -->
				
				<div class="modal fade" id="ar_positionInsert" role="dialog">
					<form action="positionPlus" method="POST" name="positionFrm">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">| 직책 등록</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					        <!-- modal contents -->
					        <div class="modal-body">
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">직책코드</span>
					        		<input type="text" name="code" class="arin_pcodeInput1" id="pocode" readonly="readonly">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext1">직책명</span>
					        		<input type="text" name="rank" class="arin_pcodeInput" id="porank">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">직책순위</span>
					        		<input type="text" name="ranking" class="arin_pcodeInput" id="poranking">
					        	</div>
							
					        </div>
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="" id="positionBtn">등록</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      	<!-- modal footer 끝-->
					      </div>
					    </div>
					    </form>
				  </div>
				<!-- Modal 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="ar_positionUpdate" role="dialog">
					<form action="positionUpdate" method="POST" name="positionFrm2">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">| 직책 수정</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					        <!-- modal contents -->
					        <div class="modal-body">
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">직책코드</span>
					        		<input type="text" name="code" class="arin_pcodeInput1"  id="ppcode" readonly="readonly">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext1">직책명</span>
					        		<input type="text" name="rank" class="arin_pcodeInput" id="ppname" readonly="readonly">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
					        		<span class="ar_positiontext">직책순위</span>
					        		<input type="text" name="ranking" class="arin_pcodeInput" id="ppranking">
					        	</div>
					        	
					        	<div class="ar_positionInsert" >
				        		<span class="ar_positiontext">사용여부</span>
				        		<select name="use" class="ar_sselect">
				        			<option value="사용" selected="selected">예</option>
				        			<option value="미사용" >아니오</option>	
				        		</select>
				        	</div>
							
					        </div>
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal" id="UpdateBtn">수정</button>
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      	<!-- modal footer 끝-->
					      </div>
					    </div>
					    </form>
				  </div>
				<!-- Modal 끝 -->
	</div>
</div>

</body>
</html>