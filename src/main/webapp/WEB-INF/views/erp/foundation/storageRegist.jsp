<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<c:set value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" var="url" />
	<link href="${url}/resources/css/erp/storageRegist.css" rel="stylesheet">
	<link href="${url}/resources/css/common/modal_boot.css" rel="stylesheet">
	<c:import url="${url}/resources/temp/ref.jsp"></c:import> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var message = '${message}';
		if(message != ""){
			swal(message);
		}
		
		var kind='${pager.kind}';
		$(".op").each(function(){
			if($(this).val()==kind){
				$(this).attr("selected", true);
			}
		});
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			var s = '${pager.search}';
			var t = '${pager.kind}';
			document.sr_search_frm.curPage.value=cur;
			document.sr_search_frm.search.value=s;
			document.sr_search_frm.kind.value=t;
			document.sr_search_frm.submit();
		});
		
		$(".sr_btn").click(function(){
			$("#sr_frm").submit();
		});
		
		$(".storageView").click(function() {
			var code=$(this).attr("title");
			$.ajax({
				data : {"storageCode" : code},
				url : "./storageView",
				type : "get",
				success : function(data){
					$(".viewCode").val(data.storageRegistDTO.storageCode);
					$(".viewName").val(data.storageRegistDTO.storageName);
					$(".viewAddr").val(data.storageRegistDTO.storageAddr);
					$(".viewOp").html(data.storageRegistDTO.storageOp);
					$(".viewImg").val(data.storageRegistDTO.imgNull);
					
					F_FileMultiUpload_Callback(data.files, 'result_one');
				},
				error : function(data){
					swal("error");
				}
			});
		});
		
		$(".srUpdate").click(function(){
			$("#sr_update_frm").submit();
		});
		
		$(".srDelete").click(function(){
			var code=$(".viewCode").val();
			$.ajax({
				data : {"storageCode" : code},
				url : "./storageDelete",
				type : "get",
				success : function(data){
					swal("삭제 완료");
					location.reload();
				},
				error : function(data){
					swal("error");
				}
			});
		});
		
		$("#sr_insert").click(function(){
			$.ajax({
				type:"GET",
				url:"../../codeName",
				data:{  },
				success:function(data){
					$("#storageCode").val(data);
				}
			});
		});
		
		///////////////////////File Cancel/////////////////////////////////////
		$(".sr_file_cancel").click(function() {
			var code=$("#storageCode").val();
			var path=$("#path").val();
			
			$.ajax({
				url: "../../ajax/fileDelete",
				type: "POST",
				data: {
					"code" : code,
					"path" : path
				},
				success: function() { }
			});
			
			
			/* $("#sr_frm").attr("action", "../../ajax/fileDelete");
			$("#sr_frm").submit(); */
		});
		
		//////////////////////////File Upload//////////////////////////////////
		var obj = $(".dropzone");

	     obj.on('dragenter', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css('border', '2px solid #5272A0');
	     });

	     obj.on('dragleave', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	          $(this).css('border', '2px dotted #8296C2');
	     });

	     obj.on('dragover', function (e) {
	          e.stopPropagation();
	          e.preventDefault();
	     });

	     obj.on('drop', function (e) {
	          e.preventDefault();
	          $(this).css('border', '2px dotted #8296C2');

	          var files = e.originalEvent.dataTransfer.files;
	          
	          console.log(files);
	          
	          if(files.length < 1)
	               return;
	          
	          var mode = 'result';
	          var code = document.getElementById('storageCode').value;
	          if(code == '') {
	        	  code = document.getElementById('sr_update_code').value;
	        	  mode = 'result_one';
	          }
	          
	          F_FileMultiUpload(files, code, mode);
	     });
		
	});
	
	
	function F_FileMultiUpload(files, code, mode) {
		
		for(var i=0; i<files.length; i++) {
			var ext = files[i].name.split('.',2)[1];
			if(ext != 'jpg') {
				swal("Error", "사진파일만 올릴 수 있습니다.");
				return false;
			}
		}
		
		var len = 0;
		
		$.ajax({
			url: '../../ajax/fileList',
			data: {'code': code},
			async: false,
			success:function(result) {
				len = result.length;
			}
		});
		
		if( (files.length+len) < 5 ) {
	         var data = new FormData();
	         for (var i = 0; i < files.length; i++) {
	        	console.log(files[i]);
	            data.append('file', files[i]);
	         }
	         
	         data.append('code', code)
	    
	         var url = "../../ajax/drapAndDrop";
	         $.ajax({
	            url: url,
	            method: 'post',
	            data: data,
	            processData: false,
	            contentType: false,
	            success: function(data) {
	            	F_FileMultiUpload_Callback(data, mode);
	            	
	            },
	            error: function() {
	            	swal("error");
	            }
	         });
		} else {
			swal("4개까지 이미지를 업로드할 수 있습니다.");
		}
	    
	}

	// 파일 멀티 업로드 Callback
	function F_FileMultiUpload_Callback(files, result) {
	    var result = document.getElementById(result);
		for(var i=0; i < files.length; i++){
		    var img = document.createElement('img');
		    img.setAttribute("src", "${pageContext.request.contextPath}/resources/product/"+files[i].filename);
		    img.setAttribute("title", files[i].fnum)
		    img.className = "img_margin ej_img_btn";
		    img.onclick = function() {
		    	if(confirm("삭제하시겠습니까?") == true) {
			    	var temp = this;
			    	console.log(temp);
					var fnum = this.getAttribute('title');
					
					$.ajax({
						url: '../../ajax/fileDeleteOne',
						data: {'fnum': fnum},
						success:function(result) {
							swal("삭제되었습니다.");
							temp.remove();
						}
					});
		    	}
		    };
		    result.appendChild(img);
		}
	}
