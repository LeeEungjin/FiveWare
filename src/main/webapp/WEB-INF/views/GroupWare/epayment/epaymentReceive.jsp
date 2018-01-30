<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
 
 <link href="${url}/resources/css/GroupWare/epayment/epaymentPendency.css" rel="stylesheet">

<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	
	var message="${message}";
	
	if(message!=""){
		alert(message);
	}
	
	var kind = "${kind}";
	
	if(kind=="code"){
		kind="title";
	}
	
	$("#ar_searchTitle").val(kind);
	
	 /*page 처리  */
	  $(".eb_list").click(function(){
			
			var cur=$(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.frm.curPage.value=cur;
			document.frm.search.value=s;
			document.frm.kind.value=t;
			document.frm.submit();
		});
	 
	 $(".eb_viewBtn").click(function(){
		 var docunum=$(this).attr("title");
		 
		 $.ajax({
			 type:"GET",
			 url:"./epaymentContents",
			 data:{
				 "docunum" : docunum,
				 statenum:'${type }'
			 },success:function(data){
				 $(".modal-dialog").html(data);
				 
				var num = document.getElementsByClassName("ar_backstamp") ;
				
				 for(var i=0; i<num.length; i++){
/* 					 alert($("#ar_signBoxBasis"+docunum+i).attr("title"));
 */					 if($("#ar_signBoxBasis"+docunum+i).attr("title")=="1"){
						 $("#ar_signBoxBasis"+docunum+i).addClass("ar_approvalimg");
					 }else if($("#ar_signBoxBasis"+docunum+i).attr("title")=="-1"){
						 $("#ar_signBoxBasis"+docunum+i).addClass("ar_refuse");
					 }
					 
				 }
				 }
		 });
	 });
	 
	 $(".ar_paging").click(function(){
		var curPage=$(this).attr("id");
		
		document.frm.curPage.value=curPage;
		document.frm.submit();
		
	 });
	 
	$(".modal").on("click", "#ar_approvalok" ,function(){
		 var docunum=$(this).attr("title");
		 var approvalname="기결";
		 var approvalcode=$("#ar_test").val();
		 var ranking=$("#"+"${member.code}").val();
			alert(ranking);
		 location.href="./stampok?docunum="+docunum+"&approvalname="+approvalname+"&ranking="+ranking+"&approvalcode="+approvalcode;
		
		 // 이런 방법도 있다 (참고)
		 /*$.ajax({
			type:"GET",
			url:"./stampok",
			data:{
				"docunum":docunum
			},success:function(data){
				alert(data);
				$("#ar_afterBtn").css("display", "block");
				$("#ar_beforeBtn").css("display", "none");
			
				window.reload;
			}
		}); */
	});
	
	$(".modal").on("click", "#ar_approvalno" ,function(){
		var docunum=$(this).attr("title");
		var approvalname="반려";
		 var approvalcode=$("#ar_test").val();
		
		location.href="./stampok?docunum="+docunum+"&approvalname="+approvalname+"&approvalcode="+approvalcode;
	});
	 
	

});

</script>
<body>
<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
	
		<!-- submenu banner -->
		<div id="fw_subbanner">
			전자결재
		</div>
		<!-- submenu banner end -->
		
		<!-- submenu menu -->
			<div class="fw_menu " data-toggle="collapse" data-target=".fw_subselected" title="sub1">
				전체 결재함
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="./epaymentTotalList?state=미결">미결함</a> </li>
					<li> <a href="./epaymentTotalList?state=기결">기결함</a> </li>
					<li> <a href="./epaymentTotalList?state=반려">반려함</a> </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu " data-toggle="collapse" data-target="#sub2" title="sub2" >
					발신함
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse "  id="sub2">
				<ul>
					<li>  <a href="./formList?curPage=1">기안 상신함</a></li>
					<li> <a href="./epaymentStorageList?state=임시저장">임시보관함</a></li>
					<li> <a href="./myEpayment">내 결재 보기</a></li>
				</ul>
			</div>
			
			<!-- -------------------- -->
					<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub3" title="sub3" >
					수신함
				<div class="fw_arrow sub3">
					∨
				</div>
				</div>
			
				<div class="fw_subsub collapse in"  id="sub3">
					<ul>
					<li> <a href="./epaymentReceive?statenum=0">미결함</a> </li>
					<li> <a href="./epaymentReceive?statenum=1">기결함</a> </li>
					<li> <a href="./epaymentReceive?statenum=-1">반려함</a> </li>
					</ul>
				</div>
			
		
