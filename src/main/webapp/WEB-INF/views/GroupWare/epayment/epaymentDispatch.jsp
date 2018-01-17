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
	 
	 /*view  */
	  $(".eb_viewBtn").click(function(){
	 	 var num=$(this).attr("title");
		 
		 $.ajax({
			type : "get",
			url : "./epaymentView",
			data : {"num" : num},
			success : function(data){
				$("#eb_viewNum").text(data.num);
				$("#eb_viewDraftdate").text(data.draftdate);
				$("#eb_viewDraftname").text(data.draftname);
				$("#eb_viewDrafttemp").text(data.drafttemp);
				$("#eb_viewTitle").text(data.title);
				$("#eb_viewContents").text(data.contents);
				$("#eb_viewApproval").text(data.approval);
				$("#eb_viewApprovaltemp").text(data.approvaltemp);
				$("#eb_viewResult").text(data.result);
			},error : function(){
				alert("error");
			}
		 }); 
	 }); 
	 

});

</script>
<body>
<c:import url="${url}/resources/temp/headerExample.jsp"></c:import> 

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
				결재함
				<div class="fw_arrow sub1">
					∧
				</div>
			</div>
			
			<div class="fw_subselected collapse" id="sub1">
				<ul>
					<li> <a href="./epaymentPendency">미결함</a> </li>
					<li> <a href="./epaymentDetermine">기결함</a> </li>
					<li> <a href="./epaymentReturn">반려함</a> </li>
				</ul>
			</div>
			
			<!-- ----------2---------- -->
				<div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub2" title="sub2" >
					발신함
				<div class="fw_arrow sub2">
					∨
				</div>
			</div>
			
			<div class="fw_subsub collapse in"  id="sub2">
				<ul>
					<li> 기안 상신함</li>
					<li> 임시보관함</li>
					<li> <a href="./epaymentDispatch">내 결재 보기</a></li>
				</ul>
			</div>
			
			<!-- -------------------- -->
				<div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
					수신함
				<div class="fw_arrow sub3" >
					
				</div>
			</div>
			
		
</div>

	<div id="fw_mainwrap">
			<div id="fw_main">
				main Title
			</div>
			
			<div class="ar_plusTitle">
				<p id="ar_plustext">내 결제 보기</p>
			</div>
			
			<div class="ar_plusSearchWrap">
				<div class="ar_blank"></div>
				
			<form action="positionPlus" method="GET">
				<div class="ar_plusSearch">
					내가 올린 결재들만 보기
					</div>
			</form>
			</div>
			
			<div id="ar_mainDivWrap">
	
				
				<div id="ar_inhabitTableWrap">
					<div id="ar_tableTop">
				
						
						<form action="./epaymentDispatch" action="get">
							
							<input type="hidden" name="curPage" value="1">
							<input type="hidden" name="memberCode" value="${member.code }">
						
						<input type="submit" id="ar_searchBtn" value="검색">
						
						<input type="text" id="ar_searchInput" name="search">
						
							<select id="ar_searchTitle" name="kind">
								<option value="title">문서 제목</option>
								<option value="draftdate">기안 날짜</option>
								<option value="approvaltemp">승인 부서</option>
								<option value="result">결과</option>
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
									<th> 승인 부서 </th>
									<th> 기안 날짜 </th>
									<th> 상태 </th>
									<th> 첨부 </th>
								</tr>
							</thead>
							
							<tbody>
								 <c:if  test="${empty epaymentList}"> 
									<tr>
										<td colspan="8" style="text-align: center;"><p>결재 목록이 없습니다.</p></td>
									</tr>
								 </c:if> 
								 
								 <c:if test="${not empty epaymentList}">
								 <c:forEach items="${epaymentList }" var="dto">
								 	<tr>
									<td>${dto.num }</td>
									<td>${dto.title }</td>
									<td>${dto.draftname }</td>
									<td>${dto.drafttemp }</td>
									<td>${dto.approvaltemp }</td>
									<td>${dto.draftdate }</td>
									<td>${dto.result }</td> 
									<td></td>
									<td><input type="button" value="상세보기" class="eb_viewBtn" title="${dto.num}"  data-toggle="modal" data-target="#myModal"></td>
								</tr>
								</c:forEach>
								</c:if>
							</tbody>
						
						</table>
			 
					</div>
					
					
					<!-- view Modal -->
						<div class="modal fade" id="myModal" role="dialog">
						    <div class="modal-dialog">
						    
						      <!-- Modal content-->
						      <div class="modal-content">
						        <div class="modal-header">
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						          <h4 class="modal-title">내 결재 보기</h4>
						        </div>
						        <div class="modal-body"  id="eb_modal" >
						         
						         <table  id="eb_modal_table">
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">상태</td>
						         		<td class="eb_modal_table_td" colspan="3"><span id="eb_viewResult"></span></td>
						         	
						         	</tr>
						         
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">문서 번호</td>
						         		<td class="eb_modal_table_td"><span id="eb_viewNum"></span></td>
						         		<td class="eb_modal_table_td_1">기안 날짜</td>
						         		<td class="eb_modal_table_td"><span id="eb_viewDraftdate"></span></td>
						         	</tr>
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">기안 부서</td>
						         		<td><span id="eb_viewDrafttemp"></span></td>
						         		<td class="eb_modal_table_td_1">기안자</td>
						         		<td><span id="eb_viewDraftname"></span></td>
						         	</tr>
						         	
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">승인 부서</td>
						         		<td><span id="eb_viewApprovalTemp"></span></td>
						         		<td class="eb_modal_table_td_1">결재선</td>
						         		<td><span id="eb_viewApproval"></span></td>
						         	</tr>
						         	
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1">제목</td>
						         		<td colspan="3"><span id="eb_viewTitle"></span></td>
						         	</tr>
						         
						         	<tr class="eb_modal_tr">
						         		<td class="eb_modal_table_td_1" id="eb_modal_tr_id">내용</td>
						         		<td colspan="3"><span id="eb_viewContents"></span></td>
						         	</tr>
						         
						         </table>
						        </div>
						        <div class="modal-footer">
						        	<input type="button" class="btn btn-default" id="eb_Delete" value="삭제" >
						          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        </div>
						      </div>
						      
						    </div>
						  </div>
							
					
					
					
					
					
		  
				
				</div>
			</div>
			
			
			
	</div>
</div>


</body>
</html>