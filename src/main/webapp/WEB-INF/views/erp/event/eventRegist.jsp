<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/eventRegist.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
	<script src="//cdn.ckeditor.com/4.8.0/basic/ckeditor.js"></script>
	
<title>Insert title here</title>

<script type="text/javascript">
	$(function(){
		var message = '${message}';
		
		CKEDITOR.replace('eventoption');
		CKEDITOR.replace('updateEventOption');
		
		if(message != ""){
			swal(message);
		}
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			
			alert(cur);
			
			document.event_search_frm.curPage.value=cur;
			document.event_search_frm.submit();
		});
		
		
		$("#event_search_btn").click(function(){
			
			var sdate=$("#sdate").val();
			var edate=$("#edate").val(); 
			
		 	if(sdate=="" || edate==""){
		 		swal("기간을 입력해주세요.");
			}else{ 
				
				$.ajax({
					type : "GET",
					url : "./eventDateList",
					data : {
						sdate : sdate,
						edate : edate
					},
					success:function(data){
						alert(data);
						$("#erp_jh_contents_table").html(data);
					}
				});
			}
		});
		
		$("#eventDateReset").click(function(){
			location.reload();
		});
		
		$("#allcheck").click(function() {
			if($("#allcheck").prop("checked")){
				$(".eventCheck").prop("checked", true);
			}else{
				$(".eventCheck").prop("checked", false);
			}
		});
		
		$(".eventRegistBtn").click(function(){
			
			var eventName=$("#eventname").val();
			var temp=$("#temp").val();
			var eventSdate=$("#eventsdate").val();
			var eventEdate=$("#eventedate").val();
			var eventOption=$("#eventoption").val();
			var eventFile=$("#eventfile").val();
			
			if(eventName==""){
				swal("이벤트명을 입력해주세요.");
			}else if(temp==""){
				swal("부서명을 입력해주세요.");
			}else if(eventSdate==""){
				swal("이벤트 시작 기간을 입력해주세요.");
			}else if(eventEdate==""){
				swal("이벤트 마감 기간을 입력해주세요.");
			}else if(eventOption==""){
				swal("이벤트 설명을 입력해주세요.");
			}else if(eventFile==""){
				swal("첨부파일을 입력해주세요.");
			}else{
				$("#eventfrm").submit();
				$(".eventRegistBtn").attr("data-dismiss", "modal");
			}
			
		});
		
		$(".eventView").click(function() {
			var eventNum=$(this).attr("title");
			
			$.ajax({
				data : {"eventNum" : eventNum},
				url : "./eventView",
				type : "get",
				success : function(data){
					
					console.log(data.file.filename);
					
					$("#eventImg").attr("src", "${pageContext.request.contextPath}/resources/upload/"+data.file.filename);
					$("#eventImg").val(data.file.filename);
					
					$(".eventNum").val(data.event.eventNum);
					$(".eventName").val(data.event.eventName);
					$(".temp").val(data.event.temp);
					$(".eventSdate").val(data.event.eventSdate);
					$(".eventEdate").val(data.event.eventEdate);
					$(".eventOption").html(data.event.eventOption)
					
					$(".eventDeleteBtn").attr("title", data.event.eventNum);
					
				},
				error : function(data){
					swal("error");
				}
			});
			
			$("#imgChange").click(function(){
				$("#img_update_div").append("<input type=\"file\" id=\"img_update\" name=\"files\">");
			});
			
			$(".eventUpdateBtn").click(function(){
				$("#eventUpdatefrm").submit();
			});
			
		});
		
		$("#event_checkDelete").click(function(){
			var count=0;
			var num=0;
			var codeAr=[];
			
			$(".eventCheck").each(function(){
				
				if(this.checked){
					num=$(this).attr("title");
					count++;
					codeAr.push(num);
				}
			});
				if(codeAr.length<1){
					swal("삭제할 메뉴를 선택해주세요.");
				}else{
			
				for(var i=0; i<codeAr.length; i++){
					$.ajax({
						type : "POST",
						url : "./eventDelete",
						data : {
							"eventNum" : codeAr[i]
						}, success : function(data){
							swal("삭제되었습니다.");
							location.reload();
						}
						});
					}
				}
				
		});
		
		
		$(".eventDeleteBtn").click(function(){
			
			var eventNum=$(this).attr("title");
			
			location.href="./eventDelete?eventNum="+eventNum;
		});
		
		
	});
	
	