</div>

	<div id="fw_mainwrap">
			<div id="fw_main">
				<img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png">
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">${title }</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank">
				<p>　</p>
				<p>내가 받은 ${title }</p>
				<p>　</p>
				</div>
				
					
			</div>
			
			<div id="ar_mainDivWrap">
	
				
				<div id="ar_inhabitTableWrap">
					<div id="ar_tableTop">
				
						
						<form action="./epaymentReceive"  action="get" name="frm">
							<input type="hidden" name="statenum" value="${type }">
							<input type="hidden" name="curPage" value="1">
							<input type="hidden" name="memberCode" value="${member.code }">
						
						<input type="submit" id="ar_searchBtn" value="검색">
						
						<input type="text" id="ar_searchInput" name="search" value="${search }">
						
							<select style="height: 26px;" id="ar_searchTitle" name="kind"  >
								<option value="title">문서 제목</option>
								<option value="draftdate">기안 날짜</option>
								<option value="kind">문서 유형</option>
								<option value="state">결과</option>
							</select>
				
						</form>	
							
					</div>
					
					<div id="ar_tableWrap">
						<table class="table" id="eb_table">
							<thead>
								<tr>
									<th> No </th>
									<th> 문서 제목 </th>
									<th> 기안자 </th>
									<th> 기안 부서 </th>
									<th> 문서 유형 </th>
									<th> 기안 날짜 </th>
									<th> 상태 </th>
									<th> 첨부 </th>
								</tr>
							</thead>
							
							<tbody>
								 <c:if  test="${empty list}"> 
									<tr>
										<td colspan="8" style="text-align: center;"><p>결재 목록이 없습니다.</p></td>
									</tr>
								 </c:if> 
								 
							 <c:if test="${not empty list}">
								 <c:forEach items="${list }" var="dto" varStatus="i">
								 	<tr>
								 	<input type="hidden" value="${dto.docunum }" id="ar_docunum">
										<td>${dto.num }</td>
										<td>${dto.title }</td>
										<td>${dto.draftname }</td>
										<td>${dto.drafttemp }</td>
										<td>${dto.kind }</td>
										<td>${dto.draftdate }</td>
										<td>${dto.state}</td> 
										<td>
											<c:if test="${file[i.index].size() ==  0}">
												없음
											</c:if>  
											
											<c:if test="${file[i.index].size() !=  0}">
												${file[i.index].size()}개
											</c:if>  
											
										</td>
										<td><input type="button" value="상세보기" class="eb_viewBtn"  data-toggle="modal" data-target="#myModal" title="${dto.docunum }" id="ar_epaylong"></td>
								</tr>
								</c:forEach>
								</c:if> 
							</tbody>
						
						</table>
			 
					</div>
					<div id="epayPager">
						<c:if test="${pager.curBlock>1}">
							<span class="ar_paging" id="${pager.startNum-1 }">이전</span>
						</c:if>
					
						<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" var="i">
							<span class="ar_paging" id="${i }">${i }</span>
						</c:forEach>
						
						<c:if test="${pager.curBlock<pager.totalBlock}">
							<span class="ar_paging" id="${pager.lastNum+1 }">다음</span>
						</c:if>
					</div>
					
					<!-- view Modal -->
						<div class="modal fade" id="myModal" role="dialog">
						    <div class="modal-dialog">
						    
						   
						      
						    </div>
						  </div>
				</div>
			</div>
			
			
			
	</div>
</div>


</body>
</html>