</script>

<style>
    .dropzone
    {
        border:2px dotted #CE3636;
        width:100%;
        height:50px;
        color:#CE3636;
        text-align:center;
        font-size:24px;
        padding:10px;
    }
    #result, #result_one {
    	width: 100%;
    	height: 150px;
    }
    
    .img_margin {
   		width: 20%;
    	height: 150px;
    	margin-left: 2.5%;
    	margin-right: 2.5%;
    }
    
</style>

</head>
<body>

<c:import url="/WEB-INF/views/headerExample.jsp"></c:import> 
<c:import url="/WEB-INF/views/message.jsp"></c:import> 

<div id="fw_container">
	<!-- submenu -->
	<div id="fw_subcontainer">
   
      <!-- submenu banner -->
      <div id="fw_subbanner">
         구매/영업
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
               <li><a href="../foundation/supplier">거래처 등록</a></li>
               <li><a href="../foundation/product">제품 등록</a></li>
               <li><a href="./menuRegist">메뉴 등록</a></li>
               <li><a href="./storageRegist">창고 등록</a></li>
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
               <li><a href="../order/orderRegist">주문 입력</a></li>
               <li><a href="../order/graph/orderGraph">주문 현황 보기</a></li>
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
               <li><a href="../../erp/into/intoList">조회 및 엑셀 다운</a></li>
            </ul>
         </div>
         
      <!-- submenu menu end -->
   </div>
	<!-- submenu end -->
	
	<!-- --------------------------------------------------------------------------------------------------------------- -->
	
	<div id="fw_mainwrap">
			<div id="fw_main">
				<div id="sr_icon"><img id="logoImg" src="${pageContext.request.contextPath}/resources/images/logo/smallLogo.png"></div>
				<!-- <div class="sales_title_menu">기초 정보</div>
				<div class="sales_title_menu">구매 관리</div>
				<div class="sales_title_menu">자재 관리</div>
				<div class="sales_title_menu">반품 관리</div>
				<div class="sales_title_menu">조 회</div> -->
			</div>
			
			<div id="fw_main_contents">
				<div id="erp_jh_contents_title">
					
					<p id="sr_title">창고등록</p>
				</div>
				<div id="erp_jh_contents_search">
					<div id="sr_search">
						<!-- 검색 기능 -->
							<!-- select box -->
							<div class="input-group">
							<form action="./storageRegist" name="sr_search_frm" method="get">
								<input type="hidden"  name="curPage" value="${list.curPage}">
								<select class="form-control" id="sel1" name="kind">
							        <option class="op" value="storagename">창고명</option>
							        <option class="op" value="storagecode">창고코드</option>
							        <option class="op" value="storageaddr">주소</option>
							     </select>							
							<!-- select box 끝 -->
						
						      <input id="storageSearchInput" name="search" type="text" class="form-control" placeholder="Search" name="search">
						      
						      <div class="input-group-btn">
						        <button  id="search_btn" class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
						      </div>
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
						        <th>창고코드</th>
						        <th>창고명</th>
						        <th>개요</th>
						        <th>주소</th>
						        <th>첨부파일</th>
						      </tr>
						    </thead>
						    
						    <tbody>
						    <c:forEach items="${sr_list}" var="sr_list">
						      <tr>
						        <td>${sr_list.storageCode}</td>
						        <td  class="storageView"  title="${sr_list.storageCode}" id="jh_bold_text" data-toggle="modal" data-target="#jh_sr_update_Modal">${sr_list.storageName }</td>
						        <td>${sr_list.storageOp }</td>
						        <td>${sr_list.storageAddr }</td>
						        <td>
						        	<c:if test="${sr_list.imgNull eq 'true'}">
						        		<img src="${pageContext.request.contextPath}/resources/images/common/icon_file.gif">
						        	</c:if>
						        	<c:if test="${sr_list.imgNull ne 'true'}">
						        		-
						        	</c:if>
						        </td>
						      </tr>
						    </c:forEach>
						    </tbody>
						 </table>
						 
						 <!-- pager -->
						 	<div id="sr_pager">
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
					<c:if test="${member.temp == '영업/구매부'}">
						<button id="sr_insert" class="modal_btn btn-default btn" data-toggle="modal" data-target="#jh_sr_Modal">신규등록</button>
					</c:if>
					</div>
				<!-- 등록 버튼 끝 -->
				
				<!-- Modal -->
				
				<div class="modal fade" id="jh_sr_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close sr_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|창고 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				         <form action="./storagetWrite" method="post" id="sr_frm">
				         <input type="hidden" id="path" name="path" value="storageRegist">
				         <input type="hidden" name="imgNull" value="false">
				        <div class="modal-body storageRegistInsertModal">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고코드</span>
							  <input name="storageCode" id="storageCode" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고명</span>
							  <input name="storageName" id="msg" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">개요</span>
							   <textarea name="storageOp" class="form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							  <input name="storageAddr" id="msg" type="text" class="form-control" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal or_input-group_modal_2">
							  <div class="dropzone">Drag & Drop Files Here</div> 
							</div>
							
							<div class="input-group input-group_modal or_input-group_modal_2">
							  <div id="result"></div>
							</div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default sr_btn" data-dismiss="modal">등록</button>
				          <button type="button" class="btn btn-default sr_file_cancel" data-dismiss="modal">Close</button>
				        </div>
				        </form>
				      	<!-- modal footer 끝-->
				      </div>
				    </div>
				  </div>
				<!-- Modal 끝 -->
				
				
				<!-- 수정 Modal -->
				
				<div class="modal fade" id="jh_sr_update_Modal" role="dialog">
				    <div class="modal-dialog modal-m">
				      <div class="modal-content">
				      
				      	<!-- modal header -->
				        <div class="modal-header">
				          <button type="button" class="close sr_file_cancel" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">|창고 등록</h4>
				        </div>
				        <!-- modal header 끝-->
				        
				        <!-- modal contents -->
				        <form action="./storageUpdate" method="post" id="sr_update_frm">
				        <div class="modal-body">
				        	<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고코드</span>
							  <input readonly="readonly" name="storageCode" id="sr_update_code" type="text" class="form-control viewCode"  placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">창고명</span>
							  <input name="storageName" type="text" class="form-control viewName"placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">개요</span>
							   <textarea name="storageOp" class="viewOp form-control form-control_area" rows="5" id="comment"></textarea>
							</div>
							
							<div class="input-group input-group_modal">
							  <span class="input-group-addon">주소</span>
							  <input type="text" class="form-control viewAddr" name="storageAddr" placeholder="Additional Info">
							</div>
							
							<div class="input-group input-group_modal or_input-group_modal_2">
							  <div class="dropzone">Drag & Drop Files Here</div> 
							</div>
							
							<div class="input-group input-group_modal or_input-group_modal_2">
							  <div id="result_one"></div>
							</div>
							
				        </div>
				        <!-- modal contents 끝-->
				        
				        <!-- modal footer -->
				        <div class="modal-footer">
				        <c:if test="${member.temp eq '영업/구매부'}">
				          <button type="button" class="btn btn-default srUpdate" data-dismiss="modal">수정</button>
				          <button type="button" class="btn btn-default srDelete" data-dismiss="modal">삭제</button>
				        </c:if>
				          <button type="button" class="btn btn-default sr_file_cancel" data-dismiss="modal">Close</button>
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