</script>
<style type="text/css">
#eventImg{
	width:150px;
	height: 150px;
}

</style>
</head>
<body>

<c:import url="${url}/resources/temp/headerExample.jsp"></c:import>

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
   
      <!-- submenu banner -->
      <div id="fw_subbanner">
         자재관리
      </div>
      <!-- submenu banner end -->
      
      <!-- submenu menu -->
         <div class="fw_menu fw_selected" data-toggle="collapse" data-target="#sub1" title="sub1">
            기초정보
            <div class="fw_arrow sub1">
               ∧
            </div>
         </div>
         
         <div class="fw_subselected collapse in" id="sub1">
            <ul>
               <li><a href="./../erp/foundation/supplier">거래처 등록</a></li>
               <li><a href="./../erp/foundation/product">제품 등록</a></li>
               <li><a href="./../erp/foundation/menuRegist">메뉴 등록</a></li>
               <li><a href="./../erp/foundation/storageRegist">창고 등록</a></li>
            </ul>
         </div>
         
         <!-- ----------2---------- -->
            <div class="fw_menu" data-toggle="collapse" data-target="#sub2" title="sub2" >
               구매관리
            <div class="fw_arrow sub2">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub2">
            <ul>
               <li><a href="../erp/order/orderRegist">주문 입력</a></li>
            	<li><a href="../erp/order/graph/orderGraph">주문 현황 보기</a></li>
            </ul>
         </div>
         
         <!-- ----------3---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub3" title="sub3" >
               자재관리
            <div class="fw_arrow sub3">
               ∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub3">
            <ul>
               <li><a href="../../erp/mater/materRegist?materKind=enter">입고 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=rele">출고 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=back">반품 입력</a></li>
               <li><a href="../../erp/mater/materRegist?materKind=confin">불출 입력</a></li>
            </ul>
         </div>
         
         <!-- ----------4---------- -->
         <div class="fw_menu" data-toggle="collapse" data-target="#sub4" title="sub4" >
               	조회
            <div class="fw_arrow sub4">
               	∨
            </div>
         </div>
         
         <div class="fw_subsub collapse"  id="sub4">
            <ul>
               <li><a href="../../ware/erp/into/intoList">조회 및 엑셀 다운</a></li>
            </ul>
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">

			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					<div id="event_icon">icon</div>
					<p id="event_title">이벤트 등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="event_search">
						<!-- 검색 기능 -->
							<!-- select box -->
						
								<div class="input-group">
								
									<form action="./eventRegist" name="event_search_frm" method="get">
										<input type="hidden" name="curPage" value="1">
										
										<span id="eventListEegistText">이벤트 기간 선택&nbsp;&nbsp;</span><input id="sdate" name="sdate" type="date">&nbsp;~&nbsp;<input id="edate" name="edate" type="date">		
								        <button type="button" id="event_search_btn" class="btn btn-default"><i class="fa fa-search"></i></button>
								      
								      <input id="eventDateReset" class="btn btn-default" type="button" value="초기화">
																
								      
							       </form>	
							    </div>
						   
						<!-- 검색 기능 끝 -->
						
						
					</div>
				</div>
				
				<!-- table -->
					<div id="erp_jh_contents_table">
						<table class="table">
						    <thead>
						      <tr>
						        <th><input type="checkbox" id="allcheck"></th>
						        <th>코드</th>
						        <th>이벤트명</th>
						        <th>부서</th>
						        <th>기간</th>
						        <th>첨부파일</th>
						      </tr>
						    </thead>
						    
							<tbody>
							    <c:forEach items="${eventList}" var="list">
									<tr>
										<td><input type="checkbox" class="eventCheck" title="${list.eventNum}"></td>
										<td>${list.eventNum}</td>
										<td class="eventView" title="${list.eventNum}" data-toggle="modal" data-target="#jh_event_update_Modal">${list.eventName}</td>
										<td>${list.temp}</td>
										<td>${list.eventSdate}~${list.eventEdate}</td>
										<td><img src="${pageContext.request.contextPath}/resources/images/common/icon_file.gif"></td>
									</tr>
								</c:forEach>
							</tbody>
							
						 </table>
						 
						 <!-- pager -->
						 		<div id="event_pager">
							 		  <c:if test="${pager.curBlock gt 1}">
										<span class="list" title="${pager.startNum-1}">[이전]</span>
									</c:if>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
										<span class="list" title="${i}">${i}</span>
									</c:forEach>
									<c:if test="${pager.curBlock lt pager.totalBlock}">
										<span class="list" title="${pager.lastNum+1}">[다음]</span>
									</c:if>
							 	</div>
						 <!-- pager 끝 -->
					</div>
				<!-- table 끝 -->
				
				<!-- 등록 버튼 -->
					<div id="erp_jh_contents_bottom">
						<button id="event_checkDelete" class="btn btn-default">선택삭제</button>
						<button class="modal_btn btn btn-default" data-toggle="modal" data-target="#jh_event_Modal">신규등록</button>
						
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="jh_event_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|이벤트 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="./eventInsert" method="post" id="eventfrm" enctype="multipart/form-data">
				        
				        
				        <div class="modal-body eventInsertModalBody">
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">이벤트명*</span>
							  <input id="eventname" name="eventName" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">등록 부서</span>
							  <input id="temp" name="temp" type="text" class="form-control"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">기간</span>
							  <input id="eventsdate" name="eventSdate" type="date" class="form-control">
							  &nbsp;&nbsp;-<input id="eventedate" name="eventEdate" type="date" class="form-control input-group_modal" >
							</div>
							
							<div class="form-group">
						      <div id="area_text"><label class="jh_label" for="comment">이벤트 설명을 작성해주세요.</label></div> 
						      <textarea id="eventoption" name="eventOption" class="form-control form-control_area" rows="5"></textarea>
						    </div>
						    
						    <div>
						    	<input id="eventfile" name="files" type="file">
						    </div>

				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer" id="eventModalFooter">
				          <input type="button" class="btn btn-default eventRegistBtn"  value="등록">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				       </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				<!-- --------------------------------------------------------------------------------------------------------- -->
				
				
				<!-- 수정 Modal -->
					<div class="modal fade" id="jh_event_update_Modal" role="dialog">
					    <div class="modal-dialog modal-m">
					      <div class="modal-content">
					      
					      	<!-- modal header -->
					        <div class="modal-header">
					          <button type="button" class="close jh_file_cancel" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">|이벤트 확인 및 수정</h4>
					        </div>
					        <!-- modal header 끝-->
					        
					        <!-- modal contents -->
					        <form action="./eventUpdate" method="post" id="eventUpdatefrm" enctype="multipart/form-data">
					        
					        
					        <div class="modal-body eventUpdateModalBody">
								<div class="input-group input-group_modal">
								  <span class="input-group-addon">이벤트 번호</span>
								  <input name="eventNum" type="text" class="eventNum form-control" readonly="readonly">
								</div>
								
								<div class="input-group input-group_modal">
								  <span class="input-group-addon">이벤트명*</span>
								  <input name="eventName" type="text" class="eventName form-control" placeholder="Additional Info">
								</div>
								
								<div class="input-group input-group_modal">
								  <span class="input-group-addon">등록 부서</span>
								  <input name="temp" type="text" class="temp form-control"  placeholder="Additional Info">
								</div>
								
								<div class="input-group input-group_modal">
								  <span class="input-group-addon">기간</span>
								  <input name="eventSdate" type="date" class="eventSdate form-control"  placeholder="Additional Info">
								  &nbsp;&nbsp;-<input name="eventEdate" type="date" class="eventEdate form-control"  placeholder="Additional Info">
								</div>
								
								<div class="form-group">
							      <div id="area_text"><label class="jh_label" for="comment">이벤트 설명을 작성해주세요.</label></div> 
							      <textarea id="updateEventOption" name="eventOption" class="eventOption form-control form-control_area" rows="5"></textarea>
							    </div>
							    
							    <div>
							    	<img name="files" id="eventImg">
							    	<input type="button" id="imgChange" value="이미지 변경">
							    	<div id="img_update_div">
							    	
							    	</div>
							    	
							    </div>
	
					        </div>
					        <!-- modal contents 끝-->
					        
					        <!-- modal footer -->
					        <div class="modal-footer">
					          <input type="button" class="btn btn-default eventUpdateBtn"  value="수정">
					          <input type="button" class="btn btn-default eventDeleteBtn"  value="삭제">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					       </form>
					      	<!-- modal footer 끝-->
					      </div>
					    </div>
					  </div>
				
				<!-- 수정 Modal 끝 -->
				
				
			</div>
		</div>
	</div>
</body>
</html>